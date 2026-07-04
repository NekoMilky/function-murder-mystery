execute as @s[tag=!mm_choose_spectator] run tag @s add mm_add
execute as @s[tag=mm_choose_spectator] run tag @s add mm_remove

execute as @s[tag=mm_add] run tag @s add mm_choose_spectator
execute as @s[tag=mm_add] run scoreboard players set @s mm_API_p 33
execute as @s[tag=mm_add] run tellraw @s {"translate":"mm.feedback.spectator.choose.success","color":"gray"}

execute as @s[tag=mm_remove] run tag @s remove mm_choose_spectator
execute as @s[tag=mm_remove] run scoreboard players set @s mm_API_p 32
execute as @s[tag=mm_remove] run tellraw @s {"translate":"mm.feedback.player.choose.success","color":"green"}

execute as @s[tag=mm_add] run tag @s remove mm_add
execute as @s[tag=mm_remove] run tag @s remove mm_remove