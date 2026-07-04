#分配队伍
scoreboard players operation player_half mm_main = playing_player_real_count mm_data
scoreboard players operation player_half mm_main /= 2 mm_main

execute as @a[tag=mm_playing,tag=!mm_spectator] if score @s mm_players_id <= player_half mm_main run tag @s add mm_outlaw
tag @a[tag=mm_playing,tag=!mm_outlaw,tag=!mm_spectator] add mm_sheriff

team join mm_outlaw @a[tag=mm_outlaw]
team join mm_sheriff @a[tag=mm_sheriff]

execute as @a[tag=mm_outlaw,limit=1] run tp @a[tag=mm_outlaw] @s
execute as @a[tag=mm_sheriff,limit=1] run tp @a[tag=mm_sheriff] @s

##接口
execute as @a[tag=mm_outlaw] run scoreboard players set @s mm_API_p 61
execute as @a[tag=mm_sheriff] run scoreboard players set @s mm_API_p 61

#给予胸甲
execute as @a[tag=mm_playing] run loot replace entity @s armor.chest loot mm:chestplate

#显示标题
title @a[tag=mm_outlaw] subtitle {"translate":"mm.title.outlaw.subtitle","color":"yellow"}
title @a[tag=mm_outlaw] title {"translate":"mm.title.outlaw","color":"red"}

title @a[tag=mm_sheriff] subtitle {"translate":"mm.title.sheriff.subtitle","color":"yellow"}
title @a[tag=mm_sheriff] title {"translate":"mm.title.sheriff","color":"aqua"}

#对决模式说明
execute if score game_mode mm_main matches 3 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

execute if score game_mode mm_main matches 3 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.showdown","bold":true}]
execute if score game_mode mm_main matches 3 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.showdown.description.1","color":"yellow"}]
execute if score game_mode mm_main matches 3 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.showdown.description.2","color":"yellow"}]

execute if score game_mode mm_main matches 3 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

#枪械对决模式说明
execute if score game_mode mm_main matches 10 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

execute if score game_mode mm_main matches 10 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.showdown_armed","bold":true}]
execute if score game_mode mm_main matches 10 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.showdown.description.1","color":"yellow"}]
execute if score game_mode mm_main matches 10 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.showdown.description.2","color":"yellow"}]
execute if score game_mode mm_main matches 10 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.showdown_armed.description","color":"yellow"}]

execute if score game_mode mm_main matches 10 run tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

#数据运算
function mm:scoreboard/calculate_data/main