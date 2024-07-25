contract RK40Z {
function OWN_ChangeState_locked(bool _locked) onlyOwner public {
        SC_locked = _locked;
    }
}