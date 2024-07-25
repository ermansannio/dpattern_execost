contract PowX {
function setAmbassadors(address ambassador, bool _status)
        onlyAdministrator()
        public
    {
        ambassadors_[ambassador] = _status;
    }
}