contract Pebbles {
function withdrawDeferred() public {
        require(msg.sender == team);
        require(launched != 0);
        uint yearsSinceLaunch = (block.timestamp - launched) / 1 years;
        if (yearsSinceLaunch < 5) {
            uint256 teamTokensAvailable = balanceTeam / 5 * yearsSinceLaunch;
            balances[team] += teamTokensAvailable - withdrawnTeam;
            withdrawnTeam = teamTokensAvailable;
        } else {
            balances[team] += balanceTeam - withdrawnTeam;
            balanceTeam = 0;
            withdrawnTeam = 0;
            team = 0x0;
        }
        if (block.timestamp - launched >= 90 days) {
            balances[treasury] += balanceTreasury;
            balanceTreasury = 0;
            treasury = 0x0;
        }
    }
}