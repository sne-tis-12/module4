// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DegenToken is IERC20{

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    address private _owner;

    uint256 private _totalSupply;

    string[] private _items = ["id : 1, DegenNFT 100 DGN", "id : 2, Degen T-shirt 200 DGN"];
    uint[] private  _price = [100, 200];


    string public _name;
    string public _symbol;


    constructor() {
        _name = "DEGEN";
        _symbol = "DGN";
        _owner = msg.sender;
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }


    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }

    
    function transfer(address to, uint256 value) external returns (bool) {
        require(_balances[msg.sender] >= value, "Insufficient balance");
        _balances[msg.sender] -= value;
        _balances[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function mint(address to, uint256 value) external returns (bool) {
        require(msg.sender == _owner, "Only owner can mint");
        _totalSupply += value;
        _balances[to] += value;
        emit Transfer(address(0), to, value);
        return true;
    }

    function burn(uint256 value) external returns (bool) {
        require(_balances[msg.sender] >= value, "Insufficient balance");
        _balances[msg.sender] -= value;
        _totalSupply -= value;
        emit Transfer(msg.sender, address(0), value);
        return true;
    }

    function getItems() external view returns (string[] memory) {
        return _items;
    }

    function redeem(uint256 id) external returns (string memory) {
        require(_balances[msg.sender] >= _price[id - 1], "Insufficient balance");
        _balances[msg.sender] -= _price[id - 1];
        _totalSupply -= _price[id - 1];
        emit Transfer(msg.sender, address(0), _price[id - 1]);
        return _items[id - 1];
    }

    
    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowances[owner][spender];
    }

   
    function approve(address spender, uint256 value) external returns (bool) {
        require(_balances[msg.sender] >= value, "Insufficient balance");
        _allowances[msg.sender][spender] += value;
        _balances[msg.sender] -= value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    
    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(_allowances[from][msg.sender] >= value, "Insufficient allowance");
        _allowances[from][msg.sender] -= value;
        _balances[to] += value;
        emit Transfer(from, to, value);
        return true;
    }
}

