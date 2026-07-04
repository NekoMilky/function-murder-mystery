execute as @a[tag=mm_detective] run loot replace entity @s hotbar.1 loot mm:bow
execute as @a[tag=mm_detective] run item replace entity @s container.9 with minecraft:arrow 1
scoreboard players set #ALL mm_API 9