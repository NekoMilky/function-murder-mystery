$scoreboard players set this_year mm_main $(year)
$scoreboard players set this_month mm_main $(month)
$scoreboard players set this_day mm_main $(day)

#非法值
execute unless score this_year mm_main matches 0.. run tellraw @s {"translate":"mm.feedback.lobby.system_date.set.fail","color":"red"}
execute unless score this_year mm_main matches 0.. run return 0

execute unless score this_month mm_main matches 1..12 run tellraw @s {"translate":"mm.feedback.lobby.system_date.set.fail","color":"red"}
execute unless score this_month mm_main matches 1..12 run return 0

execute unless score this_day mm_main matches 1.. run tellraw @s {"translate":"mm.feedback.lobby.system_date.set.fail","color":"red"}
execute unless score this_day mm_main matches 1.. run return 0

#闰年判定
scoreboard players set is_leap_year mm_main 0

scoreboard players operation leap_year_4_check mm_main = this_year mm_main
scoreboard players operation leap_year_4_check mm_main %= 4 mm_main

scoreboard players operation leap_year_100_check mm_main = this_year mm_main
scoreboard players operation leap_year_100_check mm_main %= 100 mm_main

scoreboard players operation leap_year_400_check mm_main = this_year mm_main
scoreboard players operation leap_year_400_check mm_main %= 400 mm_main

execute if score leap_year_4_check mm_main matches 0 unless score leap_year_100_check mm_main matches 0 run scoreboard players set is_leap_year mm_main 1
execute if score leap_year_400_check mm_main matches 0 run scoreboard players set is_leap_year mm_main 1

#月
execute if score this_month mm_main matches 1 run scoreboard players set total_days mm_main 31
execute if score this_month mm_main matches 2 if score is_leap_year mm_main matches 0 run scoreboard players set total_days mm_main 28
execute if score this_month mm_main matches 2 if score is_leap_year mm_main matches 1 run scoreboard players set total_days mm_main 29
execute if score this_month mm_main matches 3 run scoreboard players set total_days mm_main 31
execute if score this_month mm_main matches 4 run scoreboard players set total_days mm_main 30
execute if score this_month mm_main matches 5 run scoreboard players set total_days mm_main 31
execute if score this_month mm_main matches 6 run scoreboard players set total_days mm_main 30
execute if score this_month mm_main matches 7 run scoreboard players set total_days mm_main 31
execute if score this_month mm_main matches 8 run scoreboard players set total_days mm_main 31
execute if score this_month mm_main matches 9 run scoreboard players set total_days mm_main 30
execute if score this_month mm_main matches 10 run scoreboard players set total_days mm_main 31
execute if score this_month mm_main matches 11 run scoreboard players set total_days mm_main 30
execute if score this_month mm_main matches 12 run scoreboard players set total_days mm_main 31

execute if score this_day mm_main > total_days mm_main run tellraw @s {"translate":"mm.feedback.lobby.system_date.set.fail","color":"red"}
execute if score this_day mm_main > total_days mm_main run return 0

$scoreboard players set system_year mm_data $(year)
$scoreboard players set system_month mm_data $(month)
$scoreboard players set system_day mm_data $(day)

$tellraw @s {"translate":"mm.feedback.lobby.system_date.set.success","color":"green","with":[{"text":"$(year)"},{"text":"$(month)"},{"text":"$(day)"}]}