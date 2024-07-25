contract ProofOfCraigGrant {
function setName(string _name)
        onlyAdministrator()
        public
    {
        name = _name;
    }
}