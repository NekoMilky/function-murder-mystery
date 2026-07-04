#状态更新
function mm:game/game_module/map_features/common/main {name:"torch",item_tag:"Torch",fail_api:81,success_api:82}

#火把
execute as @e[tag=mm_torch,scores={mm_cd_tick=0..}] run scoreboard players remove @s mm_cd_tick 1
execute as @e[tag=mm_torch,scores={mm_cd_tick=0}] at @s run playsound minecraft:block.fire.extinguish block @a ~ ~ ~ 1.25 2
execute as @e[tag=mm_torch,scores={mm_cd_tick=0}] at @s run setblock ~ ~1 ~ air
execute as @e[tag=mm_torch,scores={mm_cd_tick=0}] run kill @s