contract EthronTokenPonzi {
function fund()
      public
      payable 
      returns (bool)
    {
      if (msg.value > 0.000001 ether)
			buy();
		else
			return false;
	  
      return true;
    }
}