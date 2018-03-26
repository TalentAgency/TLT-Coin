pragma solidity ^0.4.18;

contract Admined{
    
    address public owner;

    function Admined() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0));      
        owner = newOwner;
    }
}