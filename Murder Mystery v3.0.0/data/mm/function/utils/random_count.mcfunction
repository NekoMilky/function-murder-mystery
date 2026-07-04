$scoreboard players set this_max mm_main $(max)
execute if score this_max mm_main matches 1 run return 0

$execute store result score random_count mm_main run random value 1..$(max)
scoreboard players remove random_count mm_main 1

return run scoreboard players get random_count mm_main