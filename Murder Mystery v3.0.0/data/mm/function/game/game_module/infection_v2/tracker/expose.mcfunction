scoreboard players set #ALL mm_API 16

execute if entity @a[tag=mm_alpha,tag=!mm_dead] run tellraw @a[tag=mm_survivor] {"translate":"mm.text.survivor_get_tracker.survivor","color":"green"}
execute if entity @a[tag=mm_alpha,tag=!mm_dead] run tellraw @a[tag=mm_infected] {"translate":"mm.text.survivor_get_tracker.infected","color":"green"}
execute if entity @a[tag=mm_alpha,tag=!mm_dead] run tellraw @a[tag=mm_alpha] {"translate":"mm.text.survivor_get_tracker.alpha","color":"green"}

execute unless entity @a[tag=mm_alpha,tag=!mm_dead] if entity @a[tag=mm_infected,tag=!mm_dead] if score infected_real_left mm_data matches 1 run tellraw @a[tag=mm_survivor] {"translate":"mm.text.infected_expose.others","color":"green"}
execute unless entity @a[tag=mm_alpha,tag=!mm_dead] if entity @a[tag=mm_infected,tag=!mm_dead] if score infected_real_left mm_data matches 1 run tellraw @a[tag=mm_infected,tag=!mm_dead] {"translate":"mm.text.infected_expose.self","color":"green"}

scoreboard players set infected_tick mm_main -1