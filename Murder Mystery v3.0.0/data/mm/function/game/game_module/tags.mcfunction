#效果标签
execute as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator] run tag @s add mm_no_effect
execute as @a[tag=mm_no_effect,nbt={active_effects:[{id:"minecraft:speed"}]}] run tag @s remove mm_no_effect
execute as @a[tag=mm_no_effect,nbt={active_effects:[{id:"minecraft:jump_boost"}]}] run tag @s remove mm_no_effect
execute as @a[tag=mm_no_effect,nbt={active_effects:[{id:"minecraft:nausea"}]}] run tag @s remove mm_no_effect
execute as @a[tag=mm_no_effect,nbt={active_effects:[{id:"minecraft:blindness"}]}] run tag @s remove mm_no_effect
execute as @a[tag=mm_no_effect,nbt={active_effects:[{id:"minecraft:invisibility"}]}] run tag @s remove mm_no_effect

#标签
execute as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,tag=!mm_alive] run tag @s add mm_alive
execute as @a[tag=mm_dead,tag=mm_alive] run tag @s remove mm_alive
execute as @a[tag=mm_will_respawn,tag=mm_alive] run tag @s remove mm_alive
execute as @a[tag=mm_spectator,tag=mm_alive] run tag @s remove mm_alive