scoreboard players set ghost_spawn_tick mm_main 1
scoreboard players set #ALL mm_API 11

execute as @a[tag=mm_survivor] run loot replace entity @s hotbar.0 loot mm:bow
execute as @a[tag=mm_survivor] run item replace entity @s hotbar.1 with minecraft:arrow 24