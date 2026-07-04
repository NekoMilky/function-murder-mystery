function mm:scoreboard/entries/system_time/main {objective:"mm_scoreboard"}

function mm:scoreboard/entries/game_mode/main {objective:"mm_scoreboard",line:12}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:13}

function mm:scoreboard/entries/time_left/main {objective:"mm_scoreboard",line:14}

scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.outlaw_left","color":"white","with":[{"score":{"name":"outlaw_left","objective":"mm_data"},"color":"red"}]}

scoreboard players display name .16 mm_scoreboard {"translate":"mm.scoreboard.key.sheriff_left","color":"white","with":[{"score":{"name":"sheriff_left","objective":"mm_data"},"color":"aqua"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:17}

scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.outlaw_kills","color":"white","with":[{"score":{"name":"outlaw_kill_count","objective":"mm_data"},"color":"red"}]}

scoreboard players display name .19 mm_scoreboard {"translate":"mm.scoreboard.key.sheriff_kills","color":"white","with":[{"score":{"name":"sheriff_kill_count","objective":"mm_data"},"color":"aqua"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:20}

function mm:scoreboard/entries/current_map/main {objective:"mm_scoreboard",line:21}

function mm:scoreboard/entries/version_info {objective:"mm_scoreboard"}