execute at @s align x align y align z run summon minecraft:marker ~ ~ ~ {Tags:["mm_position"]}

$data modify storage mm:main $(path).pos set value [0, 0, 0, 0]

$execute at @s align x align y align z store result storage mm:main $(path).x int 1 run data get entity @n[tag=mm_position] Pos[0]
$execute at @s align x align y align z store result storage mm:main $(path).y int 1 run data get entity @n[tag=mm_position] Pos[1]
$execute at @s align x align y align z store result storage mm:main $(path).z int 1 run data get entity @n[tag=mm_position] Pos[2]

$execute as @s[y_rotation=-180..-157.5] run data modify storage mm:main $(path).rotation set value -180
$execute as @s[y_rotation=-157.5..-112.5] run data modify storage mm:main $(path).rotation set value -135
$execute as @s[y_rotation=-112.5..-67.5] run data modify storage mm:main $(path).rotation set value -90
$execute as @s[y_rotation=-67.5..-22.5] run data modify storage mm:main $(path).rotation set value -45
$execute as @s[y_rotation=-22.5..22.5] run data modify storage mm:main $(path).rotation set value 0
$execute as @s[y_rotation=22.5..67.5] run data modify storage mm:main $(path).rotation set value 45
$execute as @s[y_rotation=67.5..112.5] run data modify storage mm:main $(path).rotation set value 90
$execute as @s[y_rotation=112.5..157.5] run data modify storage mm:main $(path).rotation set value 135
$execute as @s[y_rotation=157.5..180] run data modify storage mm:main $(path).rotation set value -180

$data modify storage mm:main $(path).pos[0] set from storage mm:main $(path).x
$data modify storage mm:main $(path).pos[1] set from storage mm:main $(path).y
$data modify storage mm:main $(path).pos[2] set from storage mm:main $(path).z
$data modify storage mm:main $(path).pos[3] set from storage mm:main $(path).rotation

execute at @s align x align y align z run kill @n[tag=mm_position]