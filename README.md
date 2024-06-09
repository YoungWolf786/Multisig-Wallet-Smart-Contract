# MultiSig Wallet Smart Contract

This repository contains the implementation of a Multi-Signature (MultiSig) Wallet smart contract in Solidity, designed to be deployed on the Ethereum blockchain. The MultiSig Wallet allows multiple parties to agree on transactions before execution, enhancing security by reducing the risk of unauthorized transfers.

## Features

- **Multiple Owners:** The wallet can have multiple owners, and transactions require approval from a majority of the owners.
- **Transaction Proposals:** Owners can propose transactions which need to be confirmed by a specified number of owners.
- **Transaction Execution:** Once a transaction receives the required number of confirmations, it can be executed.
- **Owner Management:** Owners can be added or removed through consensus among the current owners.
- **Safe and Secure:** Reduces the risk of funds being moved without consensus.

## Prerequisites

- **Solidity**: ^0.8.0
- **Remix IDE**: Recommended for deploying and interacting with the contract.
- **Metamask**: For deploying and managing the contract through a browser extension.

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/multisig-wallet.git
cd multisig-wallet
```

### 2. Open Remix IDE

Navigate to [Remix IDE](https://remix.ethereum.org/).

### 3. Load the Contract

- In Remix, create a new file named `MultiSigWallet.sol`.
- Copy and paste the contents of `MultiSigWallet.sol` from this repository into the new file.

### 4. Compile the Contract

- Select the `Solidity Compiler` plugin from the left panel.
- Ensure the compiler version is set to at least `0.8.0`.
- Click `Compile MultiSigWallet.sol`.

### 5. Deploy the Contract

- Select the `Deploy & Run Transactions` plugin from the left panel.
- Choose your environment (e.g., JavaScript VM, Injected Web3 for MetaMask).
- Set the constructor parameters:
  - `_owners`: An array of owner addresses.
  - `_numConfirmationsRequired`: The number of confirmations required to execute a transaction.
- Click `Deploy`.

## Contract Details

### Constructor

```solidity
constructor(address[] memory _owners, uint _numConfirmationsRequired)
```

- `_owners`: List of owner addresses.
- `_numConfirmationsRequired`: Number of confirmations required for executing a transaction.

### Functions

- `submitTransaction(address _to, uint _value, bytes memory _data)`: Submits a transaction for approval.
- `confirmTransaction(uint _txIndex)`: Confirms a transaction.
- `executeTransaction(uint _txIndex)`: Executes a transaction if it has enough confirmations.
- `revokeConfirmation(uint _txIndex)`: Revokes a confirmation.
- `addOwner(address _owner)`: Adds a new owner.
- `removeOwner(address _owner)`: Removes an owner.
- `replaceOwner(address _owner, address _newOwner)`: Replaces an existing owner with a new owner.
- `changeRequirement(uint _numConfirmationsRequired)`: Changes the number of required confirmations.

### Events

- `SubmitTransaction(address indexed owner, uint indexed txIndex, address indexed to, uint value, bytes data)`
- `ConfirmTransaction(address indexed owner, uint indexed txIndex)`
- `RevokeConfirmation(address indexed owner, uint indexed txIndex)`
- `ExecuteTransaction(address indexed owner, uint indexed txIndex)`
- `Deposit(address indexed sender, uint value, uint balance)`
- `OwnerAddition(address indexed owner)`
- `OwnerRemoval(address indexed owner)`
- `RequirementChange(uint required)`



## Security Considerations

- Ensure the initial owners and the required number of confirmations are set correctly.
- Only trusted addresses should be added as owners.
- Regularly review the list of owners and required confirmations.



