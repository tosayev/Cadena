# Ethereum 101
This is a course on Cadena that teaches how to build dapps, smart contracts, and deploy them to the Ethereum Blockchain.  This course can be completed over a weekend and includes 3 projects that can be added to your portfolio.

What makes this course extra special is the free NFT certificate you can get if you complete it within 7 days.  In order to qualify for an NFT Certificate you need to submit one of these 3 projects for review.

Needless to say, I wanted the NFT.

## Create a Wallet for the Course & Get Same Fake Ether
Since I knew I might be sharing my progress and work publicly, my first step was to create a crypto wallet (must be on the Rinkeby Test Network) dedicated for this course, unrelated to my other wallets.

I created the wallet with my favourite [MetaMask](https://metamask.io/).  I have been using MetaMask since 2017 and it has never failed me.

Next up, I needed some fake ether so I got some from the [Rinkeby Faucet](https://www.rinkebyfaucet.com/).  Just put in my public key and 0.1 (fake) ETH was immediately deposited in my wallet.

### Problems with Visual Studio
Although the instructions on Cadena recommend users to start their first smart contract on [Remix, IDE](http://remix.ethereum.org/), I like to make my life difficult and instead opted out for doing the entire courese in Visual Studio.  This turned out to be more difficult than I thought.

To start working with smart contracts on Visual Studio, I first needed to download the [package that allows for Solidity syntax highlighting](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity) - pretty straightforward.

Next up, I needed to install [Truffle Suite](https://trufflesuite.com/) - a development environment, testing framekwork and asset pipeline for blockchains using the Ethereum Virtual Machine (EVM).  Unfortunately, this was easier said than done.

Although in Visual Studio it was showing that Truffle was installed, the required folders & files were missing from the npm folder.  I searched around and looks like many people faced this issue and it was usually a question of updating node.js.  I already had the latest version of node.js so that did not work.  I downgraded my node.js to a previous version and that didn't work either.

Then, I did a clean uninstall of node.js and reinstalled it - no luck.  At this stage, I was wasting too much time trying to figure this out so I put this aside for now to just get moving through the course.

## Hello, World!
First assignment was the classic "Hello, World!" code.  Pretty straightforward.

```solidity
// SPDX-License-Identifier: MIT*
pragma solidity ^0.8.3;

contract HelloWorld {
    string public greeting = "Hello World!";
}
```
What I found interesting is that the instructions tell us to write `// SPDX-License-Identifier: MIT*` with an asterisk but this gives an error in Visual Studio and deleting the asterisk gets rid of the error.

## Bank Contract
This lesson covers the basics of a smart contract by using the example of a bank.

>Without even going to code, what are the essential functions of a bank?
>
>A bank needs to keep a total balance of their funds, allow customers to deposit money, and withdraw money, and also ensure that money is being sent and received by the right customers so that there is no theft of funds.

It's difficult as a regular program to understand how some of these financial concepts are turned into code.  I certainly struggled.  This is further complicated by the fact that now I had to think about functions that _cost real money_ to use.  Sure, in regular programming we think about memory - that's almost intuitive - but functions that actually cost money to use?  This was new to me and difficult to grasp.

This module felt heavy for me but the course does a good job of going through it step by step so I imagine most people will be able to follow easily.

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Bank {
    //declare state variables at contract level
    address public bankOwner;
    string public bankName;
    mapping(address => uint256) public customerBalance; //create mapping

    //constructor will only run once, when the contract is deployed
    constructor() {
        //we're setting the bank owner to the Ethereum address that deploys the contract
        //msg.sender is a global variable that stores the address of the account that initiates a transaction
        bankOwner = msg.sender; //initialize state variable
    }

    function depositMoney() public payable {
        require(msg.value != 0, "You need to deposit some amount of money.");
        customerBalance[msg.sender] += msg.value;
    }

    function setBankName(string memory _name) external {
        require(msg.sender == bankOwner, "You must be the owner to set the name of the bank.");
        bankName = _name;
    }

    function withdrawMoney(address payable _to, uint256 _total) public {
        require(_total <= customerBalance[msg.sender], "You have insufficient funds to withdraw.");
        customerBalance[msg.sender] -= _total;
        _to.transfer(_total);
    }

    function getCustomerBalance() external view returns (uint256) {
        return customerBalance[msg.sender];
    }
    
    function getBankBalance() public view returns (uint256) {
        //We want only the bank owner to see all balances
        require(msg.sender == bankOwner, "You must be the owner of the bank to see all balances.");
        return address(this).balance;
    }

}
```

## Moving Back to Visual Studio
The course isn't clear about whether we are supposed to continue using Remix or we should be switching over to Visual Studio / Powershell / cmd but since it starts talking about Truffle, web3.js and Hardhat, at this stage I assume I need to switch over.

*WARNING:* if you're using a public Git, create a .gitignore file in your Git and add the "bank-smartcontract" folder into it to stop uploading the entire "bank-smartcontract" folder onto the public domain.  There are some vulnerabilities and some private information in the code which would be risky to share publicly.

I was rushing through the installation of Hardhat and at first skipped the step to install the dependencies so I got an error when I tried to do `npx hardhat` so I traced my steps back, installed the dependencies (below) and it worked fine.

```
npm install --save-dev @nomiclabs/hardhat-waffle@^2.0.0 ethereum-waffle@^3.0.0 chai@^4.2.0 @nomiclabs/hardhat-ethers@^2.0.0 ethers@^5.0.0
```
=======
# Ethereum 101
This is a course on Cadena that teaches how to build dapps, smart contracts, and deploy them to the Ethereum Blockchain.  This course can be completed over a weekend and includes 3 projects that can be added to your portfolio.

What makes this course extra special is the free NFT certificate you can get if you complete it within 7 days.  In order to qualify for an NFT Certificate you need to submit one of these 3 projects for review.

Needless to say, I wanted the NFT.

## Create a Wallet for the Course & Get Same Fake Ether
Since I knew I might be sharing my progress and work publicly, my first step was to create a crypto wallet (must be on the Rinkeby Test Network) dedicated for this course, unrelated to my other wallets.

I created the wallet with my favourite [MetaMask](https://metamask.io/).  I have been using MetaMask since 2017 and it has never failed me.

Next up, I needed some fake ether so I got some from the [Rinkeby Faucet](https://www.rinkebyfaucet.com/).  Just put in my public key and 0.1 (fake) ETH was immediately deposited in my wallet.

### Problems with Visual Studio
Although the instructions on Cadena recommend users to start their first smart contract on [Remix, IDE](http://remix.ethereum.org/), I like to make my life difficult and instead opted out for doing the entire courese in Visual Studio.  This turned out to be more difficult than I thought.

To start working with smart contracts on Visual Studio, I first needed to download the [package that allows for Solidity syntax highlighting](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity) - pretty straightforward.

Next up, I needed to install [Truffle Suite](https://trufflesuite.com/) - a development environment, testing framekwork and asset pipeline for blockchains using the Ethereum Virtual Machine (EVM).  Unfortunately, this was easier said than done.

Although in Visual Studio it was showing that Truffle was installed, the required folders & files were missing from the npm folder.  I searched around and looks like many people faced this issue and it was usually a question of updating node.js.  I already had the latest version of node.js so that did not work.  I downgraded my node.js to a previous version and that didn't work either.

Then, I did a clean uninstall of node.js and reinstalled it - no luck.  At this stage, I was wasting too much time trying to figure this out so I put this aside for now to just get moving through the course.

## Hello, World!
First assignment was the classic "Hello, World!" code.  Pretty straightforward.

```solidity
// SPDX-License-Identifier: MIT*
pragma solidity ^0.8.3;

contract HelloWorld {
    string public greeting = "Hello World!";
}
```
What I found interesting is that the instructions tell us to write `// SPDX-License-Identifier: MIT*` with an asterisk but this gives an error in Visual Studio and deleting the asterisk gets rid of the error.

## Bank Contract
This lesson covers the basics of a smart contract by using the example of a bank.

>Without even going to code, what are the essential functions of a bank?
>
>A bank needs to keep a total balance of their funds, allow customers to deposit money, and withdraw money, and also ensure that money is being sent and received by the right customers so that there is no theft of funds.

It's difficult as a regular program to understand how some of these financial concepts are turned into code.  I certainly struggled.  This is further complicated by the fact that now I had to think about functions that _cost real money_ to use.  Sure, in regular programming we think about memory - that's almost intuitive - but functions that actually cost money to use?  This was new to me and difficult to grasp.

This module felt heavy for me but the course does a good job of going through it step by step so I imagine most people will be able to follow easily.

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Bank {
    //declare state variables at contract level
    address public bankOwner;
    string public bankName;
    mapping(address => uint256) public customerBalance; //create mapping

    //constructor will only run once, when the contract is deployed
    constructor() {
        //we're setting the bank owner to the Ethereum address that deploys the contract
        //msg.sender is a global variable that stores the address of the account that initiates a transaction
        bankOwner = msg.sender; //initialize state variable
    }

    function depositMoney() public payable {
        require(msg.value != 0, "You need to deposit some amount of money.");
        customerBalance[msg.sender] += msg.value;
    }

    function setBankName(string memory _name) external {
        require(msg.sender == bankOwner, "You must be the owner to set the name of the bank.");
        bankName = _name;
    }

    function withdrawMoney(address payable _to, uint256 _total) public {
        require(_total <= customerBalance[msg.sender], "You have insufficient funds to withdraw.");
        customerBalance[msg.sender] -= _total;
        _to.transfer(_total);
    }

    function getCustomerBalance() external view returns (uint256) {
        return customerBalance[msg.sender];
    }
    
    function getBankBalance() public view returns (uint256) {
        //We want only the bank owner to see all balances
        require(msg.sender == bankOwner, "You must be the owner of the bank to see all balances.");
        return address(this).balance;
    }

}
```

## Moving Back to Visual Studio
The course isn't clear about whether we are supposed to continue using Remix or we should be switching over to Visual Studio / Powershell / cmd but since it starts talking about Truffle, web3.js and Hardhat, at this stage I assume I need to switch over.

I was rushing through the installation of Hardhat and at first skipped the step to install the dependencies so I got an error when I tried to do `npx hardhat` so I traced my steps back, installed the dependencies (below) and it worked fine.

```
npm install --save-dev @nomiclabs/hardhat-waffle@^2.0.0 ethereum-waffle@^3.0.0 chai@^4.2.0 @nomiclabs/hardhat-ethers@^2.0.0 ethers@^5.0.0
```

Had to then build a test app on [POKT](https://mainnet.portal.pokt.network/#/signup) to get an end point key.  Everything straightforward, so far.

At this point, I needed to save the end point key and my crypto wallet's private key into the ".env" file we had created.  Now I know that my crypto wallet is for this lesson only, but still I am not completely certain if it can/cannot be used to attack me, I decided to make sure this ".env" file is not shared on this public GitHub repo.

At this point, had to call it a night.  Unfortunately, when I tried to continue working on this project the next day, I started getting an error when trying `npx hardhat`:
```
Error HH12: Trying to use a non-local installation of Hardhat, which is not supported.
Please install Hardhat locally using npm or Yarn, and try again.
```

Tried to reinstalling, installing, updating, clearing cache, etc. and although the first time around I got the same error, the second time around (couldn't figure out what I did different), it all went back to normal.

Few more steps and I finally deployed my contract.  It can be viewed [here](https://rinkeby.etherscan.io/address/0x0a497BD6b315f38CAbC14600fBd5A98EEdb50e31).
