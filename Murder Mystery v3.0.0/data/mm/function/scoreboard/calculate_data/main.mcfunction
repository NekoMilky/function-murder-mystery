#系统时间
setblock 2999999 0 2999999 air
setblock 2999999 0 2999999 repeating_command_block{auto:1b,Command:"time"}
schedule function mm:scoreboard/calculate_data/system_time/get 2t

#在线玩家
scoreboard players set online_player_count mm_data 0
execute as @a run scoreboard players add online_player_count mm_data 1

#正在游玩玩家
scoreboard players set playing_player_count mm_data 0
execute as @a[tag=mm_playing] run scoreboard players add playing_player_count mm_data 1

#实际正在游玩玩家
scoreboard players set playing_player_real_count mm_data 0
execute as @a[tag=mm_playing,tag=!mm_spectator,tag=!mm_choose_spectator] run scoreboard players add playing_player_real_count mm_data 1

#杀手击杀数同步
execute as @a[tag=mm_murderer,scores={mm_spe_id=1}] store result storage mm:main game.Murderer1.Kills int 1 run scoreboard players get @s mm_kill_count
execute as @a[tag=mm_murderer,scores={mm_spe_id=2}] store result storage mm:main game.Murderer2.Kills int 1 run scoreboard players get @s mm_kill_count

#侦探击杀数同步
execute as @a[tag=mm_detective,scores={mm_spe_id=1}] store result storage mm:main game.Detective1.Kills int 1 run scoreboard players get @s mm_kill_count
execute as @a[tag=mm_detective,scores={mm_spe_id=2}] store result storage mm:main game.Detective2.Kills int 1 run scoreboard players get @s mm_kill_count

#母体击杀数同步
execute as @a[tag=mm_alpha] store result storage mm:main game.Alpha.Kills int 1 run scoreboard players get @s mm_kill_count

#特殊身份概率
function mm:scoreboard/calculate_data/chance {type:"m"}
function mm:scoreboard/calculate_data/chance {type:"d"}
function mm:scoreboard/calculate_data/chance {type:"a"}

#剩余杀手
scoreboard players set murderer_left mm_data 0
execute as @a[tag=mm_murderer,tag=!mm_dead] run scoreboard players add murderer_left mm_data 1

#实际剩余杀手
scoreboard players set murderer_real_left mm_data 0
execute as @a[tag=mm_murderer] run scoreboard players add murderer_real_left mm_data 1

#剩余平民
scoreboard players set innocent_left mm_data 0
execute as @a[tag=mm_innocent,tag=!mm_dead] run scoreboard players add innocent_left mm_data 1

#剩余侦探
scoreboard players set detective_left mm_data 0
execute as @a[tag=mm_detective,tag=!mm_dead] run scoreboard players add detective_left mm_data 1

#剩余掉落弓
scoreboard players set dropped_bow_left mm_data 0
execute as @e[tag=mm_dropped_bow] run scoreboard players add dropped_bow_left mm_data 1
##侦探+掉落弓
scoreboard players set detective_and_dropped_bow_total_left mm_data 0
scoreboard players operation detective_and_dropped_bow_total_left mm_data = detective_left mm_data
scoreboard players operation detective_and_dropped_bow_total_left mm_data += dropped_bow_left mm_data

#剩余感染者
scoreboard players set infected_left mm_data 0
execute as @a[tag=mm_infected] run scoreboard players add infected_left mm_data 1

#实际剩余感染者
scoreboard players set infected_real_left mm_data 0
execute as @a[tag=mm_infected,tag=!mm_dead] run scoreboard players add infected_real_left mm_data 1
execute as @a[tag=mm_alpha,tag=!mm_dead] run scoreboard players add infected_real_left mm_data 1

#剩余幸存者
scoreboard players set survivor_left mm_data 0
execute as @a[tag=mm_survivor,tag=!mm_dead] run scoreboard players add survivor_left mm_data 1

#剩余逃犯
scoreboard players set outlaw_left mm_data 0
execute as @a[tag=mm_outlaw] run scoreboard players add outlaw_left mm_data 1

#剩余警长
scoreboard players set sheriff_left mm_data 0
execute as @a[tag=mm_sheriff] run scoreboard players add sheriff_left mm_data 1

#逃犯击杀数
scoreboard players set outlaw_kill_count mm_data 0
scoreboard players operation outlaw_kill_count mm_data += @a[tag=mm_outlaw] mm_kill_count

#警长击杀数
scoreboard players set sheriff_kill_count mm_data 0
scoreboard players operation sheriff_kill_count mm_data += @a[tag=mm_sheriff] mm_kill_count

#剩余人类
scoreboard players set human_left mm_data 0
execute as @a[tag=mm_human] run scoreboard players add human_left mm_data 1

#剩余机器人
scoreboard players set robot_left mm_data 0
execute as @a[tag=mm_robot] run scoreboard players add robot_left mm_data 1

#剩余恶灵
scoreboard players set ghost_left mm_data 0
execute as @e[tag=mm_ghost] run scoreboard players add ghost_left mm_data 1

#时间
scoreboard players operation time_left_minute mm_data = game_second mm_main
scoreboard players operation time_left_minute mm_data /= 60 mm_main
scoreboard players operation time_left_second mm_data = game_second mm_main
scoreboard players operation time_left_second mm_data %= 60 mm_main