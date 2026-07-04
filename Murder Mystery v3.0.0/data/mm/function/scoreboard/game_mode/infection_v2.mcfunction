function mm:scoreboard/entries/system_time/main {objective:"mm_scoreboard"}

function mm:scoreboard/entries/game_mode/main {objective:"mm_scoreboard",line:12}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:13}

function mm:scoreboard/entries/time_left/main {objective:"mm_scoreboard",line:14}

function mm:scoreboard/entries/survivor_left/main {objective:"mm_scoreboard",line:15}

function mm:scoreboard/entries/infected_left/main {objective:"mm_scoreboard",line:16}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:17}

scoreboard players operation get_weapon mm_main = game_time mm_settings
scoreboard players remove get_weapon mm_main 15
execute unless score game_second mm_main < get_weapon mm_main run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.alpha","color":"white","with":[{"translate":"mm.scoreboard.value.alive","color":"green"}]}
execute if score game_second mm_main < get_weapon mm_main if entity @a[tag=mm_alpha,tag=!mm_dead] run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.alpha","color":"white","with":[{"translate":"mm.scoreboard.value.alive","color":"green"}]}
execute if score game_second mm_main < get_weapon mm_main unless entity @a[tag=mm_alpha,tag=!mm_dead] run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.alpha","color":"white","with":[{"translate":"mm.scoreboard.value.dead","color":"red"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:19}

function mm:scoreboard/entries/current_map/main {objective:"mm_scoreboard",line:20}

function mm:scoreboard/entries/version_info {objective:"mm_scoreboard"}