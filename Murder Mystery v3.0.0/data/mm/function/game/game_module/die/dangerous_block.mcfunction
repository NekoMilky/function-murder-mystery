execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
$data modify storage mm:main temporary.path set value "$(path)"
execute store result score deadly_block mm_main run function mm:utils/get_map_data with storage mm:main temporary

#立即死亡
$execute if score deadly_block mm_main matches 2 at @s if block ~ ~ ~ $(tag) run scoreboard players set @s mm_death_type $(death_type)

#溺死
$execute if score deadly_block mm_main matches 3 as @s[nbt={Air:0s}] at @s if block ~ ~1 ~ $(tag) run scoreboard players set @s mm_death_type $(death_type)

#缓慢死亡
execute unless score deadly_block mm_main matches 4 run return 0

$execute as @s[scores={mm_health_$(type)=-1}] at @s if block ~ ~ ~ $(tag) run scoreboard players operation @s mm_health_$(type) = $(full) mm_settings
$execute as @s[scores={mm_health_$(type)=0..}] at @s unless block ~ ~ ~ $(tag) unless block ~ ~-1 ~ $(tag) run scoreboard players set @s mm_health_$(type) -1

$execute as @s[scores={mm_health_$(type)=0}] run $(callback)
$execute as @s[scores={mm_health_$(type)=0..}] run scoreboard players remove @s mm_health_$(type) 1

$scoreboard players operation this_tick mm_main = @s mm_health_$(type)
scoreboard players operation this_tick mm_main %= 20 mm_main
$execute if score this_tick mm_main matches 0 as @s[scores={mm_health_$(type)=0..}] run damage @s 0.1 minecraft:indirect_magic