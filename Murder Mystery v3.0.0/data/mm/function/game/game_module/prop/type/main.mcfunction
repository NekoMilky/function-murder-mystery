scoreboard players set @s mm_API_p 1001

#确定权重数
$data modify storage mm:main temporary.weights set value $(weights)
execute store result score weights_length mm_main run function mm:utils/get_list_length_in_storage {path:"temporary.weights",index:0}

#确定总权重
scoreboard players set total_chance mm_main 0
function mm:game/game_module/prop/type/total_chance {index:0,prop_number:1}

#确定权重域
scoreboard objectives add mm_chance_lower dummy
scoreboard objectives add mm_chance_higher dummy

scoreboard players set current_lower mm_main 1
function mm:game/game_module/prop/type/range {index:0,prop_number:1}

#随机点数
execute store result storage mm:main temporary.max int 1 run scoreboard players get total_chance mm_main
execute store result score random_count mm_main run function mm:utils/random_count with storage mm:main temporary
scoreboard players add random_count mm_main 1
function mm:game/game_module/prop/type/check {index:0,prop_number:1}

#移除权重域计分板
scoreboard objectives remove mm_chance_lower
scoreboard objectives remove mm_chance_higher

tag @s add mm_typed