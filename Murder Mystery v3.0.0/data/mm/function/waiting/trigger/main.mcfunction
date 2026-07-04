$execute if score game_start mm_main matches 1 run function mm:waiting/trigger/triggered {min:$(min),max:$(max)}
execute if score game_start mm_main matches 1.. run return 0

execute if score game_pause mm_main matches 1 run return 0

execute unless data storage mm:main map.SpawnLobby run return 0

execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"SpawnWaiting"}
execute if score check_type mm_main matches 0 run return 0

execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"SpawnCenter"}
execute if score check_type mm_main matches 0 run return 0

execute store result score check_type mm_main run function mm:utils/check_selected_map_data/main {path:"Spawn"}
execute if score check_type mm_main matches 0 run return 0

$execute if score playing_player_real_count mm_data matches $(min)..$(max) run scoreboard players set #ALL mm_API 3
$execute if score playing_player_real_count mm_data matches $(min)..$(max) run scoreboard players set game_start mm_main 1