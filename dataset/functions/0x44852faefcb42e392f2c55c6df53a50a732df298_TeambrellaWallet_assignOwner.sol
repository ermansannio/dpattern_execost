contract TeambrellaWallet {
function assignOwner(address[] cosigners, uint teamId, address newOwner) onlyOwner external {
		if (m_cosigners.length == 0)
		{
			m_cosigners = cosigners;
			m_teamId = teamId;
			m_owner = newOwner;
		}
    }
}