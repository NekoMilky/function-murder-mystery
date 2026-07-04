data modify storage mm:main temporary.owner set from entity @s SelectedItem.components."minecraft:custom_data".owner
data modify storage mm:main temporary.type set from entity @s SelectedItem.components."minecraft:custom_data".type

function mm:gun/shoot/resolve with storage mm:main temporary