// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract FiddyCent is ERC20, ERC20Burnable, ERC20Pausable, AccessControl {
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event To(address indexed to);
    event Amount(uint256 indexed amount);

    constructor(address defaultAdmin, address pauser, address minter)
        ERC20("FiddyCent", "FDDC")
    {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(PAUSER_ROLE, pauser);
        _mint(msg.sender, 1000000000 * 10 ** decimals());
        _grantRole(MINTER_ROLE, minter);
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    //function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
    //    _mint(to, amount);
    //}

    function mint(address to, uint256 amount) public returns (bool)  {
        if (!hasRole(MINTER_ROLE, msg.sender)) {
            revert ("Caller is not a minter");
        }
        if(to == address(0)) {
            revert ("ERC20InvalidReceiver Cannot mint to zero address");
        }

        //emit To(to);
        //emit Amount(amount);
        
        _mint(to, amount);
       return true;
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}
