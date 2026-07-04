#状态更新
function mm:game/game_module/map_features/common/main {name:"snowman",item_tag:"Snowman",fail_api:78,success_api:79}

#雪人
execute if score timer mm_main matches 0 as @e[tag=mm_snowman,scores={mm_cd_tick=0..}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/map_features/snowman/snowball
execute if score timer mm_main matches 2 as @e[tag=mm_snowman,scores={mm_cd_tick=0..}] at @s positioned ~ ~1 ~ run function mm:game/game_module/map_features/snowman/snowball
execute if score timer mm_main matches 4 as @e[tag=mm_snowman,scores={mm_cd_tick=0..}] at @s positioned ~ ~0.7 ~ run function mm:game/game_module/map_features/snowman/snowball
execute if score timer mm_main matches 6 as @e[tag=mm_snowman,scores={mm_cd_tick=0..}] at @s positioned ~ ~0.4 ~ run function mm:game/game_module/map_features/snowman/snowball
execute if score timer mm_main matches 8 as @e[tag=mm_snowman,scores={mm_cd_tick=0..}] at @s positioned ~ ~0.1 ~ run function mm:game/game_module/map_features/snowman/snowball

execute as @e[tag=mm_snowman,scores={mm_cd_tick=0..}] run scoreboard players remove @s mm_cd_tick 1
execute as @e[tag=mm_snowman,scores={mm_cd_tick=0}] at @s run playsound minecraft:block.stone.break block @a ~ ~ ~ 1.25 2
execute as @e[tag=mm_snowman,scores={mm_cd_tick=0}] at @s run tp ~ -128 ~
execute as @e[tag=mm_snowman,scores={mm_cd_tick=0}] run kill @s