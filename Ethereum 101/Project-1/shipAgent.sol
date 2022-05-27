// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract shipAgent {
    // Declare state variables at contract level.  These variables
    // will be stored on the blockchain and cost gas.
    address public shipOwner;
    string public shipIMO;
    mapping (address => uint256) public ownerBalance; //create mapping


    //constructor will only run once, when the contract is deployed
    constructor {
        // We're setting the ship owner to the Ethereum address that deploys
        // the contract.  msg.sender is a global variable that stores the address
        // of the account that initiates the transaction.

        shipOwner = msg.sender;
    }

    function depositMoney() public payable {
        // This function is to allow the ship owner to deposit funds.
        require(msg.value != 0, "You need to deposit some amount of money!");
        customerBalance[msg.sender] += msg.value;
    }

    function setShipIMO(string memory _name) external {
        require(msg.sender == shipOwner, "You must be the ship owner to set the IMO number of the ship");
        shipIMO = _name;
    }

}