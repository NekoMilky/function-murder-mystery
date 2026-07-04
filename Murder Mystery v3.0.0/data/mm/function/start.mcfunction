execute if score game_start mm_main matches 2..3 run tellraw @s {"translate":"mm.feedback.game_is_running","color":"red"}

execute unless score game_start mm_main matches 2..3 run tellraw @a {"translate":"mm.text.game_force_start","color":"green"}
execute unless score game_start mm_main matches 2..3 run function mm:waiting/game_start