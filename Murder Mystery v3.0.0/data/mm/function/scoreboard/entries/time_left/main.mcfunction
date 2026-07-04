data modify storage mm:main temporary.time set value ""

#分
function mm:scoreboard/entries/time_left/build_string {type:"minute"}

data modify storage mm:main temporary.string_1 set from storage mm:main temporary.time
data modify storage mm:main temporary.string_2 set value ":"
function mm:utils/concat_string_to_storage with storage mm:main temporary

#秒
function mm:scoreboard/entries/time_left/build_string {type:"second"}

$data modify storage mm:main temporary.line set value $(line)
$data modify storage mm:main temporary.objective set value $(objective)
function mm:scoreboard/entries/time_left/display with storage mm:main temporary