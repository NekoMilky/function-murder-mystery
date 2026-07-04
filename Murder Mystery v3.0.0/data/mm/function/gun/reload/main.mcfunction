execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{Gun:1}] run return 0

data modify storage mm:main temporary.owner set from entity @s SelectedItem.components."minecraft:custom_data".owner
data modify storage mm:main temporary.type set from entity @s SelectedItem.components."minecraft:custom_data".type

function mm:gun/reload/resolve with storage mm:main temporary