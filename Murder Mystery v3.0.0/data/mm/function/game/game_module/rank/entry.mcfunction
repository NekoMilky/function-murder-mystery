#无可排玩家退出
$execute unless entity @a[tag=mm_playing,tag=!mm_ranked,$(filter)] run return 0

#当前名次统计
$scoreboard players set this_rank mm_main $(rank)

#创建临时计分项
scoreboard objectives add mm_temporary dummy

#找出最大值
$execute as @a[tag=mm_playing,tag=!mm_ranked,$(filter)] run scoreboard players operation @s mm_temporary = @s $(objective)
$execute as @a[tag=mm_playing,tag=!mm_ranked,$(filter)] run scoreboard players operation @s mm_temporary > @a[tag=mm_playing,tag=!mm_ranked,$(filter)] mm_temporary
$execute as @a[tag=mm_playing,tag=!mm_ranked,$(filter)] run scoreboard players operation @s mm_temporary -= @s $(objective)

$execute as @a[tag=mm_playing,tag=!mm_ranked,$(filter),scores={mm_temporary=0}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"text":"#$(rank) ","color":"white"},$(template)]

$execute as @a[tag=mm_playing,tag=!mm_ranked,$(filter),scores={mm_temporary=0}] run scoreboard players add this_rank mm_main 1
$execute as @a[tag=mm_playing,tag=!mm_ranked,$(filter),scores={mm_temporary=0}] run tag @s add mm_ranked

#移除临时计分项
scoreboard objectives remove mm_temporary

#递归
execute if score this_rank mm_main matches 4.. run return 0

$data modify storage mm:main temporary.filter set value "$(filter)"
$data modify storage mm:main temporary.objective set value "$(objective)"
$data modify storage mm:main temporary.template set value $(template)
execute store result storage mm:main temporary.rank int 1 run scoreboard players get this_rank mm_main

function mm:game/game_module/rank/entry with storage mm:main temporary