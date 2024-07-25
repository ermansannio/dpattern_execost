contract W4T {
function registerZone(bytes8 zone) external onlyOwner {
        zones[zone] = true;
        ZoneRegister(zone);
    }
}