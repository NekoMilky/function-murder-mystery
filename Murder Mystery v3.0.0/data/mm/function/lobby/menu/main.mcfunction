#默认选项卡
execute as @e[tag=mm_menu] unless score @s mm_menu matches 0.. run scoreboard players set @s mm_menu 0 

#清空
execute as @e[tag=mm_menu,tag=mm_new_menu] run data modify entity @s Items set value []
execute as @e[tag=mm_menu,tag=mm_new_menu] run tag @s remove mm_new_menu

#开始游戏
execute as @e[tag=mm_npc_game,tag=mm_menu] run function mm:lobby/menu/game/main