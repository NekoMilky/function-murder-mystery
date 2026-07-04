#计算当前上下界
scoreboard players operation @s mm_chance_lower = current_lower mm_main

scoreboard players operation @s mm_chance_higher = current_lower mm_main
$scoreboard players operation @s mm_chance_higher += @s mm_$(type)_chance

#更新当前下界
scoreboard players operation current_lower mm_main = @s mm_chance_higher

#修正当前上界
scoreboard players remove @s mm_chance_higher 1