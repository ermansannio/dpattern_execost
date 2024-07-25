contract W4T {
function transferDomain(bytes8 zone, string domain, address newOwner) external {
        uint domainLength = bytes(domain).length;
        require(domainLength >= 2 && domainLength <= 32);
        bytes32 domainBytes = stringToBytes32(domain);
        require(zones[zone]);
        require(domains[zone][domainBytes] == msg.sender);
        
        domains[zone][domainBytes] = newOwner;
        DomainTransfer(zone, domain, newOwner);
    }
}