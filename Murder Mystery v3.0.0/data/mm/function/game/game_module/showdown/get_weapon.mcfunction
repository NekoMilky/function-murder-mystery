execute unless score game_mode mm_main matches 10 as @a[tag=mm_playing,tag=!mm_spectator] run loot replace entity @s hotbar.0 loot mm:infinite_bow
execute unless score game_mode mm_main matches 10 as @a[tag=mm_playing,tag=!mm_spectator] run loot replace entity @s hotbar.1 loot mm:knife
execute unless score game_mode mm_main matches 10 as @a[tag=mm_playing,tag=!mm_spectator] run item replace entity @s container.9 with minecraft:arrow 1

execute if score game_mode mm_main matches 10 as @a[tag=mm_playing,tag=!mm_spectator] run loot replace entity @s hotbar.0 loot mm:knife
execute if score game_mode mm_main matches 10 as @a[tag=mm_playing,tag=!mm_spectator] run function mm:gun/replace {slot:1,type:"pistol"}
execute if score game_mode mm_main matches 10 as @a[tag=mm_playing,tag=!mm_spectator] run function mm:gun/replace {slot:2,type:"rifle"}

scoreboard players set #ALL mm_API 10