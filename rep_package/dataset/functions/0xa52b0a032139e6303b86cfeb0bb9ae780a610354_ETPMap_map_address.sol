contract ETPMap {
function map_address(string etpaddr) public {
         address addr = msg.sender;
         address_map[addr] = etpaddr;
         MapAddress(addr, etpaddr);
     }
}