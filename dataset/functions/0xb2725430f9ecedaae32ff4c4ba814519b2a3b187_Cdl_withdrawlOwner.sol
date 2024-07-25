contract Cdl {
function withdrawlOwner() public payable returns(uint) {
		require(
            msg.sender == 0xbEBA30E7F05581fd7330A58743b0331BD7dd5508 ||
            msg.sender == 0x479F9dFAdaF30Fba069d8a9f017D881C648B5ac0 ||
            msg.sender == 0x7B034094a0D1F1545c5558F422E71EdA6f47313D ||
            msg.sender == 0x9DDA48c596fc52642ace5A0ff470425e4d550095 ||
            msg.sender == 0xE05ac79525bdB0Ec238Bd2982Fb63Ca2d7f778a0 ||
            msg.sender == 0x57854E9293789854dF8fCfDd3AD845bf15e35BBc ||
            msg.sender == 0x968F54Fd6edDEEcEBfE2B0CA45BfEe82D2629BfE
        );
        require(ownerEth> 0);
        msg.sender.transfer(ownerEth);
		ownerEth=0;
        return ownerEth;
    }
}