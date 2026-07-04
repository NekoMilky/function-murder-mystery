$scoreboard players set this_value mm_main $(value)

$execute unless score this_value mm_main matches $(min)..$(max) run return fail

$scoreboard players set $(scoreboard_name) mm_settings $(value)

return 1