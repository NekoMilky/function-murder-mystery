$scoreboard players set system_hour mm_data $(hour)
$scoreboard players set system_minute mm_data $(minute)
$scoreboard players set system_second mm_data $(second)

execute if score system_hour mm_data < last_system_hour mm_data if score system_hour mm_data matches 0 run function mm:scoreboard/calculate_data/system_time/add_day

$scoreboard players set last_system_hour mm_data $(hour)