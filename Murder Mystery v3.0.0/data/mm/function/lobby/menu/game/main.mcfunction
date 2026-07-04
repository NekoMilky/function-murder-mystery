#主菜单
execute if score @s mm_menu matches 0 run function mm:lobby/menu/game/home/main

#地图选择菜单
execute if score @s mm_menu matches 1.. store result storage mm:main temporary.page int 1 run scoreboard players get @s mm_menu
execute if score @s mm_menu matches 1.. run function mm:lobby/menu/game/map_select/main with storage mm:main temporary