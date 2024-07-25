contract WorldCupEther {
function InitiateTeams() public onlyCeo {
		require(teamsAreInitiated == false);
        teams.push(Team("Russia", cfoAddress, 195000000000000000)); 
		teams.push(Team("Germany", cfoAddress, 750000000000000000)); 
		teams.push(Team("Brazil", cfoAddress, 700000000000000000)); 
        teams.push(Team("Argentina", cfoAddress, 650000000000000000)); 
        teams.push(Team("Portugal", cfoAddress, 350000000000000000)); 
        teams.push(Team("Poland", cfoAddress, 125000000000000000)); 
        teams.push(Team("France", cfoAddress, 750000000000000000)); 
        teams.push(Team("Belgium", cfoAddress, 400000000000000000)); 
        teams.push(Team("England", cfoAddress, 500000000000000000)); 
        teams.push(Team("Spain", cfoAddress, 650000000000000000)); 
        teams.push(Team("Switzerland", cfoAddress, 125000000000000000));
        teams.push(Team("Peru", cfoAddress, 60000000000000000)); 
		teams.push(Team("Uruguay", cfoAddress, 225000000000000000));
		teams.push(Team("Colombia", cfoAddress, 195000000000000000)); 		
        teams.push(Team("Mexico", cfoAddress, 125000000000000000)); 		
        teams.push(Team("Croatia", cfoAddress, 125000000000000000)); 		
        teams.push(Team("Denmark", cfoAddress, 95000000000000000)); 		
        teams.push(Team("Iceland", cfoAddress, 75000000000000000)); 
        teams.push(Team("Costa Rica", cfoAddress, 50000000000000000));		
        teams.push(Team("Sweden", cfoAddress, 95000000000000000)); 		
        teams.push(Team("Tunisia", cfoAddress, 30000000000000000)); 		
        teams.push(Team("Egypt", cfoAddress, 60000000000000000)); 		
        teams.push(Team("Senegal", cfoAddress, 70000000000000000)); 		
        teams.push(Team("Iran", cfoAddress, 30000000000000000)); 		
        teams.push(Team("Serbia", cfoAddress, 75000000000000000));		
        teams.push(Team("Nigeria", cfoAddress, 75000000000000000));		
        teams.push(Team("Australia", cfoAddress, 40000000000000000));		
        teams.push(Team("Japan", cfoAddress, 70000000000000000)); 
        teams.push(Team("Morocco", cfoAddress, 50000000000000000));			
        teams.push(Team("Panama", cfoAddress, 25000000000000000)); 		
        teams.push(Team("South Korea", cfoAddress, 30000000000000000)); 
		teams.push(Team("Saudi Arabia", cfoAddress, 15000000000000000));
	}
}