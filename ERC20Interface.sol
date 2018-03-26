pragma solidity ^0.4.18;

interface ERC20{
	function balanceOf(address _owner) public constant returns(uint);
	function transfer(address _to, uint _value) public returns(bool);
	function transferFrom(address _from, address _to, uint _value) public returns(bool);
	function approve(address _sender, uint _value) public returns (bool);
	function allowance(address _owner, address _spender) public constant returns(uint);
    	event Transfer(address indexed _from, address indexed _to, uint _value);
	event Approval(address indexed _owner, address indexed _spender, uint _value);
	event Burn(address indexedFrom,uint256 value);
}