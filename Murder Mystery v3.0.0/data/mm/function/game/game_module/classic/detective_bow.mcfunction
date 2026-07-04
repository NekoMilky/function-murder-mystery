#检测消耗箭并触发
execute as @s[scores={mm_cd_tick=-1,mm_shoot_det=1}] store result score this_arrow_count mm_main run function mm:utils/get_count_in_inventory {id:"arrow"}
execute as @s[scores={mm_cd_tick=-1,mm_shoot_det=1}] if score this_arrow_count mm_main matches 0 run tag @s add mm_shoot

execute as @s[tag=mm_shoot] run scoreboard players operation @s mm_cd_tick = cooldown_det mm_settings
execute if score game_mode mm_main matches 9 as @s[tag=mm_shoot] run scoreboard players operation @s mm_cd_tick = boss_detective_tick mm_settings

execute as @s[tag=mm_shoot] run tag @s remove mm_shoot

#冷却计时完毕后填充箭
execute as @s[scores={mm_cd_tick=0},tag=mm_origin] run function mm:utils/give_or_replace/main {id:"arrow",count:1,slot:9}
execute as @s[scores={mm_cd_tick=0},tag=!mm_origin] run function mm:utils/give_or_replace/main {id:"arrow",count:1,slot:1}

#冷却计时
execute as @s[scores={mm_cd_tick=0..}] run scoreboard players remove @s mm_cd_tick 1