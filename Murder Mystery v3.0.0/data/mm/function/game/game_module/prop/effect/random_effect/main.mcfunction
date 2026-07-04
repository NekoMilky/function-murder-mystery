execute store result score random_effect mm_main run function mm:utils/random_count {max:9}
execute store result storage mm:main temporary.duration int 1 run function mm:utils/random_count {max:31}

execute if score random_effect mm_main matches 0 run data modify storage mm:main temporary.effect set value "speed"
execute if score random_effect mm_main matches 1 run data modify storage mm:main temporary.effect set value "jump_boost"
execute if score random_effect mm_main matches 2 run data modify storage mm:main temporary.effect set value "invisibility"
execute if score random_effect mm_main matches 3 run data modify storage mm:main temporary.effect set value "blindness"
execute if score random_effect mm_main matches 4 run data modify storage mm:main temporary.effect set value "slowness"
execute if score random_effect mm_main matches 5 run data modify storage mm:main temporary.effect set value "glowing"
execute if score random_effect mm_main matches 6 run data modify storage mm:main temporary.effect set value "poison"
execute if score random_effect mm_main matches 7 run data modify storage mm:main temporary.effect set value "nausea"
execute if score random_effect mm_main matches 8 run data modify storage mm:main temporary.effect set value "night_vision"

function mm:game/game_module/prop/effect/random_effect/give with storage mm:main temporary