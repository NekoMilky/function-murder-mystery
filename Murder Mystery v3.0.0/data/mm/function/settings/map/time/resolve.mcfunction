$execute if score 1 mm_main = 2 mm_main run time set $(time)

$function mm:utils/set_map_data {index:$(index),path:"Time",value:$(time)}

$tellraw @s {"translate":"mm.feedback.map.time.set.success","color":"yellow","with":[{"text":"$(map_name)"},{"text":"$(time)","color":"green"}]}

return 1