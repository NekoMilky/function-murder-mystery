$data modify storage mm:main temporary.slot set from entity @s Inventory[{components:{"minecraft:custom_data":{Gun:1,type:"$(type)"}}}].Slot
$data modify storage mm:main temporary.owner set value "$(owner)"
$data modify storage mm:main temporary.type set value "$(type)"

function mm:gun/update_status/every_gun/entry with storage mm:main temporary