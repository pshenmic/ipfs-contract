// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract IpfsStorage is Ownable {

    event IpfsFileAdded(uint256 index);

    string[] private files;
    uint256 len = 0;

    function addFile(string memory ipfsHash) public onlyOwner returns (bool) {
        files.push(ipfsHash);
        len = len + 1;
        emit IpfsFileAdded(len - 1);
        return true;
    }


    function getFile(uint256 index) public view returns (string memory) {
        return files[index];
    }
}
