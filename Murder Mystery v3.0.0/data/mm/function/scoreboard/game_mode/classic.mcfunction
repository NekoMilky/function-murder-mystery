function mm:scoreboard/entries/system_time/main {objective:"mm_scoreboard"}

function mm:scoreboard/entries/game_mode/main {objective:"mm_scoreboard",line:12}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:13}

function mm:scoreboard/entries/time_left/main {objective:"mm_scoreboard",line:14}

function mm:scoreboard/entries/innocent_left/main {objective:"mm_scoreboard",line:15}

execute if score murderer_count_display mm_settings matches 1 run function mm:scoreboard/entries/murderer_left/main {objective:"mm_scoreboard",line:16}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:17}

execute if entity @a[tag=mm_detective,tag=mm_origin,tag=!mm_dead] run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.detective","color":"white","with":[{"translate":"mm.scoreboard.value.alive","color":"green"}]}
execute unless entity @a[tag=mm_detective,tag=mm_origin,tag=!mm_dead] if entity @e[tag=mm_dropped_bow] unless score game_mode mm_main matches 9 run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.bow","color":"white","with":[{"translate":"mm.scoreboard.value.dropped","color":"red"}]}
execute unless entity @a[tag=mm_detective,tag=mm_origin,tag=!mm_dead] unless entity @e[tag=mm_dropped_bow] unless score game_mode mm_main matches 9 run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.bow","color":"white","with":[{"translate":"mm.scoreboard.value.not_dropped","color":"green"}]}
execute unless entity @a[tag=mm_detective,tag=mm_origin,tag=!mm_dead] if score game_mode mm_main matches 9 run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.detective","color":"white","with":[{"translate":"mm.scoreboard.value.dead","color":"red"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:19}

function mm:scoreboard/entries/current_map/main {objective:"mm_scoreboard",line:20}

function mm:scoreboard/entries/version_info {objective:"mm_scoreboard"}