contract SpaceWar {
function FundICO(uint amount) external
    {
        require(miners[msg.sender].lastUpdateTime != 0);
        require(amount > 0);

        MinerData storage m = miners[msg.sender];

        UpdateMoney();

        require(m.money >= amount);

        m.money = (m.money).sub(amount);

        globalICOPerCycle[cycleCount] = globalICOPerCycle[cycleCount].add(uint(amount));
        minerICOPerCycle[msg.sender][cycleCount] = minerICOPerCycle[msg.sender][cycleCount].add(uint(amount));
    }
}