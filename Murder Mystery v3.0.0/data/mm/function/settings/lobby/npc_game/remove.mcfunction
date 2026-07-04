execute at @s unless entity @e[tag=mm_npc_lobby,tag=mm_npc_game,distance=..2] run tellraw @s {"translate":"mm.feedback.lobby.npc_game.remove.fail","color":"red"}
execute at @s unless entity @e[tag=mm_npc_lobby,tag=mm_npc_game,distance=..2] run return 0

execute at @s run kill @n[tag=mm_npc_lobby,tag=mm_npc_game,distance=..2]

execute at @s positioned ~ ~2.5 ~ run kill @n[tag=mm_npc_game,tag=mm_click_to_play,distance=..2]
execute at @s positioned ~ ~2.2 ~ run kill @n[tag=mm_npc_game,tag=mm_datapack_name,distance=..2]
execute at @s positioned ~ ~1.9 ~ run kill @n[tag=mm_npc_game,tag=mm_current_playing,distance=..2]

execute at @s run data modify entity @n[tag=mm_npc_game,tag=mm_menu,distance=..2] Items set value []
execute at @s positioned ~ ~0.7 ~ run data modify entity @n[tag=mm_npc_game,tag=mm_menu,distance=..2] Items set value []
execute at @s positioned ~ ~1.4 ~ run data modify entity @n[tag=mm_npc_game,tag=mm_menu,distance=..2] Items set value []

execute at @s run kill @n[tag=mm_npc_game,tag=mm_menu,distance=..2]
execute at @s positioned ~ ~0.7 ~ run kill @n[tag=mm_npc_game,tag=mm_menu,distance=..2]
execute at @s positioned ~ ~1.4 ~ run kill @n[tag=mm_npc_game,tag=mm_menu,distance=..2]

tellraw @s {"translate":"mm.feedback.lobby.npc_game.remove.success","color":"green"}