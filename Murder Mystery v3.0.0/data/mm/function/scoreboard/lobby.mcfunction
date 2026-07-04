function mm:scoreboard/entries/system_time/main {objective:"mm_scoreboard_l"}

function mm:scoreboard/entries/game_mode/main {objective:"mm_scoreboard_l",line:12}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard_l",line:13}

scoreboard players display name .14 mm_scoreboard_l {"translate":"mm.scoreboard.key.online_players","color":"white","with":[{"score":{"name":"online_player_count","objective":"mm_data"},"color":"green"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard_l",line:15}

function mm:scoreboard/entries/running_status/main {objective:"mm_scoreboard_l",line:16}

function mm:scoreboard/entries/version_info {objective:"mm_scoreboard_l"}