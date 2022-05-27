// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract shipAgent {
    // Declare state variables at contract level.  These variables
    // will be stored on the blockchain and cost gas therefore should only
    // be the most critical variables required to execute the contract.
    address public agencyOwner; // need to know who owns the agency.  Only the agency owner can change the name of the agency
    string public shipIMO; // need to uniqely identify the ship with IMO number
    string public netTonnage; // need to ensure the paid fee corresponds to the required amount according to the net tonnage
    mapping (address => uint256) public ownerBalance; // create mapping


    //constructor will only run once, when the contract is deployed
    constructor() {
        // We're setting the ship owner to the Ethereum address that deploys
        // the contract.  msg.sender is a global variable that stores the address
        // of the account that initiates the transaction.
        agencyOwner = msg.sender;
    }
    function setShipIMO(string memory _name) external {
        // This function sets the IMO number of the ship.  Only the owner is allowed to declare the ship's IMO number.
        require(msg.sender == agencyOwner, "You must be the ship owner to set the IMO number of the ship");
        shipIMO = _name;
    }

    function setShipNetTonnage(string memory _tonnage) external {
        // This function sets the net tonnage of the ship.  Only the owner is allowed to declare the ship's net tonnage.
        require(msg.sender == agencyOwner, "You must be the ship owner to set the net tonnage of the ship");
        netTonnage = _tonnage;
    }

    function depositMoney() public payable {
        // This function is to allow the ship owner to deposit funds into the agents account
        // which practically means paying the DA.
        require(msg.value != 0, "You need to deposit some amount of money!");
        ownerBalance[msg.sender] += msg.value;
    }
        
    function withdrawMoney(address payable _to, uint256 _total) public {
        // In case the owner overpays there needs to be a way for them to withdraw the extra amount.  This function
        // allows the owner to withdraw any amount up to the credit balance.
        require(_total <= ownerBalance[msg.sender], "You have insufficient funds to withdraw.");
        ownerBalance[msg.sender] -= _total;
        _to.transfer(_total);
    }

    function getOwnerBalance() external view returns (uint256) {
        // This function returns the owners's balance with the agent.
        return ownerBalance[msg.sender];
    }
    
    function getDABalance() public view returns (uint256) {
        // We want only the ship owner to see all balances they may/may not have with the agent.
        require(msg.sender == agencyOwner, "You must be the owner of the ship to see all balances.");
        return address(this).balance;
    }
}