data modify storage mm:main temporary.hour set string block 2999999 0 2999999 LastOutput.text 1 3
data modify storage mm:main temporary.minute set string block 2999999 0 2999999 LastOutput.text 4 6
data modify storage mm:main temporary.second set string block 2999999 0 2999999 LastOutput.text 7 9
function mm:scoreboard/calculate_data/system_time/main with storage mm:main temporary