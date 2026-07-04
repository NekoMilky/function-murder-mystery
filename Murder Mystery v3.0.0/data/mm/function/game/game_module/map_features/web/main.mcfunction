#状态更新
function mm:game/game_module/map_features/common/main {name:"web",item_tag:"Web",fail_api:92,success_api:93}

#蛛网
execute as @e[tag=mm_web,scores={mm_cd_tick=0..}] run scoreboard players remove @s mm_cd_tick 1
execute as @e[tag=mm_web,scores={mm_cd_tick=0}] at @s run playsound minecraft:block.stone.break block @a ~ ~ ~ 1.25 2
execute as @e[tag=mm_web,scores={mm_cd_tick=0}] at @s run setblock ~ ~ ~ air
execute as @e[tag=mm_web,scores={mm_cd_tick=0}] run kill @s