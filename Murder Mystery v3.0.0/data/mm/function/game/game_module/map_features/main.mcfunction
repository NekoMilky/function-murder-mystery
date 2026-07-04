#单轨列车
execute if entity @e[tag=mm_monorail_spawner,tag=mm_special_element] run function mm:game/game_module/map_features/monorail/main

#筑墙器
execute if entity @e[tag=mm_wall_spawner,tag=mm_special_element] run function mm:game/game_module/map_features/wall/main

#雪人生成器
execute if entity @e[tag=mm_snowman_spawner,tag=mm_special_element] run function mm:game/game_module/map_features/snowman/main

#火把
execute if entity @e[tag=mm_torch_spawner,tag=mm_special_element] run function mm:game/game_module/map_features/torch/main

#玩具枪
execute if entity @e[tag=mm_toygun_spawner,tag=mm_special_element] run function mm:game/game_module/map_features/toygun/main

#火星药水
execute if entity @e[tag=mm_mars_potion_spawner,tag=mm_special_element] run function mm:game/game_module/map_features/mars_potion/main

#蛛网
execute if entity @e[tag=mm_web_spawner,tag=mm_special_element] run function mm:game/game_module/map_features/web/main