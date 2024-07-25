contract NBACrypto {
function InitiateTeams() public onlyCeo {
		 require(teamsAreInitiated == false);
		 teams.push(Team("Cavaliers", 0x54d6fca0ca37382b01304e6716420538604b447b, 6400000000000000000));
 		 teams.push(Team("Warriors", 0xc88ddaa37c1fec910670366ae16df2aa5e1124f7, 12800000000000000000));
 		 teams.push(Team("Celtics", 0x28d02f67316123dc0293849a0d254ad86b379b34, 6400000000000000000));
		 teams.push(Team("Rockets", 0xc88ddaa37c1fec910670366ae16df2aa5e1124f7, 6400000000000000000));
		 teams.push(Team("Raptors", 0x5c035bb4cb7dacbfee076a5e61aa39a10da2e956, 6400000000000000000));
		 teams.push(Team("Spurs", 0x183febd8828a9ac6c70c0e27fbf441b93004fc05, 3200000000000000000));
		 teams.push(Team("Wizards", 0xaec539a116fa75e8bdcf016d3c146a25bc1af93b, 3200000000000000000));
		 teams.push(Team("Timberwolves", 0xef764bac8a438e7e498c2e5fccf0f174c3e3f8db, 3200000000000000000));
		 teams.push(Team("Pacers", 0x8e668a4582d0465accf66b4e4ab6d817f6c5b2dc, 3200000000000000000));
		 teams.push(Team("Thunder", 0x7d757e571bd545008a95cd0c48d2bb164faa72e3, 3200000000000000000));
		 teams.push(Team("Bucks", 0x1edb4c7b145cef7e46d5b5c256cedcd5c45f2ece, 3200000000000000000));
		 teams.push(Team("Lakers", 0xa2381223639181689cd6c46d38a1a4884bb6d83c, 3200000000000000000));
		 teams.push(Team("76ers", 0xa2381223639181689cd6c46d38a1a4884bb6d83c, 3200000000000000000));
		 teams.push(Team("Blazers", 0x54d6fca0ca37382b01304e6716420538604b447b, 1600000000000000000));
		 teams.push(Team("Heat", 0xef764bac8a438e7e498c2e5fccf0f174c3e3f8db, 3200000000000000000));
		 teams.push(Team("Pelicans", 0x54d6fca0ca37382b01304e6716420538604b447b, 1600000000000000000));
		 teams.push(Team("Pistons", 0x54d6fca0ca37382b01304e6716420538604b447b, 1600000000000000000));
		 teams.push(Team("Clippers", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
		 teams.push(Team("Hornets", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
		 teams.push(Team("Jazz", 0x54d6fca0ca37382b01304e6716420538604b447b, 1600000000000000000));
		 teams.push(Team("Knicks", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
		 teams.push(Team("Nuggets", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
		 teams.push(Team("Bulls", 0x28d02f67316123dc0293849a0d254ad86b379b34, 3200000000000000000));
		 teams.push(Team("Grizzlies", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
		 teams.push(Team("Nets", 0x54d6fca0ca37382b01304e6716420538604b447b, 1600000000000000000));
		 teams.push(Team("Kings", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
		 teams.push(Team("Magic", 0xb87e73ad25086c43a16fe5f9589ff265f8a3a9eb, 3200000000000000000));
		 teams.push(Team("Mavericks", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
		 teams.push(Team("Hawks", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
		 teams.push(Team("Suns", 0x7ec915b8d3ffee3deaae5aa90def8ad826d2e110, 3200000000000000000));
	}
}