#前进
execute at @s run tp ^ ^ ^0.3
$scoreboard players set current_range mm_main $(current_range)
scoreboard players add current_range mm_main 3

#粒子效果
scoreboard players operation remain_value mm_main = current_range mm_main
scoreboard players operation remain_value mm_main %= 9 mm_main
$execute if score remain_value mm_main matches 0 at @s run function mm:gun/shoot/particle/$(type)

#造成伤害
execute at @s align x align y align z if entity @a[dy=0,tag=!mm_gun_shoot] run tag @s add mm_hit_player

execute as @s[tag=mm_hit_player] at @s align x align y align z run damage @p[dy=0,tag=!mm_gun_shoot] 1 minecraft:player_attack by @p[tag=mm_gun_shoot]

execute as @s[tag=mm_hit_player] run kill @s
execute as @s[tag=mm_hit_player] run return 0

#递归
$execute if score current_range mm_main > #ALL.$(type) mm_gun_range run kill @s
$execute if score current_range mm_main > #ALL.$(type) mm_gun_range run return 0

execute at @s unless block ~ ~ ~ #mm:incomplete_block run kill @s
execute at @s unless block ~ ~ ~ #mm:incomplete_block run return 0

execute store result storage mm:main temporary.current_range int 1 run scoreboard players get current_range mm_main
$data modify storage mm:main temporary.type set value "$(type)"

function mm:gun/shoot/forward with storage mm:main temporary