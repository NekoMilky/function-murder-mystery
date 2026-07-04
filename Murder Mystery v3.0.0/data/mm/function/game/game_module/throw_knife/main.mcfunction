#掷出
$execute as @a[tag=mm_playing,tag=mm_right_click,$(filter),tag=!mm_dead,scores={mm_throw_tick=-1,mm_cd_tick=-1,mm_thrown_knife=1..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Knife:1}] run tag @s add mm_throw

$execute as @a[tag=mm_throw] run scoreboard players operation @s mm_throw_tick = $(cooldown_throw)

execute as @a[tag=mm_throw] run tag @s remove mm_right_click
execute as @a[tag=mm_throw] run tag @s remove mm_throw

execute as @a[tag=mm_murderer,tag=!mm_dead,scores={mm_throw_tick=0..}] run effect give @s slowness 1 0 true

#取消掷出
$execute as @a[tag=mm_playing,tag=mm_right_click,$(filter),tag=!mm_dead,scores={mm_throw_tick=0..}] if items entity @s weapon.mainhand *[minecraft:custom_data~{Knife:1}] run tag @s add mm_cancel_throw

execute as @a[tag=mm_cancel_throw] run scoreboard players set @s mm_throw_tick -1
execute as @a[tag=mm_cancel_throw] run effect clear @s slowness

execute as @a[tag=mm_cancel_throw] run tag @s remove mm_right_click
execute as @a[tag=mm_cancel_throw] run tag @s remove mm_cancel_throw

#掷出计时完毕后发射飞刀并编号
$execute as @a[$(filter),tag=mm_playing,tag=!mm_dead,scores={mm_throw_tick=9}] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 0.9
$execute as @a[$(filter),tag=mm_playing,tag=!mm_dead,scores={mm_throw_tick=5}] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1
$execute as @a[$(filter),tag=mm_playing,tag=!mm_dead,scores={mm_throw_tick=1}] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1.1
$execute as @a[$(filter),tag=mm_playing,tag=!mm_dead,scores={mm_throw_tick=0}] run tag @s add mm_throwing

$execute as @a[tag=mm_throwing] run scoreboard players operation @s mm_cd_tick = $(cooldown)
execute as @a[tag=mm_throwing] run scoreboard players remove @s mm_thrown_knife 1

execute as @a[tag=mm_throwing] run function mm:game/game_module/throw_knife/summon
execute as @a[tag=mm_throwing] at @s run playsound minecraft:entity.ender_dragon.flap player @s ~ ~ ~ 1 1
execute as @a[tag=mm_throwing] run effect clear @s slowness

execute as @a[tag=mm_throwing] run tag @s remove mm_throwing

#掷出计时
$execute as @a[$(filter),tag=mm_playing,tag=!mm_dead,scores={mm_throw_tick=0..}] run scoreboard players remove @s mm_throw_tick 1

#冷却计时
$execute as @a[$(filter),tag=mm_playing,tag=!mm_dead,scores={mm_cd_tick=0..}] run scoreboard players remove @s mm_cd_tick 1