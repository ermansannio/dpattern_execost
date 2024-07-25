contract SubPrimeCrypto {
function generatePresaleHouses() public onlyByOwnerOrDev onlyDuringPresale {
        uint initialGas = msg.gas;
        generateAndListPresaleHouse();

        while (msg.gas > (initialGas - msg.gas)) {
            generateAndListPresaleHouse();
        }
    }
}