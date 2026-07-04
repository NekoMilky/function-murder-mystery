execute if score game_start mm_main matches 2 run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 run return 0

$scoreboard players set game_mode mm_main $(mode)
$scoreboard players set murderer_count mm_settings $(murderer_count)
$scoreboard players set customize_lastwords_display_time mm_settings $(customize_lastwords_display_time)
$scoreboard players set customize_dead_body_display_time mm_settings $(customize_dead_body_display_time)
$scoreboard players set death_cause_display mm_settings $(death_cause_display)

$tellraw @a {"translate":"mm.feedback.game_mode.set.success","color":"yellow","with":[{"selector":"@s","color":"green"},{"translate":"mm.text_game_mode.$(name)","color":"$(color)"}]}