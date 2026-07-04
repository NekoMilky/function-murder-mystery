$data modify storage mm:main temporary.objective set value $(objective)
$data modify storage mm:main temporary.line set value $(line)
execute store result storage mm:main temporary.count int 1 run scoreboard players get innocent_left mm_data

function mm:scoreboard/entries/innocent_left/display with storage mm:main temporary