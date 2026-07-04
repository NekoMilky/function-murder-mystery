#启用
execute as @a run scoreboard players enable @s mm_spectator

#游戏开始后拦截触发
execute if score game_start mm_main matches 2 as @a[scores={mm_spectator=1..},tag=!mm_spectator] run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 as @a[scores={mm_spectator=1..},tag=!mm_spectator] run scoreboard players reset @s mm_stats

#主菜单
execute as @a[scores={mm_spectator=1}] run function mm:spectator/switch

#重置
execute as @a[scores={mm_spectator=1..}] run scoreboard players reset @s mm_spectator