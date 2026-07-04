#游戏结束
function mm:waiting/game_end
scoreboard players set #ALL mm_API 8

#游戏模式
function mm:game/game_module/gamemode

#统计数据
execute if score sheriff_left mm_data matches 0 run tellraw @a[tag=mm_outlaw] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"5"},{"translate":"mm.text.win_as.outlaw"}]}
execute if score sheriff_left mm_data matches 0 run scoreboard players add @a[tag=mm_outlaw] mm_stats_1 1
execute if score sheriff_left mm_data matches 0 run scoreboard players add @a[tag=mm_outlaw] mm_stats_14 5

execute if score outlaw_left mm_data matches 0 run tellraw @a[tag=mm_sheriff] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"5"},{"translate":"mm.text.win_as.sheriff"}]}
execute if score outlaw_left mm_data matches 0 run scoreboard players add @a[tag=mm_sheriff] mm_stats_1 1
execute if score outlaw_left mm_data matches 0 run scoreboard players add @a[tag=mm_sheriff] mm_stats_14 5

execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data > sheriff_kill_count mm_data run tellraw @a[tag=mm_outlaw] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"5"},{"translate":"mm.text.win_as.outlaw"}]}
execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data > sheriff_kill_count mm_data run scoreboard players add @a[tag=mm_outlaw] mm_stats_1 1
execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data > sheriff_kill_count mm_data run scoreboard players add @a[tag=mm_outlaw] mm_stats_14 5

execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data < sheriff_kill_count mm_data run tellraw @a[tag=mm_sheriff] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"5"},{"translate":"mm.text.win_as.sheriff"}]}
execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data < sheriff_kill_count mm_data run scoreboard players add @a[tag=mm_sheriff] mm_stats_1 1
execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data < sheriff_kill_count mm_data run scoreboard players add @a[tag=mm_sheriff] mm_stats_14 5

#本局游戏总结
tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.datapack.name","bold":true}]

execute if score sheriff_left mm_data matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.outlaw","color":"red"}]}]
execute if score outlaw_left mm_data matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.sheriff","color":"aqua"}]}]
execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data > sheriff_kill_count mm_data run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.outlaw","color":"red"}]}]
execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data < sheriff_kill_count mm_data run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.sheriff","color":"aqua"}]}]
execute if score game_second mm_main matches 0 if score outlaw_kill_count mm_data = sheriff_kill_count mm_data run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner.draw","color":"yellow"}]

function mm:game/game_module/rank/main {name:"kill",filter:"tag=!mm_origin",objective:"mm_kill_count",template:{"translate":"mm.text.rank_entry.kill","color":"white","with":[{"selector":"@s"},{"score":{"objective":"mm_kill_count","name":"@s"},"color":"green"}]}}

function mm:game/game_module/highest_kd_rate {filter:"tag=!mm_origin"}

tellraw @a[tag=mm_playing] ""

tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}