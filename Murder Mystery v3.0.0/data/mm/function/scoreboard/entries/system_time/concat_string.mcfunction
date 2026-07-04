data modify storage mm:main temporary.string_1 set from storage mm:main temporary.time
$data modify storage mm:main temporary.string_2 set value "$(separator)"
function mm:utils/concat_string_to_storage with storage mm:main temporary