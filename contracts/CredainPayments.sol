// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./lib/CurrencyTransferLib.sol";

contract CredainPayments {
    
    address public sender;
    address public receiver;
    address public currency;
    uint256 public startTime;
    uint256 public lastClaimed;
    uint256 public amountToPay;
    uint256 public remainingAmountToPay;
    uint256 public withdrawableAmount;
    address public designatedSigner;

    // @notice 1st week -> amount
    mapping(uint256 => uint256) public everyWeekPayouts;


    /**
     * @notice public Function to mint NFTs
     * @param _sender Token uri for the token to be minted  
     * @param _receiver Token uri for the token to be minted  
     * @param _currency Token uri for the token to be minted  
     * @param _amountToPay Token uri for the token to be minted  
     */
    constructor(address _sender, address _receiver, address _currency, uint256 _amountToPay) {
        require(_sender != address(0), "Invalid sender");
        require(_receiver != address(0), "Invalid receiver");
        require(_currency != address(0), "Invalid currency");
        require(_amountToPay > 0, "Invalid amountToPay");

        sender = _sender;
        receiver = _receiver;
        currency = _currency;
        startTime = block.timestamp;
        lastClaimed = startTime;
        amountToPay = _amountToPay;
        remainingAmountToPay = amountToPay;
        withdrawableAmount = 0;

    }

    /**
     * @notice Public functions which is used to withdraw funds of receiver   
     * @param _amount Amount of funds need to withdraw  
     */
    function withdrawAmount(uint256 _amount) public {
        require(msg.sender == receiver, "Invalid wallet");
        claimAmount();
        require(_amount <= withdrawableAmount, "Invalid amount");
        CurrencyTransferLib.transferCurrency(currency, sender, receiver, _amount);
    }

    /**
     * @notice Public functions which is used to claim the amount  
     */
    function claimAmount() public returns (bool) {
        // Stage 1 will automated by oracle as is it is dependent on market up conditions

        // Stage 2 Claim
        uint256 weeksAlreadyClaimed = (lastClaimed - startTime) / 7 days;
        uint256 weeksPassedSinceStart = (block.timestamp - startTime) / 7 days;
        uint256 reward;
        for (uint256 i = weeksAlreadyClaimed; i > weeksPassedSinceStart; i++) {
            reward = ((amountToPay * 20) / 100) - everyWeekPayouts[weeksAlreadyClaimed];
            withdrawableAmount += reward;
            remainingAmountToPay -= reward;
        }

        // Stage 3 Claim
        uint256 daysPassedSinceStart = (block.timestamp - startTime) / 1 days;
        if (daysPassedSinceStart > 30) {
            withdrawableAmount += remainingAmountToPay;
            remainingAmountToPay = 0;
        }

        // After claiming update lastClaimed timestamp
        lastClaimed = block.timestamp;
        return true;
    }

    /**
     * @notice Internal functions which is used to initiate payouts for stage 1     
     */
    function initiatePayoutStage1() public {
        require(msg.sender == designatedSigner, "Invalid call");
        uint256 daysPassed = (block.timestamp - startTime) / 1 days;
        uint256 reward = amountToPay / 100;
        if (daysPassed < 7 days) {
            everyWeekPayouts[0] = everyWeekPayouts[0] + reward;
            withdrawableAmount += reward;
            remainingAmountToPay -= reward;
        } else if (daysPassed > 7 days && daysPassed < 14 days) {
            everyWeekPayouts[1] = everyWeekPayouts[1] + reward;
            withdrawableAmount += reward;
            remainingAmountToPay -= reward;
        } else if (daysPassed > 14 days && daysPassed < 21 days) {
            everyWeekPayouts[2] = everyWeekPayouts[2] + reward;
            withdrawableAmount += reward;
            remainingAmountToPay -= reward;
        } else if (daysPassed > 21 days) {
            everyWeekPayouts[3] = everyWeekPayouts[3] + reward;
            withdrawableAmount += reward;
            remainingAmountToPay -= reward;
        }
    }
}
