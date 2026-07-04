scoreboard players set #ALL mm_API 15
tellraw @a[tag=mm_playing] {"translate":"mm.text.infected_get_tracker","color":"green"}
team modify mm_survivor nametagVisibility always
scoreboard players set track_message mm_main 1