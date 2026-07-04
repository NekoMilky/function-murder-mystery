function mm:scoreboard/entries/system_time/main {objective:"mm_scoreboard"}

function mm:scoreboard/entries/game_mode/main {objective:"mm_scoreboard",line:12}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:13}

function mm:scoreboard/entries/time_left/main {objective:"mm_scoreboard",line:14}

function mm:scoreboard/entries/innocent_left/main {objective:"mm_scoreboard",line:15}

execute if score murderer_count_display mm_settings matches 1 run function mm:scoreboard/entries/murderer_left/main {objective:"mm_scoreboard",line:16}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:17}

execute if entity @e[tag=mm_dropped_bow,scores={mm_spe_id=1}] run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.bow.1","color":"white","with":[{"translate":"mm.scoreboard.value.dropped","color":"red"}]}
execute unless entity @e[tag=mm_dropped_bow,scores={mm_spe_id=1}] run scoreboard players display name .18 mm_scoreboard {"translate":"mm.scoreboard.key.bow.1","color":"white","with":[{"translate":"mm.scoreboard.value.not_dropped","color":"green"}]}

execute if entity @e[tag=mm_dropped_bow,scores={mm_spe_id=2}] run scoreboard players display name .19 mm_scoreboard {"translate":"mm.scoreboard.key.bow.2","color":"white","with":[{"translate":"mm.scoreboard.value.dropped","color":"red"}]}
execute unless entity @e[tag=mm_dropped_bow,scores={mm_spe_id=2}] run scoreboard players display name .19 mm_scoreboard {"translate":"mm.scoreboard.key.bow.2","color":"white","with":[{"translate":"mm.scoreboard.value.not_dropped","color":"green"}]}

function mm:scoreboard/entries/empty_line {objective:"mm_scoreboard",line:20}

function mm:scoreboard/entries/current_map/main {objective:"mm_scoreboard",line:21}

function mm:scoreboard/entries/version_info {objective:"mm_scoreboard"}