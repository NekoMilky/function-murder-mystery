data modify storage mm:main temporary.path set value "temporary.time"
data modify storage mm:main temporary.string_1 set from storage mm:main temporary.time
data modify storage mm:main temporary.string_2 set value ""
$execute if score time_left_$(type) mm_data matches ..9 run data modify storage mm:main temporary.string_2 set value "0"
function mm:utils/concat_string_to_storage with storage mm:main temporary

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "temporary.string_2"
$execute store result storage mm:main temporary.value int 1 run scoreboard players get time_left_$(type) mm_data
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "temporary.time"
data modify storage mm:main temporary.string_1 set from storage mm:main temporary.time
function mm:utils/concat_string_to_storage with storage mm:main temporary