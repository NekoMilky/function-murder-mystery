$data modify storage mm:main temporary.objective set value $(objective)
$data modify storage mm:main temporary.line set value $(line)
execute store result storage mm:main temporary.count int 1 run scoreboard players get infected_real_left mm_data

function mm:scoreboard/entries/infected_left/display with storage mm:main temporary