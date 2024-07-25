contract fortunes {
function fortune_sell(uint _idx, uint basebid, uint endt) 
        public idx_inrange(_idx) only_currowner(_idx) {
        require(_idx > 0, "I'll always be here with you.");
        require(!fortune_arr[_idx].forsale, "already selling");
        require(endt <= 7 days, "auction time too long");
        fortune_arr[_idx].current_bid = basebid;
        fortune_arr[_idx].auction_end = now + endt;
        fortune_arr[_idx].forsale = true;
        emit event_sale(_idx);
    }
}