contract W4T {
function registerDomain(bytes8 zone, string domain) external {
        uint domainLength = bytes(domain).length;
        require(domainLength >= 2 && domainLength <= 32);
        bytes32 domainBytes = stringToBytes32(domain);
        require(zones[zone]);
        require(domains[zone][domainBytes] == 0x0);
        
        uint amount = domainPrice;
        if (domainLength <= 4) {
            amount *= premiumDomainK ** (5 - domainLength);
        }
        burn(amount);
        domains[zone][domainBytes] = msg.sender;
        DomainRegister(zone, domain, msg.sender);
    }
}