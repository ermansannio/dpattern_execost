contract SingleSourceAuthority {
function approveAuthority(address authorityAddress) public restricted() {
        Authority memory authority = Authority({
            valid: true,
            authorizedBy: msg.sender,
            revokedBy: 0x0,
            validFrom: block.number,
            validTo: 0
        });
        authorities[authorityAddress] = authority;
    }
}