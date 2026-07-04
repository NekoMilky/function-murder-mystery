#统计数据初始值
execute as @a run scoreboard players enable @s mm_stats
execute as @a unless score @s mm_stats_1 matches 0.. run scoreboard players set @s mm_stats_1 0
execute as @a unless score @s mm_stats_2 matches 0.. run scoreboard players set @s mm_stats_2 0
execute as @a unless score @s mm_stats_3 matches 0.. run scoreboard players set @s mm_stats_3 0
execute as @a unless score @s mm_stats_4 matches 0.. run scoreboard players set @s mm_stats_4 0
execute as @a unless score @s mm_stats_5 matches 0.. run scoreboard players set @s mm_stats_5 0
execute as @a unless score @s mm_stats_6 matches 0.. run scoreboard players set @s mm_stats_6 0
execute as @a unless score @s mm_stats_7 matches 0.. run scoreboard players set @s mm_stats_7 0
execute as @a unless score @s mm_stats_8 matches 0.. run scoreboard players set @s mm_stats_8 0
execute as @a unless score @s mm_stats_9 matches 0.. run scoreboard players set @s mm_stats_9 0
execute as @a unless score @s mm_stats_10 matches 0.. run scoreboard players set @s mm_stats_10 0
execute as @a unless score @s mm_stats_11 matches 0.. run scoreboard players set @s mm_stats_11 0
execute as @a unless score @s mm_stats_12 matches 0.. run scoreboard players set @s mm_stats_12 0
execute as @a unless score @s mm_stats_13 matches 0.. run scoreboard players set @s mm_stats_13 0
execute as @a unless score @s mm_stats_14 matches 0.. run scoreboard players set @s mm_stats_14 0

#游戏开始后拦截触发
execute if score game_start mm_main matches 2 as @a[scores={mm_stats=1..},tag=mm_playing] run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 as @a[scores={mm_stats=1..},tag=mm_playing] run scoreboard players reset @s mm_stats

#主菜单
execute as @a[scores={mm_stats=1}] run function mm:dialog/stats/main

#查看自己的统计信息
execute as @a[scores={mm_stats=2}] run function mm:stats/self

#查看他人的统计信息
execute as @a[scores={mm_stats=3}] run function mm:dialog/stats/others/main

#重置
execute as @a[scores={mm_stats=1..}] run scoreboard players reset @s mm_stats