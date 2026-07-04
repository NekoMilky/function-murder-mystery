execute if score game_pause mm_main matches 0 run scoreboard players set #ALL mm_API 5
execute if score game_pause mm_main matches 0 run scoreboard players set @s mm_API_p 30
execute if score game_pause mm_main matches 0 run tellraw @s {"translate":"mm.feedback.game_pause","color":"red"}
execute if score game_pause mm_main matches 0 run scoreboard players set game_pause mm_main 2

execute if score game_pause mm_main matches 1 run scoreboard players set #ALL mm_API 6
execute if score game_pause mm_main matches 1 run scoreboard players set @s mm_API_p 31
execute if score game_pause mm_main matches 1 run tellraw @s {"translate":"mm.feedback.game_continue","color":"green"}
execute if score game_pause mm_main matches 1 run scoreboard players set game_pause mm_main 0

execute if score game_pause mm_main matches 2 run scoreboard players set game_pause mm_main 1