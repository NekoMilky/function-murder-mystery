#掉落弓旋转
execute as @e[tag=mm_dropped_bow] at @s run tp @s ~ ~ ~ ~4 ~

#平民捡弓
execute as @e[tag=mm_dropped_bow] at @s if entity @a[dy=0,tag=mm_innocent,tag=!mm_detective,tag=!mm_dead] run tag @p[dy=0,tag=mm_innocent,tag=!mm_detective,tag=!mm_dead] add mm_pick_up_bow
execute as @e[tag=mm_dropped_bow] at @s if entity @a[dy=0,tag=mm_pick_up_bow] run scoreboard players operation @p[tag=mm_pick_up_bow] mm_spe_id = @s mm_spe_id
execute as @e[tag=mm_dropped_bow] at @s if entity @a[dy=0,tag=mm_innocent,tag=!mm_detective,tag=!mm_dead] run kill @s

execute unless score murderer_count mm_settings matches 2.. as @a[tag=mm_pick_up_bow] at @s run tellraw @a[tag=mm_playing,tag=!mm_pick_up_bow] {"translate":"mm.text.bow_pick_up.classic","color":"yellow"}
execute if score murderer_count mm_settings matches 2.. as @a[tag=mm_pick_up_bow] at @s run tellraw @a[tag=mm_playing,tag=!mm_pick_up_bow] {"translate":"mm.text.bow_pick_up.double_up","color":"yellow"}

execute unless score murderer_count mm_settings matches 2.. as @a[tag=mm_pick_up_bow] run tellraw @s {"translate":"mm.text.bow_pick_up.self","color":"yellow","with":[{"translate":"mm.text.bow_pick_up.goal","color":"gold"},{"translate":"mm.text.bow_pick_up.goal.classic","color":"green"}]}
execute if score murderer_count mm_settings matches 2.. as @a[tag=mm_pick_up_bow] run tellraw @s {"translate":"mm.text.bow_pick_up.self","color":"yellow","with":[{"translate":"mm.text.bow_pick_up.goal","color":"gold"},{"translate":"mm.text.bow_pick_up.goal.double_up","color":"green"}]}

execute as @a[tag=mm_pick_up_bow] unless items entity @s container.* *[minecraft:custom_data~{Bow:1}] run loot replace entity @s hotbar.0 loot mm:bow
execute as @a[tag=mm_pick_up_bow] run function mm:utils/give_or_replace/main {id:"arrow",count:1,slot:1}
execute as @a[tag=mm_pick_up_bow] run tag @s add mm_detective
execute as @a[tag=mm_pick_up_bow] run scoreboard players set @s mm_API_p 100

execute as @a[tag=mm_pick_up_bow] run tag @s remove mm_pick_up_bow

#侦探离开
execute if score detective_and_dropped_bow_total_left mm_data >= murderer_count mm_settings run return 0

execute unless score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_playing] {"translate":"mm.text.detective_leave.classic","color":"gold"}
execute if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_playing] {"translate":"mm.text.detective_leave.double_up","color":"gold"}

summon minecraft:armor_stand 2999999 0 2999999 {Invisible:1,ShowArms:1,NoGravity:1,equipment:{mainhand:{id:"minecraft:bow",count:1}},Pose:{RightArm:[225f,-90f,0f]},DisabledSlots:7967,Tags:["mm_dropped_bow","mm_new"]}
execute unless entity @a[tag=mm_detective,tag=!mm_dead,scores={mm_spe_id=1}] unless entity @a[tag=mm_dropped_bow,scores={mm_spe_id=1}] run scoreboard players set @e[tag=mm_dropped_bow,tag=mm_new,limit=1] mm_spe_id 1
execute unless entity @a[tag=mm_detective,tag=!mm_dead,scores={mm_spe_id=2}] unless entity @a[tag=mm_dropped_bow,scores={mm_spe_id=2}] run scoreboard players set @e[tag=mm_dropped_bow,tag=mm_new,limit=1] mm_spe_id 2
execute positioned 2999999 0 2999999 as @e[tag=mm_dropped_bow,tag=mm_new,limit=1] run function mm:utils/teleport_to_spawn_center/main
tag @e[tag=mm_dropped_bow,tag=mm_new,limit=1] remove mm_new

function mm:scoreboard/calculate_data/main