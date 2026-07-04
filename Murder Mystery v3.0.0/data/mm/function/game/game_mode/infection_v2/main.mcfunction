#显示标题和消息及定时性事件
execute as @a[tag=mm_playing] run function mm:game/game_module/countdown_display {offset:15,translate_key:"mm.text.alpha_select"}

execute if score special_role_random mm_settings matches 0 run function mm:game/game_module/event_scheduler {offset:15,callback:"mm:game/game_module/infection_v2/alpha_select/weight"}
execute if score special_role_random mm_settings matches 1 run function mm:game/game_module/event_scheduler {offset:15,callback:"mm:game/game_module/infection_v2/alpha_select/random"}

##60秒倒计时
function mm:game/game_module/event_scheduler {offset:-60,callback:"mm:game/game_module/infection_v2/hint_message"}

##母体无敌状态消失
function mm:game/game_module/event_scheduler {offset:30,callback:"mm:game/game_module/infection_v2/alpha_invincible_gone"}

#计算获得武器时间
scoreboard players operation get_weapon mm_main = game_time mm_settings
scoreboard players remove get_weapon mm_main 15

#感染者/母体暴露计时
execute if score infected_tick mm_main matches 1.. run scoreboard players remove infected_tick mm_main 1

#死亡
function mm:game/game_module/infection_v2/die

#感染者/母体丢刀
function mm:game/game_module/infection_v2/throw_knife

#感染者换飞刀
execute as @a[tag=mm_infected,tag=!mm_dead] run function mm:game/game_module/infection_v2/thrown_knife_collection

#幸存者弓/换箭
execute as @a[tag=mm_survivor] run function mm:game/game_module/infection_v2/survivor_bow

#追踪幸存者/感染者/母体
execute if score timer mm_main matches 0 run function mm:game/game_module/infection_v2/tracker/main

#丢弃物品矫正
function mm:game/game_module/infection_v2/drop_item

#底部标题
execute as @a[tag=mm_playing] run function mm:game/game_module/infection_v2/actionbar_display/main

#胜负判定
execute if score survivor_left mm_data matches 0 run function mm:game/game_mode/infection_v2/end
execute if score game_second mm_main < get_weapon mm_main if score infected_real_left mm_data matches 0 run function mm:game/game_mode/infection_v2/end
execute if score game_second mm_main matches 0 run function mm:game/game_mode/infection_v2/end