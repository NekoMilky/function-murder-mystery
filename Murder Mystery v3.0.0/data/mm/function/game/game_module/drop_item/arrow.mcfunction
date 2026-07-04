data modify storage mm:main temporary.id set value "arrow"
execute store result storage mm:main temporary.count int 1 run data get entity @s Item.count

execute on origin as @s[tag=mm_murderer] run data modify storage mm:main temporary.slot set value 2
execute on origin as @s[tag=mm_detective] run data modify storage mm:main temporary.slot set value 9
execute on origin as @s[tag=mm_innocent,tag=!mm_detective] run data modify storage mm:main temporary.slot set value 1
execute on origin as @s[tag=mm_survivor] run data modify storage mm:main temporary.slot set value 1
execute on origin as @s[tag=mm_outlaw] run data modify storage mm:main temporary.slot set value 9
execute on origin as @s[tag=mm_sheriff] run data modify storage mm:main temporary.slot set value 9
execute on origin as @s[tag=mm_human] run data modify storage mm:main temporary.slot set value 9
execute on origin as @s[tag=mm_robot] run data modify storage mm:main temporary.slot set value 9

execute on origin run function mm:utils/give_or_replace/main with storage mm:main temporary

kill @s