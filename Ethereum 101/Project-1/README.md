# Bosphorus Transit Agency Smart Contract
This is my project to build a smart contract based on a ship agency services for a Bosphorus transit.

## How Bosphorus Transit Agency Works
The procedure for agency nomination & service fulfillment, in reality, is as follows:
1. Ship operator nominates an agency.
2. Agency provides a preliminary disbursement account (PDA) as an estimate for the transit fees.
3. Ship operator accepts the PDA and, based on the relationship with the agency, will either:
    1. pay the PDA in full, 
    2. pay part of the PDA,
    3. or work on credit terms (not pay anything).
4. After transit completion, the agency will send an final disbursement account (FDA) and, depending on the operator's actions in the previous step, the operator will either:
    1. pay any difference between PDA and FDA,
    2. pay the difference between the initial funding amount and FDA,
    3. pay the full FDA amount.

## Benefit of  Smart Contract in Ship Agency
The different payment conditions exist because agent's have different levels of trust for ship operators.  Ship operators are often limited in cash so they also don't want to pay the full PDA in advance.  In a world with more crypto adoption, there might come a time when a ship operator could stake their crypto assets with the agent for the credit period (say 30 days) and borrow against the staked amount in the form of an overcollateralized loan until the payment is due.  This would allow agents to no longer have to consider levels of trust with customers and would also allow the operator to have access to some liquiditiy in the credit period.

This is quite complicated for the scope of this assignment so in this case I'll keep it simple: no staking, no loans, no credit terms, no escrow.  The smart contract will simply calculate the required fees and the customer will need to pay the amount to the agent for the agency to grant approval for the vessel's transit.

## Contract Design
I chose Bosphorus transit because the number of variables to calculate fees is pretty straightforward for Bosphorus transits.  To keep things even simpler, I will limit the use case to commercial cargo vessels with Net Tonnage (NT) more than 800 (there are some nuances for pleasure, passenger, navy, etc. crafts which I don't want to cover at this stage).

For simplicity, I will also exclude:
- dangerous goods surcharge
- pilotage fees
- tanker tugboat escort fees

Calculation of Sanitary Dues is as follows: `0.0604 x USD/TRY exchange rate x vessel’s NT`
Calculation of Light Dues is as follows: `0.169323 x vessel’s NT`
Calculation of Salvage Dues is as follows: `0.08063 x vessel's NT`

Although most agencies charge their service fees on a scale dependent on vessel's NT, I will keep it simple and make it a flat fee of 500 USD.

We have two counterparts to this contract:
1. Ship Operator
2. Agency Owner

This is how the contract works:
1. Agency Owner deploys the contract and names the agency.  Only the Agency Owner can name the agency.
2. Ship Operator inputs the ship's IMO number (for indetification) and Net Tonnage.
3. The contract calculates the required dues.
4. The Ship Operator needs to deposit at least the required dues.  They can do this in one transaction or multiple transactions.
5. Once the deposited amount exceeds the required dues, the Ship Operator can request clearance to transit.  Until the Ship Operator requests clearance, they will have the option to deposit or withdraw funds from their balance.
6. Once the clearance is requested & approved, the dues is deducted from the Ship Operator's balance with the agency.
7. If there are outstanding amounts, the Ship Operator can withdraw it or leave it to be used on another transit.