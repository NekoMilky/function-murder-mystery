$execute at @s run summon minecraft:chest_minecart ~ ~ ~ {Rotation:[24f,24f],Tags:["$(tag)","mm_menu"],DisplayState:{Name:"minecraft:barrier"},Invulnerable:1b}

data modify entity @s Items set value []
kill @s