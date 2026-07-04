tag @s add mm_thrown_knife_shoot

#生成
execute at @s anchored eyes positioned ^-0.2 ^ ^ positioned ~ ~-1.3 ~ run summon minecraft:armor_stand ^ ^ ^ {Invisible:1,ShowArms:1,NoGravity:1,Pose:{RightArm:[-10f,0f,-90f]},DisabledSlots:7967,Tags:["mm_thrown_knife","mm_new"]}

execute at @s store result entity @n[tag=mm_thrown_knife,tag=mm_new] Pose.RightArm[1] float 1 run data get entity @s Rotation[1]
execute at @s as @n[tag=mm_thrown_knife,tag=mm_new] at @s rotated as @p[tag=mm_thrown_knife_shoot] run tp @s ~ ~ ~ ~ ~

#匕首皮肤
execute at @s run loot replace entity @n[tag=mm_thrown_knife,tag=mm_new] weapon.mainhand loot mm:knife

#编号
execute at @s run scoreboard players operation @n[tag=mm_thrown_knife,tag=mm_new] mm_players_id = @s mm_players_id

#标签
execute at @s run tag @n[tag=mm_thrown_knife,tag=mm_new] remove mm_new
execute as @s[tag=mm_thrown_knife_shoot] run tag @s remove mm_thrown_knife_shoot