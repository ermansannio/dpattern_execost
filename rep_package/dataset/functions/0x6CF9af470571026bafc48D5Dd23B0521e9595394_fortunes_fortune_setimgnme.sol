contract fortunes {
function fortune_setimgnme(uint _idx, bytes32[144] _imgarr, bytes32 _nme) 
        public idx_inrange(_idx) only_currowner(_idx) {
        require(fortune_arr[_idx].opened, "fortune has to be opened");
        require(!fortune_arr[_idx].has_img, "image cant be reset");
        require(!fortune_arr[_idx].forsale, "fortune is selling");
        fortune_arr[_idx].original_minter = fortune_arr[_idx].current_owner;
        for(uint i = 0; i < 144; i++)
            fortune_arr[_idx].img[i] = _imgarr[i];
        fortune_arr[_idx].str_name = _nme;
        emit event_mint(_idx);
        fortune_arr[_idx].has_img = true;
    }
}