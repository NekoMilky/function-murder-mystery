#状态更新
function mm:game/game_module/map_features/common/main {name:"wall",item_tag:"Wall",fail_api:75,success_api:76}

#筑墙器
execute as @e[tag=mm_wall,scores={mm_cd_tick=0..}] run scoreboard players remove @s mm_cd_tick 1
execute as @e[tag=mm_wall,scores={mm_cd_tick=0}] at @s run playsound minecraft:entity.item.break block @a ~ ~ ~ 1.25 2
execute as @e[tag=mm_wall,scores={mm_cd_tick=0}] at @s run setblock ~ ~ ~ air
execute as @e[tag=mm_wall,scores={mm_cd_tick=0}] run kill @s