$execute store success score success_count mm_main run clear @s *[minecraft:custom_data~{$(item_tag):1}]
$execute if score success_count mm_main matches 1 as @s[tag=!mm_playing] run $(callback)

execute if score success_count mm_main matches 1 run scoreboard players add total_success_count mm_main 1