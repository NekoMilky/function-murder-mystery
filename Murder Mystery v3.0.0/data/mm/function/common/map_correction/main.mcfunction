#时间
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.time"
data modify storage mm:main temporary.source_path set value "Time"
function mm:utils/get_map_data_to_storage with storage mm:main temporary
function mm:common/map_correction/set_time with storage mm:main temporary

#天气
execute store result storage mm:main temporary.index int 1 run scoreboard players get selected_map mm_main
data modify storage mm:main temporary.path set value "temporary.weather"
data modify storage mm:main temporary.source_path set value "Weather"
function mm:utils/get_map_data_to_storage with storage mm:main temporary
function mm:common/map_correction/set_weather with storage mm:main temporary