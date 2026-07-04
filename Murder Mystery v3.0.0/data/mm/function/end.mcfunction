#设置分数
execute unless score game_start mm_main matches 2 run tellraw @s {"translate":"mm.feedback.game_is_not_running","color":"red"}

execute if score game_start mm_main matches 2 run tellraw @a {"translate":"mm.text.game_force_end","color":"red"}
execute if score game_start mm_main matches 2 run function mm:waiting/game_end