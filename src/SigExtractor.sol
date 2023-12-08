pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "openzeppelin-contracts/utils/cryptography/MessageHashUtils.sol";

contract SigExtractor {
    function extract(bytes memory message, bytes memory attestation) public pure returns (address) {
       bytes32 digest = keccak256(message);
       //bytes32 ethSignedMessageHash = MessageHashUtils.toEthSignedMessageHash(digest);
       //return (ECDSA.recover(ethSignedMessageHash, attestation));
         return (ECDSA.recover(digest, attestation));
    }
}
