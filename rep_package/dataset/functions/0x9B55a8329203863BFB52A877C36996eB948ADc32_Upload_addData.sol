contract Upload {
function addData(uint8 idData, string namaData, string alamatData, string fileData) public{
        data[idData].nama = namaData;
        data[idData].alamat = alamatData;
        data[idData].file = fileData;
    }
}