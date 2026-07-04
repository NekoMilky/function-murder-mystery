$execute store success score success_count mm_main run function mm:settings/play/integer_common/resolve {value:$(value),scoreboard_name:$(scoreboard_name),min:$(min),max:$(max)}

$execute if score success_count mm_main matches 0 run tellraw @s {"translate":"mm.feedback.value_check.integer.range","color":"red","with":[{"text":"$(min)"},{"text":"$(max)"}]}
execute if score success_count mm_main matches 0 run return 0

$tellraw @s {"translate":"mm.feedback.play.$(name).set.success","color":"yellow","with":[{"text":"$(value)","color":"gold"}]}