tellraw @a[tag=mm_playing] {"translate":"mm.text.human_will_win","color":"yellow","with":[{"text":"60","color":"red"}]}

team modify mm_human color green
team modify mm_human nametagVisibility hideForOtherTeams
team modify mm_robot color gold
team modify mm_robot nametagVisibility hideForOtherTeams

execute as @a[tag=mm_playing] at @s run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1
scoreboard players set #ALL mm_API 13