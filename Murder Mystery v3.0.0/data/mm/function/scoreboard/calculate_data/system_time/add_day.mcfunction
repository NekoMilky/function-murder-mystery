scoreboard players add system_day mm_data 1

#闰年判定
scoreboard players set is_leap_year mm_data 0

scoreboard players operation leap_year_4_check mm_data = system_year mm_data
scoreboard players operation leap_year_4_check mm_data %= 4 mm_main

scoreboard players operation leap_year_100_check mm_data = system_year mm_data
scoreboard players operation leap_year_100_check mm_data %= 100 mm_main

scoreboard players operation leap_year_400_check mm_data = system_year mm_data
scoreboard players operation leap_year_400_check mm_data %= 400 mm_main

execute if score leap_year_4_check mm_data matches 0 unless score leap_year_100_check mm_data matches 0 run scoreboard players set is_leap_year mm_data 1
execute if score leap_year_400_check mm_data matches 0 run scoreboard players set is_leap_year mm_data 1

#月
execute if score system_month mm_data matches 1 run scoreboard players set total_days mm_data 31
execute if score system_month mm_data matches 2 if score is_leap_year mm_data matches 0 run scoreboard players set total_days mm_data 28
execute if score system_month mm_data matches 2 if score is_leap_year mm_data matches 1 run scoreboard players set total_days mm_data 29
execute if score system_month mm_data matches 3 run scoreboard players set total_days mm_data 31
execute if score system_month mm_data matches 4 run scoreboard players set total_days mm_data 30
execute if score system_month mm_data matches 5 run scoreboard players set total_days mm_data 31
execute if score system_month mm_data matches 6 run scoreboard players set total_days mm_data 30
execute if score system_month mm_data matches 7 run scoreboard players set total_days mm_data 31
execute if score system_month mm_data matches 8 run scoreboard players set total_days mm_data 31
execute if score system_month mm_data matches 9 run scoreboard players set total_days mm_data 30
execute if score system_month mm_data matches 10 run scoreboard players set total_days mm_data 31
execute if score system_month mm_data matches 11 run scoreboard players set total_days mm_data 30
execute if score system_month mm_data matches 12 run scoreboard players set total_days mm_data 31

execute if score system_day mm_data > total_days mm_data run scoreboard players add system_month mm_data 1
execute if score system_day mm_data > total_days mm_data run scoreboard players set system_day mm_data 1

#年
execute if score system_month mm_data matches 13.. run scoreboard players add system_year mm_data 1
execute if score system_month mm_data matches 13.. run scoreboard players set system_month mm_data 1