contract fortunes {
function fortune_open(uint _idx) public idx_inrange(_idx) only_currowner(_idx) {
        require(!fortune_arr[_idx].opened, "fortune is already open");
        require(!fortune_arr[_idx].forsale, "fortune is selling");
        fortune_arr[_idx].original_owner = msg.sender;
        uint _ran = arand(fortune_arr[_idx].current_owner, now)%1000;
        uint8 clvl = 1;
        if (_ran <= 810) clvl = 2;
        if (_ran <= 648) clvl = 3;
        if (_ran <= 504) clvl = 4;
        if (_ran <= 378) clvl = 5;
        if (_ran <= 270) clvl = 6;
        if (_ran <= 180) clvl = 7;
        if (_ran <= 108) clvl = 8;
        if (_ran <= 54)  clvl = 9;
        if (_ran <= 18)  clvl = 10;

        fortune_arr[_idx].level = clvl;
        fortune_arr[_idx].opened = true;
        fortune_arr[_idx].str_luck = 
            ur_luck[arand(fortune_arr[_idx].current_owner, now)% ur_luck.length];
        
        // first fortune in honor of mai waifu
        if(_idx == 0) {
            fortune_arr[_idx].level = 0;
            fortune_arr[_idx].str_luck = ur_luck[6];
            lvl_count[0] += 1;
        } else lvl_count[clvl] += 1;    
        emit event_open(_idx);
    }
}