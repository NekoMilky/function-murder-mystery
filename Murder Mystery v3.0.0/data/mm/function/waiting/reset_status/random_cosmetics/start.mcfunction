$execute unless entity @s[scores={mm_$(name)=0}] run return 0

$tag @s add mm_random_$(name)

$execute store result storage mm:main temporary.max int 1 run scoreboard players get cosmetics_$(name)_count mm_main
$execute store result score @s mm_$(name) run function mm:utils/random_count with storage mm:main temporary
$scoreboard players add @s mm_$(name) 1