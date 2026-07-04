#计分板刷新
function mm:scoreboard/main
scoreboard players set game_start mm_main 3

#返厅倒计时
scoreboard players set return_lobby mm_main 100

#清空背包
clear @a[tag=mm_playing]