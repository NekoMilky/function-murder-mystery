#初始化
$execute unless entity @a[tag=mm_playing,tag=!mm_spectator,$(filter)] run return 0

execute as @a[tag=mm_ranked] run tag @s remove mm_ranked
execute as @a[tag=mm_playing,tag=mm_spectator] run tag @s add mm_ranked

#表头
tellraw @a[tag=mm_playing] ""
$tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.rank.$(name)"}]

#表项
$function mm:game/game_module/rank/entry {rank:1,filter:"$(filter)",objective:$(objective),template:$(template)}

#移除标签
execute as @a[tag=mm_ranked] run tag @s remove mm_ranked