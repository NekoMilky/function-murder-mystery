#显示标题和消息及定时性事件
##经典/双倍/道具/道具双倍模式
execute unless score game_mode mm_main matches 9 as @a[tag=mm_murderer] run function mm:game/game_module/countdown_display {offset:15,translate_key:"mm.text.murderer_get_sword.self"}

execute unless score game_mode mm_main matches 9 unless score murderer_count mm_settings matches 2.. as @a[tag=mm_playing,tag=!mm_murderer] run function mm:game/game_module/countdown_display {offset:15,translate_key:"mm.text.murderer_get_sword.classic"}
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2.. as @a[tag=mm_playing,tag=!mm_murderer] run function mm:game/game_module/countdown_display {offset:15,translate_key:"mm.text.murderer_get_sword.double_up"}

execute unless score game_mode mm_main matches 9 run function mm:game/game_module/event_scheduler {offset:15,callback:"mm:game/game_module/classic/get_weapon/both"}

##大爹模式
execute if score game_mode mm_main matches 9 as @a[tag=mm_murderer] run function mm:game/game_module/countdown_display {offset:15,translate_key:"mm.text.detective_get_bow.murderer"}
execute if score game_mode mm_main matches 9 as @a[tag=mm_murderer] run function mm:game/game_module/countdown_display {offset:75,translate_key:"mm.text.murderer_get_sword.self"}

execute if score game_mode mm_main matches 9 as @a[tag=mm_detective] run function mm:game/game_module/countdown_display {offset:15,translate_key:"mm.text.detective_get_bow.self"}
execute if score game_mode mm_main matches 9 as @a[tag=mm_detective] run function mm:game/game_module/countdown_display {offset:75,translate_key:"mm.text.murderer_get_sword.classic"}

execute if score game_mode mm_main matches 9 run function mm:game/game_module/event_scheduler {offset:15,callback:"mm:game/game_module/classic/get_weapon/detective"}
execute if score game_mode mm_main matches 9 run function mm:game/game_module/event_scheduler {offset:75,callback:"mm:game/game_module/classic/get_weapon/murderer"}

##60秒倒计时
function mm:game/game_module/event_scheduler {offset:-60,callback:"mm:game/game_module/classic/hint_message"}

#计算获得武器时间
scoreboard players operation get_weapon mm_main = game_time mm_settings
scoreboard players remove get_weapon mm_main 15

#死亡
function mm:game/game_module/classic/die

#接替杀手
execute unless score game_mode mm_main matches 9 if score game_second mm_main > get_weapon mm_main if score murderer_real_left mm_data < murderer_count mm_settings run function mm:game/game_module/classic/murderer_replace

#道具掉落及效果
execute if score game_mode mm_main matches 5 if score game_second mm_main <= get_weapon mm_main run function mm:game/game_module/prop/prop_spawn
execute if score game_mode mm_main matches 8 if score game_second mm_main <= get_weapon mm_main run function mm:game/game_module/prop/prop_spawn

#平民/杀手换弓
execute as @a[tag=!mm_dead,tag=mm_murderer] run function mm:game/game_module/classic/bow_collection
execute as @a[tag=!mm_dead,tag=mm_innocent,tag=!mm_detective] run function mm:game/game_module/classic/bow_collection

#杀手飞刀及牵引遗体
function mm:game/game_module/classic/throw_knife

#侦探弓
execute as @a[tag=mm_detective,tag=!mm_dead] run function mm:game/game_module/classic/detective_bow

#追踪平民/追踪弓
execute unless score game_mode mm_main matches 9 if score timer mm_main matches 0 run function mm:game/game_module/classic/tracker/main

#掉落弓/捡弓
execute unless score game_mode mm_main matches 9 run function mm:game/game_module/classic/dropped_bow

#丢弃物品矫正
function mm:game/game_module/classic/drop_item

#底部标题
execute as @a[tag=mm_playing] run function mm:game/game_module/classic/actionbar_display/main

#胜负判定
execute if score innocent_left mm_data matches 0 run function mm:game/game_mode/classic/end
execute if score murderer_left mm_data matches 0 run function mm:game/game_mode/classic/end
execute if score game_second mm_main matches 0 run function mm:game/game_mode/classic/end