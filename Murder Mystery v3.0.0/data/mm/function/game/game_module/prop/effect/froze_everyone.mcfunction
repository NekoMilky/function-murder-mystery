tag @s add mm_actived_froze_everyone
tellraw @a[tag=mm_playing] {"translate":"mm.text.prop.active.others","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.6","color":"blue","bold":true},{"translate":"mm.text.prop.6.active","color":"green"}]}

scoreboard players set @a[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,tag=!mm_actived_froze_everyone] mm_froze_tick 100
execute as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,tag=!mm_actived_froze_everyone] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,NoGravity:1,DisabledSlots:7967,Tags:["mm_froze_teleporter"],Small:1}
execute as @a[tag=mm_playing,tag=!mm_dead,tag=!mm_spectator,tag=!mm_actived_froze_everyone] at @s run data modify entity @n[tag=mm_froze_teleporter] Rotation set from entity @s Rotation

execute as @s[tag=mm_actived_froze_everyone] run tag @s remove mm_actived_froze_everyone