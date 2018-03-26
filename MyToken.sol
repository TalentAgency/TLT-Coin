pragma solidity ^0.4.18;

contract MyToken is Admined, ERC20,Token("TLT","Talent Coin",8,50000000)
{
   	mapping(address =>uint) private _balanceOf;
    mapping(address => mapping(address => uint)) private _allowances;
	bool public transferAllowed = false;
    
    modifier whenTransferAllowed() 
	{
        if(msg.sender != owner){
        	require(transferAllowed);
        }
        _;
    }
    
    function MyToken() public{
        	_balanceOf[msg.sender]=_totalSupply;
    }
    	
    function balanceOf(address _addr)public constant returns (uint balance){
       	return _balanceOf[_addr];
	}

	function transfer(address _to, uint _value)public returns (bool success){
		require(_value>0 && _value <= balanceOf(msg.sender));
            _balanceOf[msg.sender]-= _value;
           	_balanceOf[_to]+=_value;
			Transfer(msg.sender, _to, _value);
           	return true;
	}	
    
	function transferFrom(address _from, address _to, uint _value) public returns(bool success){
	require(__allowances[_from][msg.sender] > 0 && _value > 0 && __allowances[_from][msg.sender] >= _value);
        uint allowed = _allowances[_from][msg.sender];
		_balanceOf[_from] -= _value;
    	_balanceOf[_to] += _value;
		_allowances[_from][msg.sender] -= allowed;
		Transfer(_from, _to, _value);  
		return true;
   	}

	function approve(address _spender, uint _value) public returns (bool success){
    	_allowances[msg.sender][_spender] = _value;
    	return true;
	}

    function allowance(address _owner, address _spender) public constant returns(uint remaining){
    	return _allowances[_owner][_spender];
    }
        
    function allowTransfer() onlyOwner public {
        transferAllowed = true;
    }

    function burn(uint256 _value) public returns (bool) {
        require(_value <= _balanceOf[msg.sender]);
        _balanceOf[msg.sender] -= _value;
        _totalSupply -= _value;
        Burn(msg.sender, _value);
        return true;
    }
    
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(_value <= _balanceOf[_from]);
        require(_value <= _allowances[_from][msg.sender]);
        _balanceOf[_from] -= _value;
        _allowances[_from][msg.sender] -= _value;
        _totalSupply -= _value;
        Burn(_from, _value);
        return true;
    }
}