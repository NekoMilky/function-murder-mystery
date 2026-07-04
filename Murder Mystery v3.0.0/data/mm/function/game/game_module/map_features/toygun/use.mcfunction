tag @s add mm_toygun_shoot

#生成
execute at @s anchored eyes positioned ^-0.2 ^ ^ positioned ~ ~-1.3 ~ run summon minecraft:armor_stand ^ ^ ^ {Invisible:1,ShowArms:1,NoGravity:1,Pose:{RightArm:[-10f,0f,-90f]},DisabledSlots:7967,Tags:["mm_toygun","mm_new"]}

execute at @s store result entity @n[tag=mm_toygun,tag=mm_new] Pose.RightArm[1] float 1 run data get entity @s Rotation[1]
execute at @s as @n[tag=mm_toygun,tag=mm_new] at @s rotated as @p[tag=mm_toygun_shoot] run tp @s ~ ~ ~ ~ ~

#玩具枪皮肤
execute at @s run loot replace entity @n[tag=mm_toygun,tag=mm_new] weapon.mainhand loot mm:map_features/toygun

#编号
execute at @s run scoreboard players operation @n[tag=mm_toygun,tag=mm_new] mm_players_id = @s mm_players_id

#标签
execute at @s run tag @n[tag=mm_toygun,tag=mm_new] remove mm_new
execute as @s[tag=mm_toygun_shoot] run tag @s remove mm_toygun_shoot

#扣除玩具枪
scoreboard players set @s mm_API_p 87
execute at @s run playsound minecraft:entity.ender_dragon.flap player @s ~ ~ ~ 1 1
execute store result score @s mm_toygun_tick run function mm:utils/get_value_in_inventory {search_tags:"Toygun:1",target_tag:"Cooldown"}
function mm:utils/clear_with_tag {item_tag:"Toygun",max_count:1}