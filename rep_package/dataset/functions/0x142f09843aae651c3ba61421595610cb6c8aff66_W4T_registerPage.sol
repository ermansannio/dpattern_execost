contract W4T {
function registerPage(bytes8 zone, string domain, bytes32 path, string content) external {
        uint domainLength = bytes(domain).length;
        require(domainLength >= 2 && domainLength <= 32);
        bytes32 domainBytes = stringToBytes32(domain);
        require(zones[zone]);
        require(domains[zone][domainBytes] == msg.sender);
        
        burn(bytePrice * bytes(content).length);
        pages[zone][domainBytes][path] = content;
        PageRegister(zone, domain, path, content);
    }
}