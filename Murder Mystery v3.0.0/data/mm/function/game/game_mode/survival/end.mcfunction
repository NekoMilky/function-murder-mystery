#游戏结束
function mm:waiting/game_end
scoreboard players set #ALL mm_API 8

#游戏模式
function mm:game/game_module/gamemode

#幸存者存活时间
execute as @a[tag=mm_survivor,tag=!mm_dead] run scoreboard players operation @s mm_survive_time = game_time mm_settings

execute if score game_second mm_main matches 0 run tellraw @a[tag=mm_survivor,tag=!mm_dead] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"10"},{"translate":"mm.text.win_as.survivor"}]}
execute if score game_second mm_main matches 0 run scoreboard players add @a[tag=mm_survivor,tag=!mm_dead] mm_stats_1 1
execute if score game_second mm_main matches 0 run scoreboard players add @a[tag=mm_survivor,tag=!mm_dead] mm_stats_14 10

execute as @a[tag=mm_survivor] run scoreboard players operation @s mm_stats_9 += @s mm_survive_time

#本局游戏总结
tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.datapack.name","bold":true}]

execute if score survivor_left mm_data matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.ghost","color":"red"}]}]
execute if score survivor_left mm_data matches 0 run scoreboard players set @a[tag=mm_survivor] mm_API_p 51

execute if score game_second mm_main matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.survivor","color":"green"}]}]
execute if score game_second mm_main matches 0 run scoreboard players set @a[tag=mm_survivor] mm_API_p 49

function mm:game/game_module/rank/main {name:"survivor",filter:"tag=!mm_origin",objective:"mm_survive_time",template:{"translate":"mm.text.rank_entry.survivor","color":"white","with":[{"selector":"@s"},{"score":{"objective":"mm_survive_time","name":"@s"},"color":"green"},{"score":{"objective":"mm_kill_count_s","name":"@s"},"color":"green"}]}}

tellraw @a[tag=mm_playing] ""

tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}