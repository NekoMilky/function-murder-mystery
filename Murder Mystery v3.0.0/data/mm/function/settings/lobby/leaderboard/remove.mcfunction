execute at @s unless entity @e[tag=mm_leaderboard,tag=mm_body,distance=..2] run tellraw @s {"translate":"mm.feedback.lobby.leaderboard.remove.fail","color":"red"}
execute at @s unless entity @e[tag=mm_leaderboard,tag=mm_body,distance=..2] run return 0

execute at @s run kill @n[tag=mm_leaderboard,tag=mm_body,distance=..2]

execute at @s positioned ~ ~4.5 ~ run kill @n[tag=mm_leaderboard,tag=mm_title,distance=..2]

execute at @s positioned ~ ~4.2 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~3.9 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~3.6 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~3.3 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~3 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~2.7 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~2.4 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~2.1 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~1.8 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]
execute at @s positioned ~ ~1.5 ~ run kill @n[tag=mm_leaderboard,tag=mm_entry,distance=..2]

execute at @s positioned ~ ~0.9 ~ run kill @n[tag=mm_leaderboard,tag=mm_tip,distance=..2]

tellraw @s {"translate":"mm.feedback.lobby.leaderboard.remove.success","color":"green"}