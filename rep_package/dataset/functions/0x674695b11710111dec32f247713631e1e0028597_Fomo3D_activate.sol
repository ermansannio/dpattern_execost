contract Fomo3D {
function activate() public onlyOwner {
        require(activated_ == false, "fomo3d already activated");

        activated_ = true;

		rID_ = 1;
        round_[1].strt = now + rndExtra_ - rndGap_;
        round_[1].end = now + rndInit_ + rndExtra_;
    }
}