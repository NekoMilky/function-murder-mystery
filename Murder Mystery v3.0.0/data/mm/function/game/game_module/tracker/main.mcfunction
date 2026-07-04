#其他槽位清除
$execute as @a[tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn,$(tracker_filter)] run tag @s add mm_tracking

$execute as @a[tag=mm_tracking,$(tracker_filter)] run function mm:game/game_module/tracker/clear_illegal

#生成追踪器
$execute as @a[tag=mm_tracking,$(tracker_filter)] at @s run loot spawn ~ ~ ~ loot mm:tracker/$(type)
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tracker:1}}}}] run tag @s add mm_tracker

#修改数据
$execute as @e[tag=mm_tracker] at @s store result entity @s Item.components."minecraft:lodestone_tracker".target.pos[0] int 1 run data get entity @n[tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn,$(target_filter)] Pos[0]
$execute as @e[tag=mm_tracker] at @s store result entity @s Item.components."minecraft:lodestone_tracker".target.pos[1] int 1 run data get entity @n[tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn,$(target_filter)] Pos[1]
$execute as @e[tag=mm_tracker] at @s store result entity @s Item.components."minecraft:lodestone_tracker".target.pos[2] int 1 run data get entity @n[tag=!mm_dead,tag=!mm_spectator,tag=!mm_will_respawn,$(target_filter)] Pos[2]

#修改物品栏
$execute as @e[tag=mm_tracker] at @s run item replace entity @p[tag=mm_tracking,$(tracker_filter)] hotbar.4 from entity @s contents

#清除
kill @e[tag=mm_tracker]