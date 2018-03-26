pragma solidity ^0.4.18;

contract Token
{
	string internal _symbol;
	string internal _name;
	uint8 internal _decimals;	
    	uint256 internal _totalSupply;
   	mapping(address =>uint) internal _balanceOf;
	mapping(address => mapping(address => uint)) internal _allowances;

    function Token(string symbol, string name, uint8 decimals, uint totalSupply) public{
	    _symbol = symbol;
		_name = name;
		_decimals = decimals;
		_totalSupply = totalSupply;
    }

	function name() public constant returns (string){
        	return _name;    
	}

	function symbol() public constant returns (string){
        	return _symbol;    
	}

	function decimals() public constant returns (uint8){
		return _decimals;
	}

	function totalSupply() public constant returns (uint){
        	return _totalSupply;
	}
}