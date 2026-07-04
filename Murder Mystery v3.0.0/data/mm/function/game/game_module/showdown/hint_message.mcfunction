tellraw @a[tag=mm_playing] {"translate":"mm.text.game_will_end","color":"yellow","with":[{"text":"60","color":"red"}]}
execute as @a[tag=mm_playing] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1
scoreboard players set #ALL mm_API 13