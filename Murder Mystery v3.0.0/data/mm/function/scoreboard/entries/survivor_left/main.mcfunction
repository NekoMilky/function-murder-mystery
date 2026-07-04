$data modify storage mm:main temporary.objective set value $(objective)
$data modify storage mm:main temporary.line set value $(line)
execute store result storage mm:main temporary.count int 1 run scoreboard players get survivor_left mm_data

function mm:scoreboard/entries/survivor_left/display with storage mm:main temporary