#状态更新
function mm:game/game_module/map_features/common/main {name:"monorail",item_tag:"Minecart",fail_api:72,success_api:73}

#矿车运动
execute as @e[tag=mm_monorail] run function mm:game/game_module/map_features/monorail/monorail_movement