$execute on origin if items entity @s container.* *[minecraft:custom_data~{Gun:1,type:"$(type)"}] run function mm:gun/drop_item/search_slot {empty:0,slot:0,type:$(type)}
$execute on origin unless items entity @s container.* *[minecraft:custom_data~{Gun:1,type:"$(type)"}] run function mm:gun/drop_item/search_slot {empty:1,slot:0,type:$(type)}

kill @s