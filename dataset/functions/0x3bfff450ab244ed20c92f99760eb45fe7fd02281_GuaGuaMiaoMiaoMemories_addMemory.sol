contract GuaGuaMiaoMiaoMemories {
function addMemory(string _story, bytes _imageFirstSlice) external onlyGuaGuaMiaoMiao {
        memories.push(Memory({story: _story, imageSliceCount: 0}));
        memories[memories.length-1].imageSlices[0] = _imageFirstSlice;
        memories[memories.length-1].imageSliceCount = 1;
    }
}