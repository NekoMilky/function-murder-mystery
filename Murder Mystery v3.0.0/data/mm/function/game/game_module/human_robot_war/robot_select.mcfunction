tag @a[limit=1,tag=mm_human] add mm_robot
execute as @a[tag=mm_robot] run tag @s remove mm_human
team join mm_robot @a[tag=mm_robot]
execute as @a[tag=mm_robot] run scoreboard players set @s mm_API_p 65
execute as @a[tag=mm_human] run scoreboard players set @s mm_API_p 64

title @a[tag=mm_human] subtitle {"translate":"mm.title.human.subtitle","color":"yellow"}
title @a[tag=mm_human] title {"translate":"mm.title.human","color":"green"}
title @a[tag=mm_robot] subtitle {"translate":"mm.title.robot.subtitle","color":"yellow"}
title @a[tag=mm_robot] title {"translate":"mm.title.robot","color":"gold"}

tellraw @a[tag=mm_robot] {"translate":"mm.text.robot_select.self","color":"gold"}

execute as @a[tag=mm_playing,tag=!mm_spectator] run loot replace entity @s hotbar.0 loot mm:infinite_bow
execute as @a[tag=mm_playing,tag=!mm_spectator] run loot replace entity @s hotbar.1 loot mm:knife
execute as @a[tag=mm_playing,tag=!mm_spectator] run item replace entity @s container.9 with minecraft:arrow 1
scoreboard players set #ALL mm_API 12