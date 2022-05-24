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

To start working with smart contracts on Visual Studio, I first needed to (download the package that allows for Solidity syntax highlighting)(https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity) - pretty straightforward.

Next up, I needed to install [Truffle Suite](https://trufflesuite.com/) - a development environment, testing framekwork and asset pipeline for blockchains using the Ethereum Virtual Machine (EVM) (source: [https://trufflesuite.com/](https://trufflesuite.com/)).  Unfortunately, this was easier said than done.

Although in Visual Studio it was showing that Truffle was installed, the required folders & files were missing from the npm folder.  I searched around and looks like many people faced this issue and it was usually a question of updating node.js.  I already had the latest version of node.js so that did not work.  I downgraded my node.js to a previous version and that didn't work either.

Then, I did a clean uninstall of node.js and reinstalled it - no luck.  At this stage, I was wasting too much time trying to figure this out so I put this aside for now to just get moving through the course.