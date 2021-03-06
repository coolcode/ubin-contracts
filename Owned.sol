pragma solidity ^0.4.11;

contract Owned{
  address owner;

  function Owned() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    _;
    //if(msg.sender!=owner) throw; _;
  }

  function getOwner() view returns (address) {
    return owner;
  }

  function changeOwner(address _newOwner) onlyOwner {
    owner = _newOwner;
  }

  function stringToBytes32(string memory source) returns (bytes32 result) {
      bytes memory tempEmptyStringTest = bytes(source);
      if (tempEmptyStringTest.length == 0) {
          return 0x0;
      }

      assembly {
          result := mload(add(source, 32))
      }
  }

}
