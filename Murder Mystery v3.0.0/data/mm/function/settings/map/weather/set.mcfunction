execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.map_name"
data modify storage mm:main temporary.source_path set value "Name"
function mm:utils/get_map_data_to_storage with storage mm:main temporary

data modify storage mm:main temporary.path set value "Weather"
$data modify storage mm:main temporary.value set value $(weather)
function mm:utils/set_map_data with storage mm:main temporary

$data modify storage mm:main temporary.weather_name set value "$(weather_name)"
function mm:settings/map/weather/message with storage mm:main temporary

function mm:common/map_correction/main