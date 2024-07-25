contract GuaGuaMiaoMiaoMemories {
function addMemoryImageSlice(uint256 _index, bytes _imageSlice) external onlyGuaGuaMiaoMiao {
        require(_index >= 0 && _index < memories.length);
        memories[_index].imageSlices[memories[_index].imageSliceCount] = _imageSlice;
        memories[_index].imageSliceCount += 1;
    }
}