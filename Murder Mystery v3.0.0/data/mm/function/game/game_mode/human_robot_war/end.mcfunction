#游戏结束
function mm:waiting/game_end
scoreboard players set #ALL mm_API 8

#游戏模式
function mm:game/game_module/gamemode

#队伍
team modify mm_human color green
team modify mm_human nametagVisibility hideForOtherTeams
team modify mm_robot color gold
team modify mm_robot nametagVisibility hideForOtherTeams

#本局游戏总结
tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.datapack.name","bold":true}]

execute if score human_left mm_data matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.robot","color":"gold"}]}]
execute if score robot_left mm_data matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.human","color":"green"}]}]
execute if score game_second mm_main matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner.draw","color":"yellow"}]

execute if score human_left mm_data matches 0 run scoreboard players add @a[tag=mm_robot] mm_stats_1 1
execute if score robot_left mm_data matches 0 run scoreboard players add @a[tag=mm_human] mm_stats_1 1

function mm:game/game_module/rank/main {name:"kill",filter:"tag=!mm_origin",objective:"mm_kill_count",template:{"translate":"mm.text.rank_entry.kill","color":"white","with":[{"selector":"@s"},{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]}}

function mm:game/game_module/highest_kd_rate {filter:"tag=!mm_origin"}

tellraw @a[tag=mm_playing] ""

tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}