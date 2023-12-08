pragma solidity ^0.8.20;

import {SigExtractor} from "../src/SigExtractor.sol";
import {Utils} from "./utils/Utils.sol";
import {console} from "forge-std/console.sol";
import {Test} from "forge-std/Test.sol";

contract BaseSetup is SigExtractor, Test {
    Utils internal utils;
    address payable[] internal users;

    
    address internal alice;
    address internal bob;

    bytes32  contractOwner = keccak256(abi.encodePacked("owner address"));
    address ownerAddress = address(uint160(uint256(contractOwner)));


    function setUp() public virtual {
        utils = new Utils();
        users = utils.createUsers(2);

        alice = users[0];
        vm.label(alice, "Alice");
        bob = users[1];
        vm.label(bob, "Bob");
    }
}
 
 contract WhenVerifyingAttestor is BaseSetup {
    function setUp() public virtual override {
        BaseSetup.setUp();
    }

    function testShouldRecover() public {
        string memory message = "0x000000000000000100000002000000000000000d00000000000000000000000074fd5221dfcf8059a95e934cd31694c224d0643b0000000000000000000000000f5078e4bb393df0286d31759c0c6da63ea98451000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000db98a5bfba239000213813b2615b8a96e950a79b3cd0a705a2dc65e5b1e1205896baa2be8a07c6e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000009949f7e672a568bb3ebeb777d5e8d1c1107e96e5";
        string memory attestation = "0x82ea18e68774628e1452389eca8e2f90c948ed9a02036d05d9b469180f5c853e5559ff0c80bcc0b26abc583ec3f8a6ddd4afc9c0b34b7c85d61dbb3203422e971c";

        address recovered = SigExtractor.extract( vm.parseBytes(message), vm.parseBytes(attestation));
        console.log(recovered);
    }


 }