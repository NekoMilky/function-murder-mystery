#击杀效果
##甜食罐
execute if entity @a[scores={mm_death_type=..-1,mm_kill_effect=2}] at @s run loot spawn ~ ~1 ~ loot mm:kill_effect/sweet_jar
##血污
execute if entity @a[scores={mm_death_type=..-1,mm_kill_effect=3}] at @s run particle block{block_state:"minecraft:red_wool"} ~ ~ ~ 0.2 0.5 0.2 10 100 force @a