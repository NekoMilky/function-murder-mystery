#重置
function mm:waiting/reset_status/end

#计分板
scoreboard objectives remove mm_API
scoreboard objectives remove mm_API_p
scoreboard objectives remove mm_scoreboard
scoreboard objectives remove mm_scoreboard_l
scoreboard objectives remove mm_main
scoreboard objectives remove mm_data
scoreboard objectives remove mm_m_chance
scoreboard objectives remove mm_m_chance_d
scoreboard objectives remove mm_d_chance
scoreboard objectives remove mm_d_chance_d
scoreboard objectives remove mm_a_chance
scoreboard objectives remove mm_a_chance_d
scoreboard objectives remove mm_chance_amp
scoreboard objectives remove mm_online
scoreboard objectives remove mm_help
scoreboard objectives remove mm_cosmetics
scoreboard objectives remove mm_stats
scoreboard objectives remove mm_carrot
scoreboard objectives remove mm_potion
scoreboard objectives remove mm_button
scoreboard objectives remove mm_menu
scoreboard objectives remove mm_quit
##枪
scoreboard objectives remove mm_gun_rate
scoreboard objectives remove mm_gun_ammo
scoreboard objectives remove mm_gun_clip_ammo
scoreboard objectives remove mm_gun_range
scoreboard objectives remove mm_gun_reload
##旁观者设定
scoreboard objectives remove mm_spectator
##游戏模式
scoreboard objectives remove mm_game_mode

#队伍
team remove mm_lobby
team remove mm_lobby_p
team remove mm_waiting

#状态
tag @a remove mm_random_knife_skin
tag @a remove mm_random_projectile
tag @a remove mm_random_lastwords
tag @a remove mm_random_death_cry
tag @a remove mm_random_head
tag @a remove mm_random_kill_effect

#数据
data remove storage mm:main game
data remove storage mm:main dialog
data remove storage mm:main temporary

#强加载
setblock 2999999 0 2999999 air
forceload remove all

#提示信息及卸载
tellraw @a {"translate":"mm.text.datapack.uninstalled","color":"yellow","with":[[{"translate":"mm.text_button.noumenon","color":"gold"},{"translate":"mm.text.datapack.name","color":"light_purple"},{"text":"v3.0.0 by NaiveMilky","color":"light_purple"}]]}
datapack disable "file/Murder Mystery v3.0.0.zip"