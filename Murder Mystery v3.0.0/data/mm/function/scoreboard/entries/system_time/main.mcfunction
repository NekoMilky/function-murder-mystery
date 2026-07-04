data modify storage mm:main temporary.time set value ""

#年
function mm:scoreboard/entries/system_time/build_string {type:"year"}
function mm:scoreboard/entries/system_time/concat_string {separator:"/"}

#月
function mm:scoreboard/entries/system_time/build_string {type:"month"}
function mm:scoreboard/entries/system_time/concat_string {separator:"/"}

#日
function mm:scoreboard/entries/system_time/build_string {type:"day"}
function mm:scoreboard/entries/system_time/concat_string {separator:" "}

#时
function mm:scoreboard/entries/system_time/build_string {type:"hour"}
function mm:scoreboard/entries/system_time/concat_string {separator:":"}

#分
function mm:scoreboard/entries/system_time/build_string {type:"minute"}
function mm:scoreboard/entries/system_time/concat_string {separator:":"}

#秒
function mm:scoreboard/entries/system_time/build_string {type:"second"}

$data modify storage mm:main temporary.objective set value $(objective)
data modify storage mm:main temporary.server_id set from storage mm:main server_id
function mm:scoreboard/entries/system_time/display with storage mm:main temporary