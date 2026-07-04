#播放亡语
execute as @s[scores={mm_death_cry=2..}] run tag @s add mm_play_death_cry
execute as @s[tag=mm_play_death_cry] at @s run tag @p[tag=!mm_dead,scores={mm_death_type=..-1}] add mm_play_death_cry

execute as @s[tag=mm_play_death_cry,scores={mm_death_cry=2}] as @a[tag=mm_play_death_cry] at @s run playsound minecraft:entity.wolf.death player @s ~ ~ ~ 1 1
execute as @s[tag=mm_play_death_cry,scores={mm_death_cry=3}] as @a[tag=mm_play_death_cry] at @s run playsound minecraft:entity.ender_dragon.growl player @s ~ ~ ~ 1 1

execute as @a[tag=mm_play_death_cry] run tag @s remove mm_play_death_cry