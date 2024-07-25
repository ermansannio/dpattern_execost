contract Upload {
function getDataById(uint8 idData) constant public returns (string, string, string){
        return (data[idData].nama, data[idData].alamat, data[idData].file);
    }
}