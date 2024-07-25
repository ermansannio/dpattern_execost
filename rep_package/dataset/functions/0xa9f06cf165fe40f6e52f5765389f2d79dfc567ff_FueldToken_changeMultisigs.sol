contract FueldToken {
function changeMultisigs(address _multisig, address _multisigPreICO) onlyOwner public {
        require(_multisig != address(0));
        require(_multisigPreICO != address(0));
        multisig = _multisig;
        multisigPreICO = _multisigPreICO;
        MultisigsChanged(multisig, multisigPreICO);
    }
}