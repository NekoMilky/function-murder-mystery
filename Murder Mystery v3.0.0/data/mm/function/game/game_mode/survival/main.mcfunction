#显示标题和消息及定时性事件
execute as @a[tag=mm_playing] run function mm:game/game_module/countdown_display {offset:15,translate_key:"mm.text.ghost_start_spawn"}

function mm:game/game_module/event_scheduler {offset:15,callback:"mm:game/game_module/survival/ghost_start_spawn"}

##60秒倒计时
function mm:game/game_module/event_scheduler {offset:-60,callback:"mm:game/game_module/survival/hint_message"}

#死亡
function mm:game/game_module/survival/die

#恶灵技能
function mm:game/game_module/survival/ghost_skill

#恶灵生成
function mm:game/game_module/survival/ghost_spawn

#幸存者弓/换箭
execute as @a[tag=mm_survivor,tag=!mm_dead] run function mm:game/game_module/survival/survivor_bow

#丢弃物品矫正
function mm:game/game_module/survival/drop_item

#底部标题
execute as @a[tag=mm_playing] run function mm:game/game_module/survival/actionbar_display

#胜负判定
execute if score survivor_left mm_data matches 0 run function mm:game/game_mode/survival/end
execute if score game_second mm_main matches 0 run function mm:game/game_mode/survival/end