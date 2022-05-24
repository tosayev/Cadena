# Ethereum 101

## Create a Wallet for the Course & Get Same Fake Ether
Since I knew I might be sharing my progress and work publicly, my first step was to create a crypto wallet (must be on the Rinkeby Test Network) dedicated for this course, unrelated to my identity.

I created the wallet with my favourite [MetaMask](https://metamask.io/).  I have been using MetaMask since 2017 and it has never failed me.

Next up, I needed some fake ether so I got some from the [Rinkeby Faucet](https://www.rinkebyfaucet.com/).  Just put in my public key and 0.1 (fake) ETH was immediately deposited in my wallet.

## Creating Your first Smart Contract
Although the instructions on Cadena recommend users to start their first smart contract on [Remix, IDE](http://remix.ethereum.org/), I like to make my life difficult and instead opted out for doing the entire courese in Visual Studio.  This turned out to be more difficult than I thought.

### Problems with Visual Studio
To start working with smart contracts on Visual Studio, I first needed to (download the package that allows for Solidity syntax highlighting)(https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity) - pretty straightforward.

Next up, I needed to install [Truffle Suite](https://trufflesuite.com/) - a development environment, testing framekwork and asset pipeline for blockchains using the Ethereum Virtual Machine (EVM) (source: [https://trufflesuite.com/](https://trufflesuite.com/)).  Unfortunately, this was easier said than done.

Although in Visual Studio it was showing that Truffle was installed, the required folders & files were missing from the npm folder.  I searched around and looks like many people faced this issue and it was usually a question of updating node.js.  I already had the latest version of node.js so that did not work.  I downgraded my node.js to a previous version and that didn't work either.

Then, I did a clean uninstall of node.js and reinstalled it.

```
PS C:\Users\Kazim\Documents\GitHub\Cadena\Ethereum 101> npm install -g truffle      
npm WARN deprecated mkdirp-promise@5.0.1: This package is broken and no longer maintained. 'mkdirp' itself supports promises now, please switch to that.
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
npm WARN deprecated ipld-raw@6.0.0: This module has been superseded by the multiformats module
npm WARN deprecated cids@1.1.9: This module has been superseded by the multiformats module
npm WARN deprecated ipld-dag-cbor@0.17.1: This module has been superseded by @ipld/dag-cbor and multiformats
npm WARN deprecated multicodec@1.0.4: This module has been superseded by the multiformats module
npm WARN deprecated @nodefactory/filsnap-adapter@0.2.2: Package is deprecated in favour of @chainsafe/filsnap-adapter
npm WARN deprecated uuid@2.0.1: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm WARN deprecated multibase@0.7.0: This module has been superseded by the multiformats module
npm WARN deprecated multibase@0.6.1: This module has been superseded by the multiformats module
npm WARN deprecated uuid@3.2.1: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated uuid@3.2.1: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated uuid@3.3.2: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated multibase@4.0.6: This module has been superseded by the multiformats module
npm WARN deprecated multibase@4.0.6: This module has been superseded by the multiformats module
npm WARN deprecated multibase@4.0.6: This module has been superseded by the multiformats module
npm WARN deprecated multibase@3.1.2: This module has been superseded by the multiformats module
npm WARN deprecated multicodec@0.5.7: This module has been superseded by the multiformats module
npm WARN deprecated ipld-dag-pb@0.20.0: This module has been superseded by @ipld/dag-pb and multiformats
npm WARN deprecated multicodec@3.2.1: This module has been superseded by the multiformats module
npm WARN deprecated node-pre-gyp@0.11.0: Please upgrade to @mapbox/node-pre-gyp: the non-scoped node-pre-gyp package is deprecated and only the @mapbox scoped package will recieve updates in the future
npm WARN deprecated multicodec@2.1.3: This module has been superseded by the multiformats module
npm WARN deprecated multicodec@2.1.3: This module has been superseded by the multiformats module
npm WARN deprecated multicodec@2.1.3: This module has been superseded by the multiformats module
npm WARN deprecated cids@0.7.5: This module has been superseded by the multiformats module
npm ERR! code 1
npm ERR! path C:\Users\Kazim\AppData\Roaming\npm\node_modules\truffle\node_modules\ganache\node_modules\keccak
npm ERR! command failed
npm ERR! command C:\WINDOWS\system32\cmd.exe /d /s /c node-gyp rebuild
npm ERR! gyp info it worked if it ends with ok
npm ERR! gyp info using node-gyp@9.0.0
npm ERR! gyp info using node@16.15.0 | win32 | x64
npm ERR! gyp info find Python using Python version 3.10.4 found at "C:\Python310\python.exe"
npm ERR! gyp ERR! find VS
npm ERR! gyp ERR! find VS msvs_version not set from command line or npm config
npm ERR! gyp ERR! find VS VCINSTALLDIR not set, not running in VS Command Prompt
npm ERR! gyp ERR! find VS checking VS2019 (16.11.32510.428) found at:
npm ERR! gyp ERR! find VS "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools"
npm ERR! gyp ERR! find VS - found "Visual Studio C++ core features"
npm ERR! gyp ERR! find VS - missing any VC++ toolset
npm ERR! gyp ERR! find VS could not find a version of Visual Studio 2017 or newer to use
npm ERR! gyp ERR! find VS looking for Visual Studio 2015
npm ERR! gyp ERR! find VS - not found
npm ERR! gyp ERR! find VS not looking for VS2013 as it is only supported up to Node.js 8
npm ERR! gyp ERR! find VS
npm ERR! gyp ERR! find VS **************************************************************
npm ERR! gyp ERR! find VS You need to install the latest version of Visual Studio
npm ERR! gyp ERR! find VS including the "Desktop development with C++" workload.
npm ERR! gyp ERR! find VS For more information consult the documentation at:
npm ERR! gyp ERR! find VS https://github.com/nodejs/node-gyp#on-windows
npm ERR! gyp ERR! find VS **************************************************************
npm ERR! gyp ERR! find VS
npm ERR! gyp ERR! configure error
npm ERR! gyp ERR! stack Error: Could not find any Visual Studio installation to use
npm ERR! gyp ERR! stack     at VisualStudioFinder.fail (C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\find-visualstudio.js:122:47)
npm ERR! gyp ERR! stack     at C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\find-visualstudio.js:75:16
npm ERR! gyp ERR! stack     at VisualStudioFinder.findVisualStudio2013 (C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\find-visualstudio.js:363:14)
npm ERR! gyp ERR! stack     at C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\find-visualstudio.js:71:14
npm ERR! gyp ERR! stack     at C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\find-visualstudio.js:384:16
npm ERR! gyp ERR! stack     at C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\util.js:54:7
npm ERR! gyp ERR! stack     at C:\Program Files\nodejs\node_modules\npm\node_modules\node-gyp\lib\util.js:33:16
npm ERR! gyp ERR! stack     at ChildProcess.exithandler (node:child_process:406:5)
npm ERR! gyp ERR! stack     at ChildProcess.emit (node:events:527:28)
npm ERR! gyp ERR! stack     at maybeClose (node:internal/child_process:1092:16)
npm ERR! gyp ERR! System Windows_NT 10.0.19044
npm ERR! gyp ERR! command "C:\\Program Files\\nodejs\\node.exe" "C:\\Program Files\\nodejs\\node_modules\\npm\\node_modules\\node-gyp\\bin\\node-gyp.js" "rebuild"
npm ERR! gyp ERR! cwd C:\Users\Kazim\AppData\Roaming\npm\node_modules\truffle\node_modules\ganache\node_modules\keccak
npm ERR! gyp ERR! node -v v16.15.0
npm ERR! gyp ERR! node-gyp -v v9.0.0
npm ERR! gyp ERR! not ok

npm ERR! A complete log of this run can be found in:
npm ERR!     C:\Users\Kazim\AppData\Local\npm-cache\_logs\2022-05-24T20_41_45_027Z-debug-0.log
```