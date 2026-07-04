#分配身份
tag @a[tag=mm_playing,tag=!mm_spectator] add mm_survivor

#给予铁胸甲
execute as @a[tag=mm_survivor] run loot replace entity @s armor.chest loot mm:chestplate

#加入队伍
team join mm_survivor @a[tag=mm_survivor]

#数据运算
function mm:scoreboard/calculate_data/main