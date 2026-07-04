function mm:scoreboard/entries/system_time/main {objective:"mm_scoreboard"}

function mm:scoreboard/entries/game_mode/main {objective:"mm_scoreboard",line:12}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:13}

function mm:scoreboard/entries/time_left/main {objective:"mm_scoreboard",line:14}

function mm:scoreboard/entries/survivor_left/main {objective:"mm_scoreboard",line:15}

scoreboard players display name .16 mm_scoreboard {"translate":"mm.scoreboard.key.ghost_left","color":"white","with":[{"score":{"name":"ghost_left","objective":"mm_data"},"color":"red"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:17}

function mm:scoreboard/entries/current_map/main {objective:"mm_scoreboard",line:18}

function mm:scoreboard/entries/version_info {objective:"mm_scoreboard"}