# CredainPayments
**


## Table of contents:
- [Variables](#variables)
- [Functions:](#functions)
  - [`constructor(address _sender, address _receiver, address _currency, uint256 _amountToPay)` (public) ](#credainpayments-constructor-address-address-address-uint256-)
  - [`withdrawAmount(uint256 _amount)` (public) ](#credainpayments-withdrawamount-uint256-)
  - [`claimAmount() → bool` (public) ](#credainpayments-claimamount--)
  - [`initiatePayoutStage1()` (public) ](#credainpayments-initiatepayoutstage1--)

## Variables <a name="variables"></a>
- `address sender`
- `address receiver`
- `address currency`
- `uint256 startTime`
- `uint256 lastClaimed`
- `uint256 amountToPay`
- `uint256 remainingAmountToPay`
- `uint256 withdrawableAmount`
- `address designatedSigner`
- `mapping(uint256 => uint256) everyWeekPayouts`

## Functions <a name="functions"></a>

### `constructor(address _sender, address _receiver, address _currency, uint256 _amountToPay)` (public) <a name="credainpayments-constructor-address-address-address-uint256-"></a>

*Description*: public Function to mint NFTs


#### Params
 - `_sender`: Token uri for the token to be minted  

 - `_receiver`: Token uri for the token to be minted  

 - `_currency`: Token uri for the token to be minted  

 - `_amountToPay`: Token uri for the token to be minted

### `withdrawAmount(uint256 _amount)` (public) <a name="credainpayments-withdrawamount-uint256-"></a>

*Description*: Public functions which is used to withdraw funds of receiver   


#### Params
 - `_amount`: Amount of funds need to withdraw

### `claimAmount() → bool` (public) <a name="credainpayments-claimamount--"></a>

*Description*: Public functions which is used to claim the amount

### `initiatePayoutStage1()` (public) <a name="credainpayments-initiatepayoutstage1--"></a>

*Description*: Internal functions which is used to initiate payouts for stage 1
