contract TokenTransferTest {
function testBadWithGoodInterface(address token,
                                      uint ercType,
                                      address to,
                                      uint value)
        external
    {
        if (ercType == 1) {
            GoodERC20 goodErc20 = GoodERC20(token);
            require(goodErc20.transfer(to, value));
        } else {
            BadERC20 badErc20 = BadERC20(token);
            badErc20.transfer(to, value);
        }
    }
}