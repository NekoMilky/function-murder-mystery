#计分项
scoreboard players set spawn_ghost_weight mm_main 2
scoreboard players set ghost_spawn_tick mm_main -1

#分配身份
tag @a[tag=mm_playing,tag=!mm_spectator] add mm_survivor
execute as @a[tag=mm_survivor] run scoreboard players set @s mm_API_p 47

#给予铁胸甲
execute as @a[tag=mm_survivor] run loot replace entity @s armor.chest loot mm:chestplate

#加入队伍
team join mm_survivor @a[tag=mm_survivor]

#显示标题
title @a[tag=mm_survivor] subtitle {"translate":"mm.title.survivor.subtitle.survival","color":"yellow"}
title @a[tag=mm_survivor] title {"translate":"mm.title.survivor","color":"green"}

#生存模式说明
tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.survival","bold":true}]
tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.survival.description.1","color":"yellow"}]
tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.game_mode.survival.description.2","color":"yellow"}]

tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

#数据运算
function mm:scoreboard/calculate_data/main