scoreboard players operation this_index mm_main = @s mm_cosmetics
$scoreboard players operation this_index mm_main -= $(base) mm_main

$execute unless score this_index mm_main matches 0.. unless score this_index mm_main <= cosmetics_$(name)_count mm_main run return 0

$scoreboard players operation @s mm_$(name) = this_index mm_main

$data modify storage mm:main temporary.name set value "$(name)"
execute store result storage mm:main temporary.index int 1 run scoreboard players get this_index mm_main
function mm:cosmetics/message with storage mm:main temporary