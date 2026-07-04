$scoreboard players set this_index mm_main $(index)

$scoreboard players set target_operation mm_main $(index)
$scoreboard players operation target_operation mm_main += $(base) mm_main

$data modify storage mm:main dialog.dialog.actions append value {\
  "label": {\
    "translate": "mm.text_cosmetics.$(name).$(index)",\
    "color": "yellow"\
  },\
  "action": {\
    "type": "run_command",\
    "command": ""\
  }\
}

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "temporary.string_2"
execute store result storage mm:main temporary.value int 1 run scoreboard players get target_operation mm_main
function mm:utils/set_string_data with storage mm:main temporary

data modify storage mm:main temporary.path set value "dialog.dialog.actions[-1].action.command"
data modify storage mm:main temporary.string_1 set value "/trigger mm_cosmetics set "
function mm:utils/concat_string_to_storage with storage mm:main temporary

$execute unless score this_index mm_main < cosmetics_$(name)_count mm_main run return 0

$data modify storage mm:main temporary.name set value "$(name)"
$data modify storage mm:main temporary.base set value $(base)
scoreboard players add this_index mm_main 1
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main
function mm:dialog/cosmetics/add with storage mm:main temporary