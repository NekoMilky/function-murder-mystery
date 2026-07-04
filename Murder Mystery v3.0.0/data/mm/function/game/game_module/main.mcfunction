#计时
function mm:game/game_module/timing

#金锭生成
function mm:game/game_module/gold_ingot/main

#特殊元素
function mm:game/game_module/map_features/main

#视觉效果
execute if score timer_short mm_main matches 0 run function mm:game/game_module/sight_effect

#标签
function mm:game/game_module/tags

#丢弃物品矫正
function mm:game/game_module/drop_item/main

#状态重置
function mm:game/game_module/values_reset