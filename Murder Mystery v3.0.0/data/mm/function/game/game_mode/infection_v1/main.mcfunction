#显示标题和消息及定时性事件
execute as @a[tag=mm_playing] run function mm:game/game_module/countdown_display {offset:15,translate_key:"mm.text.infected_select"}

function mm:game/game_module/event_scheduler {offset:15,callback:"mm:game/game_module/infection_v1/infected_select"}

##60秒倒计时
function mm:game/game_module/event_scheduler {offset:-60,callback:"mm:game/game_module/infection_v1/hint_message"}

#计算获得武器时间
scoreboard players operation get_weapon mm_main = game_time mm_settings
scoreboard players remove get_weapon mm_main 15

#死亡
function mm:game/game_module/infection_v1/die

#幸存者弓
execute as @a[tag=mm_survivor] run function mm:game/game_module/infection_v1/survivor_bow

#追踪幸存者
execute if score timer mm_main matches 0 run function mm:game/game_module/infection_v1/tracker/main

#丢弃物品矫正
function mm:game/game_module/infection_v1/drop_item

#底部标题
execute as @a[tag=mm_playing] run function mm:game/game_module/infection_v1/actionbar_display

#胜负判定
execute if score survivor_left mm_data matches 0 run function mm:game/game_mode/infection_v1/end
execute if score game_second mm_main < get_weapon mm_main if score infected_left mm_data matches 0 run function mm:game/game_mode/infection_v1/end
execute if score game_second mm_main matches 0 run function mm:game/game_mode/infection_v1/end