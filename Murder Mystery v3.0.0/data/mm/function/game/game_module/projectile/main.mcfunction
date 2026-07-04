#移动轨迹
##熔岩
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=2}] at @s positioned ~ ~1.3 ~ run particle lava ~ ~ ~ 0.2 0.2 0.2 0 20 normal @a[tag=mm_playing]
execute as @s[tag=mm_toygun,scores={mm_projectile=2}] at @s positioned ~ ~1.3 ~ run particle lava ~ ~ ~ 0.2 0.2 0.2 0 20 normal @a[tag=mm_playing]
execute as @s[type=arrow,scores={mm_projectile=2}] at @s run particle lava ~ ~ ~ 0.2 0.2 0.2 0 20 normal @a[tag=mm_playing]
##爆炸
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=3}] at @s positioned ~ ~1.3 ~ run particle explosion ~ ~ ~ 0.2 0.2 0.2 0 1 normal @a[tag=mm_playing]
execute as @s[tag=mm_toygun,scores={mm_projectile=3}] at @s positioned ~ ~1.3 ~ run particle explosion ~ ~ ~ 0.2 0.2 0.2 0 1 normal @a[tag=mm_playing]
execute as @s[type=arrow,scores={mm_projectile=3}] at @s run particle explosion ~ ~ ~ 0.2 0.2 0.2 0 1 normal @a[tag=mm_playing]
##Jack o`Lantern
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=4}] at @s positioned ~ ~1.3 ~ run summon item ~ ~ ~ {Item:{id:"minecraft:jack_o_lantern",count:1},PickupDelay:32767,Age:5920}
execute as @s[tag=mm_toygun,scores={mm_projectile=4}] at @s positioned ~ ~1.3 ~ run summon item ~ ~ ~ {Item:{id:"minecraft:jack_o_lantern",count:1},PickupDelay:32767,Age:5920}
execute as @s[type=arrow,scores={mm_projectile=4}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:jack_o_lantern",count:1},PickupDelay:32767,Age:5920}
##骨头
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=5}] at @s positioned ~ ~1.3 ~ run summon item ~ ~ ~ {Item:{id:"minecraft:bone",count:1},PickupDelay:32767,Age:5920}
execute as @s[tag=mm_toygun,scores={mm_projectile=5}] at @s positioned ~ ~1.3 ~ run summon item ~ ~ ~ {Item:{id:"minecraft:bone",count:1},PickupDelay:32767,Age:5920}
execute as @s[type=arrow,scores={mm_projectile=5}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:bone",count:1},PickupDelay:32767,Age:5920}
##僚机
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=6}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/wingman
execute as @s[tag=mm_toygun,scores={mm_projectile=6}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/wingman
execute as @s[type=arrow,scores={mm_projectile=6}] at @s run function mm:game/game_module/projectile/effects/wingman
##彩虹
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=7}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/rainbow
execute as @s[tag=mm_toygun,scores={mm_projectile=7}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/rainbow
execute as @s[type=arrow,scores={mm_projectile=7}] at @s run function mm:game/game_module/projectile/effects/rainbow
##甜食罐
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=8}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/sweets
execute as @s[tag=mm_toygun,scores={mm_projectile=8}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/sweets
execute as @s[type=arrow,scores={mm_projectile=8}] at @s run function mm:game/game_module/projectile/effects/sweets
##双龙
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=9}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/dragon_twins
execute as @s[tag=mm_toygun,scores={mm_projectile=9}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/dragon_twins
execute as @s[type=arrow,scores={mm_projectile=9}] at @s run function mm:game/game_module/projectile/effects/dragon_twins
##彩色旋风
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=10}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/rainbow_wind
execute as @s[tag=mm_toygun,scores={mm_projectile=10}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/rainbow_wind
execute as @s[type=arrow,scores={mm_projectile=10}] at @s run function mm:game/game_module/projectile/effects/rainbow_wind
##鸡
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=11}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/chicken
execute as @s[tag=mm_toygun,scores={mm_projectile=11}] at @s positioned ~ ~1.3 ~ run function mm:game/game_module/projectile/effects/chicken
execute as @s[type=arrow,scores={mm_projectile=11}] at @s run function mm:game/game_module/projectile/effects/chicken
##血污
execute as @s[tag=mm_thrown_knife,scores={mm_projectile=12}] at @s positioned ~ ~1.3 ~ run particle block{block_state:"minecraft:red_wool"} ~ ~ ~ 0.2 0.2 0.2 50 30 force @a[tag=mm_playing]
execute as @s[tag=mm_toygun,scores={mm_projectile=12}] at @s positioned ~ ~1.3 ~ run particle block{block_state:"minecraft:red_wool"} ~ ~ ~ 0.2 0.2 0.2 50 30 force @a[tag=mm_playing]
execute as @s[type=arrow,scores={mm_projectile=12}] at @s run particle block{block_state:"minecraft:red_wool"} ~ ~ ~ 0.2 0.2 0.2 50 30 force @a[tag=mm_playing]