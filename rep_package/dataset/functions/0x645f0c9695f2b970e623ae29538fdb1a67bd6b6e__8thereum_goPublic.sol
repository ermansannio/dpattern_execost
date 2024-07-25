contract _8thereum {
function goPublic() 
        onlyOwner()
        public 
        returns(bool)

    {
        openToThePublic = true;
        return openToThePublic;
    }
}