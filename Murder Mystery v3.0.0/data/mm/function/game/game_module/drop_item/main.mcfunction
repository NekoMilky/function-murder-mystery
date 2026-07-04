#金锭
execute as @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},nbt=!{Item:{components:{"minecraft:custom_data":{Pickup:0}}}}] run function mm:game/game_module/drop_item/gold_ingot

#箭
execute as @e[type=item,nbt={Item:{id:"minecraft:arrow"}}] run function mm:game/game_module/drop_item/arrow

#禁用的箭
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{DisabledArrow:1}}}}] run function mm:game/game_module/drop_item/disabled_arrow

#地图特性道具
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{MapFeatures:1}}}}] run function mm:game/game_module/drop_item/map_features