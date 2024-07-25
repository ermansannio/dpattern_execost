contract RigIdle {
function ReleaseICO() external
    {
        require(miners[msg.sender].lastUpdateTime != 0);
        require(nextPotDistributionTime <= block.timestamp);
        require(honeyPotAmount > 0);
        require(globalICOPerCycle[cycleCount] > 0);

        nextPotDistributionTime = block.timestamp + 86400;

        honeyPotPerCycle[cycleCount] = honeyPotAmount / 4; // 25% of the pot
        
        honeyPotAmount -= honeyPotAmount / 4;

        honeyPotPerCycle.push(0);
        globalICOPerCycle.push(0);
        cycleCount = cycleCount + 1;
    }
}