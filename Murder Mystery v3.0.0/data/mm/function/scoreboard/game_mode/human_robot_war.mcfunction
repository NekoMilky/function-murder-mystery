function mm:scoreboard/entries/system_time/main {objective:"mm_scoreboard"}

function mm:scoreboard/entries/game_mode/main {objective:"mm_scoreboard",line:12}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:13}

function mm:scoreboard/entries/time_left/main {objective:"mm_scoreboard",line:14}

execute if score game_second mm_main matches 61.. run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.human_left","color":"white","with":[{"text":"?","color":"green"}]}
execute if score game_second mm_main matches 0..60 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.human_left","color":"white","with":[{"score":{"name":"human_left","objective":"mm_data"},"color":"green"}]}

execute if score game_second mm_main matches 61.. run scoreboard players display name .16 mm_scoreboard {"translate":"mm.scoreboard.key.robot_left","color":"white","with":[{"text":"?","color":"gold"}]}
execute if score game_second mm_main matches 0..60 run scoreboard players display name .16 mm_scoreboard {"translate":"mm.scoreboard.key.robot_left","color":"white","with":[{"score":{"name":"robot_left","objective":"mm_data"},"color":"gold"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:17}

function mm:scoreboard/entries/current_map/main {objective:"mm_scoreboard",line:18}

function mm:scoreboard/entries/version_info {objective:"mm_scoreboard"}