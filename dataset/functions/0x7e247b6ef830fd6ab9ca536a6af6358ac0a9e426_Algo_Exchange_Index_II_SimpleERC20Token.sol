contract Algo_Exchange_Index_II {
function SimpleERC20Token() public {
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
}