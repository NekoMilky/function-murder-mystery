#分配身份
tag @a[tag=mm_playing,tag=!mm_spectator] add mm_human

#加入队伍
team join mm_human @a[tag=mm_human]

#人机大战模式说明
tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.human_robot_war","bold":true}]
tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.human_robot_war.description","color":"yellow"}]

tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

#数据运算
function mm:scoreboard/calculate_data/main