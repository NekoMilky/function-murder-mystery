$execute if score playing_player_count mm_data matches 1 run data modify entity @s $(path).translate set value "mm.text.current_playing.single"
$execute unless score playing_player_count mm_data matches 1 run data modify entity @s $(path).translate set value "mm.text.current_playing.plural"

$data modify storage mm:main temporary.resolve_path set value "$(resolve_path)"
execute store result storage mm:main temporary.count int 1 run scoreboard players get playing_player_count mm_data
function mm:lobby/update_current_playing/resolve with storage mm:main temporary