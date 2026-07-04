scoreboard players set #ALL mm_API 14
tellraw @a[tag=mm_innocent] {"translate":"mm.text.murderer_get_tracker.others","color":"yellow","with":[{"translate":"mm.text.murderer_get_tracker.others.care","color":"red"}]}
tellraw @a[tag=mm_murderer] {"translate":"mm.text.murderer_get_tracker.self","color":"green","with":[{"translate":"mm.text.murderer_get_tracker.self.description","color":"yellow"}]}
scoreboard players set track_message mm_main 1