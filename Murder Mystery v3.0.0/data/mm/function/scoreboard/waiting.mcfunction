function mm:scoreboard/entries/system_time/main {objective:"mm_scoreboard"}

function mm:scoreboard/entries/game_mode/main {objective:"mm_scoreboard",line:12}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:13}

scoreboard players display name .14 mm_scoreboard {"translate":"mm.scoreboard.key.players","color":"white","with":[{"score":{"name":"playing_player_real_count","objective":"mm_data"},"color":"green"}]}

execute if score game_mode mm_main matches 0 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"2~16","color":"green"}]}
execute if score game_mode mm_main matches 1 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"4~24","color":"green"}]}
execute if score game_mode mm_main matches 2 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"2~16","color":"green"}]}
execute if score game_mode mm_main matches 3 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"2~16","color":"green"}]}
execute if score game_mode mm_main matches 4 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"2~16","color":"green"}]}
execute if score game_mode mm_main matches 5 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"2~16","color":"green"}]}
execute if score game_mode mm_main matches 6 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"1~16","color":"green"}]}
execute if score game_mode mm_main matches 7 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"2~16","color":"green"}]}
execute if score game_mode mm_main matches 8 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"4~24","color":"green"}]}
execute if score game_mode mm_main matches 9 run scoreboard players display name .15 mm_scoreboard {"translate":"mm.scoreboard.key.requirement","color":"white","with":[{"text":"3~16","color":"green"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:16}

function mm:scoreboard/entries/game_status {objective:"mm_scoreboard",line:17}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:18}

function mm:scoreboard/entries/current_map/main {objective:"mm_scoreboard",line:19}

function mm:scoreboard/entries/version_info {objective:"mm_scoreboard"}