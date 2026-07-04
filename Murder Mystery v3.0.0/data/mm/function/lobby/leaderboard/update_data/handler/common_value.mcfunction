$execute store result storage mm:main temporary.value int 1 run scoreboard players get $(name) mm_temporary
data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "temporary.entry_value"

function mm:utils/set_string_data with storage mm:main temporary