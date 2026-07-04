#创建计分板
scoreboard objectives add mm_API dummy
scoreboard objectives add mm_API_p dummy
scoreboard objectives add mm_scoreboard dummy {"translate":"mm.text.datapack.name","color":"yellow","bold":true}
scoreboard objectives add mm_scoreboard_l dummy {"translate":"mm.text.datapack.name","color":"yellow","bold":true}
scoreboard objectives add mm_main dummy
scoreboard objectives add mm_settings dummy
scoreboard objectives add mm_data dummy
scoreboard objectives add mm_m_chance dummy
scoreboard objectives add mm_m_chance_d dummy
scoreboard objectives add mm_m_chance_ds dummy
scoreboard objectives add mm_d_chance dummy
scoreboard objectives add mm_d_chance_d dummy
scoreboard objectives add mm_d_chance_ds dummy
scoreboard objectives add mm_a_chance dummy
scoreboard objectives add mm_a_chance_d dummy
scoreboard objectives add mm_a_chance_ds dummy
scoreboard objectives add mm_chance_amp dummy
scoreboard objectives add mm_online dummy
scoreboard objectives add mm_joined dummy
scoreboard objectives add mm_help trigger
scoreboard objectives add mm_carrot minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add mm_potion minecraft.used:minecraft.potion
scoreboard objectives add mm_button dummy
scoreboard objectives add mm_menu dummy
scoreboard objectives add mm_quit trigger
##枪
scoreboard objectives add mm_gun_rate dummy
scoreboard objectives add mm_gun_ammo dummy
scoreboard objectives add mm_gun_clip_ammo dummy
scoreboard objectives add mm_gun_range dummy
scoreboard objectives add mm_gun_reload dummy
##统计数据
scoreboard objectives add mm_stats trigger
scoreboard objectives add mm_stats_1 dummy
scoreboard objectives add mm_stats_2 dummy
scoreboard objectives add mm_stats_3 dummy
scoreboard objectives add mm_stats_4 dummy
scoreboard objectives add mm_stats_5 dummy
scoreboard objectives add mm_stats_6 dummy
scoreboard objectives add mm_stats_7 dummy
scoreboard objectives add mm_stats_8 dummy
scoreboard objectives add mm_stats_9 dummy
scoreboard objectives add mm_stats_10 dummy
scoreboard objectives add mm_stats_11 dummy
scoreboard objectives add mm_stats_12 dummy
scoreboard objectives add mm_stats_13 dummy
scoreboard objectives add mm_stats_14 dummy
##旁观者设定
scoreboard objectives add mm_spectator trigger
##游戏模式
scoreboard objectives add mm_game_mode trigger
##装饰品
scoreboard objectives add mm_cosmetics trigger
scoreboard objectives add mm_knife_skin dummy
scoreboard objectives add mm_projectile dummy
scoreboard objectives add mm_lastwords dummy
scoreboard objectives add mm_death_cry dummy
scoreboard objectives add mm_head dummy
scoreboard objectives add mm_kill_effect dummy

#队伍
team add mm_lobby
team modify mm_lobby collisionRule never

team add mm_lobby_p
team modify mm_lobby_p collisionRule never
team modify mm_lobby_p friendlyFire false
team modify mm_lobby_p color gray

team add mm_waiting
team modify mm_waiting collisionRule never
team modify mm_waiting friendlyFire false

#设置侧边计分板
scoreboard objectives setdisplay sidebar mm_scoreboard
scoreboard objectives modify mm_scoreboard numberformat blank

scoreboard objectives setdisplay sidebar.team.gray mm_scoreboard_l
scoreboard objectives modify mm_scoreboard_l numberformat blank

#设置初始值
##模式特有
scoreboard players set boss_detective_tick mm_settings 60
scoreboard players set boss_murderer_tick mm_settings 100
scoreboard players set boss_murderer_throw_tick mm_settings 10

##系统时间
execute unless score system_year mm_data matches 0.. run scoreboard players set system_year mm_data 0
execute unless score system_month mm_data matches 1..12 run scoreboard players set system_month mm_data 1
execute unless score system_day mm_data matches 1.. run scoreboard players set system_day mm_data 1

##中控
execute unless score game_pause mm_main matches 0..1 run scoreboard players set game_pause mm_main 0
execute unless score game_start mm_main matches -1..2 run scoreboard players set game_start mm_main -1
execute unless score game_mode mm_main matches 0.. run scoreboard players set game_mode mm_main 0
execute unless score timer_uninstall mm_main matches 0.. run scoreboard players set timer_uninstall mm_main 0
execute unless score return_lobby mm_main matches -1.. run scoreboard players set return_lobby mm_main -1

##地图
execute unless score map_distribute_id mm_main matches 1.. run scoreboard players set map_distribute_id mm_main 1
execute unless score selected_map mm_main matches 0.. run scoreboard players set selected_map mm_main 0
execute unless score selected_map mm_main < map_count mm_main run scoreboard players set selected_map mm_main 0

##枪
###手枪
scoreboard players set #ALL.pistol mm_gun_rate 10
scoreboard players set #ALL.pistol mm_gun_ammo 100
scoreboard players set #ALL.pistol mm_gun_clip_ammo 10
scoreboard players set #ALL.pistol mm_gun_range 400
scoreboard players set #ALL.pistol mm_gun_reload 30
###步枪
scoreboard players set #ALL.rifle mm_gun_rate 4
scoreboard players set #ALL.rifle mm_gun_ammo 48
scoreboard players set #ALL.rifle mm_gun_clip_ammo 4
scoreboard players set #ALL.rifle mm_gun_range 240
scoreboard players set #ALL.rifle mm_gun_reload 30

##玩法
###游戏开始/结束时清除遗体
execute unless score dead_body_clear mm_settings matches 0..1 run scoreboard players set dead_body_clear mm_settings 1
###游戏开始等待时长(s)
execute unless score game_start_wait_time mm_settings matches 10..60 run scoreboard players set game_start_wait_time mm_settings 20
###游戏时长(s)
execute unless score game_time mm_settings matches 60..3600 run scoreboard players set game_time mm_settings 270
###杀手武器冷却
execute unless score cooldown_normal mm_settings matches 0.. run scoreboard players set cooldown_normal mm_settings 100
###杀手武器掷出
execute unless score cooldown_throw mm_settings matches 0.. run scoreboard players set cooldown_throw mm_settings 10
###侦探武器冷却
execute unless score cooldown_det mm_settings matches 0.. run scoreboard players set cooldown_det mm_settings 100
###感染模式武器冷却
execute unless score infection_cooldown_normal mm_settings matches 0.. run scoreboard players set infection_cooldown_normal mm_settings 300
###感染模式武器掷出
execute unless score infection_cooldown_throw mm_settings matches 0.. run scoreboard players set infection_cooldown_throw mm_settings 10
###感染v1/感染v2/对决/人机大战/生存模式弓箭冷却
execute unless score shoot_cooldown_normal mm_settings matches 0.. run scoreboard players set shoot_cooldown_normal mm_settings 20
###遗言显示时长
execute unless score lastwords_display_time mm_settings matches 10.. run scoreboard players set lastwords_display_time mm_settings 600
###遗体显示时长
execute unless score dead_body_display_time mm_settings matches 10.. run scoreboard players set dead_body_display_time mm_settings 99999
###金锭生成个数(s)(5s生成一次)
execute unless score spawn_gold_ingot_rate mm_settings matches 1..64 run scoreboard players set spawn_gold_ingot_rate mm_settings 3
###道具生成个数(s)(15s生成一次)
execute unless score spawn_prop_rate mm_settings matches 1..64 run scoreboard players set spawn_prop_rate mm_settings 1
###计分板显示杀手数量
execute unless score murderer_count_display mm_settings matches 0..1 run scoreboard players set murderer_count_display mm_settings 0
###杀手小组友伤
execute unless score murderer_friendly_fire mm_settings matches 0..2 run scoreboard players set murderer_friendly_fire mm_settings 2
###杀手牵引遗体
execute unless score murderer_pull_dead_body mm_settings matches 0..1 run scoreboard players set murderer_pull_dead_body mm_settings 0
###杀手/侦探数量(与模式半绑定)
execute unless score murderer_count mm_settings matches 1.. run scoreboard players set murderer_count mm_settings 1
###特殊身份分配随机
execute unless score special_role_random mm_settings matches 0..1 run scoreboard players set special_role_random mm_settings 0
###启用自定义遗言显示时间(与模式半绑定)
execute unless score customize_lastwords_display_time mm_settings matches 0..1 run scoreboard players set customize_lastwords_display_time mm_settings 1
###启用自定义遗体显示时间(与模式半绑定)
execute unless score customize_dead_body_display_time mm_settings matches 0..1 run scoreboard players set customize_dead_body_display_time mm_settings 1
###启用死因显示(与模式半绑定)
execute unless score death_cause_display mm_settings matches 0..1 run scoreboard players set death_cause_display mm_settings 1
###道具启用/禁止
execute unless score prop_1_enable mm_settings matches 0..1 run scoreboard players set prop_1_enable mm_settings 1
execute unless score prop_2_enable mm_settings matches 0..1 run scoreboard players set prop_2_enable mm_settings 1
execute unless score prop_3_enable mm_settings matches 0..1 run scoreboard players set prop_3_enable mm_settings 1
execute unless score prop_4_enable mm_settings matches 0..1 run scoreboard players set prop_4_enable mm_settings 1
execute unless score prop_5_enable mm_settings matches 0..1 run scoreboard players set prop_5_enable mm_settings 1
execute unless score prop_6_enable mm_settings matches 0..1 run scoreboard players set prop_6_enable mm_settings 1
execute unless score prop_7_enable mm_settings matches 0..1 run scoreboard players set prop_7_enable mm_settings 1
execute unless score prop_8_enable mm_settings matches 0..1 run scoreboard players set prop_8_enable mm_settings 1
execute unless score prop_9_enable mm_settings matches 0..1 run scoreboard players set prop_9_enable mm_settings 1
execute unless score prop_10_enable mm_settings matches 0..1 run scoreboard players set prop_10_enable mm_settings 1
execute unless score prop_11_enable mm_settings matches 0..1 run scoreboard players set prop_11_enable mm_settings 1
execute unless score prop_12_enable mm_settings matches 0..1 run scoreboard players set prop_12_enable mm_settings 1
###落入熔岩初始生命
execute unless score lava_health mm_settings matches 1.. run scoreboard players set lava_health mm_settings 24
###落入火初始生命
execute unless score fire_health mm_settings matches 1.. run scoreboard players set fire_health mm_settings 24
###落入水初始生命
execute unless score water_health mm_settings matches 1.. run scoreboard players set water_health mm_settings 320

##游戏常数
scoreboard players set 1000 mm_main 1000
scoreboard players set 400 mm_main 400
scoreboard players set 100 mm_main 100
scoreboard players set 60 mm_main 60
scoreboard players set 20 mm_main 20
scoreboard players set 18 mm_main 18
scoreboard players set 10 mm_main 10
scoreboard players set 9 mm_main 9
scoreboard players set 7 mm_main 7
scoreboard players set 5 mm_main 5
scoreboard players set 4 mm_main 4
scoreboard players set 2 mm_main 2
scoreboard players set 1 mm_main 1
scoreboard players set -1 mm_main -1

##装饰品常数
scoreboard players set cosmetics_knife_skin_count mm_main 52
scoreboard players set cosmetics_projectile_count mm_main 12
scoreboard players set cosmetics_lastwords_count mm_main 14
scoreboard players set cosmetics_death_cry_count mm_main 3
scoreboard players set cosmetics_head_count mm_main 5
scoreboard players set cosmetics_kill_effect_count mm_main 3

##统计信息常数
scoreboard players set stats_count mm_main 14

#游戏规则
difficulty hard
gamerule show_advancement_messages false
gamerule raids false
gamerule advance_time false
gamerule advance_weather false
gamerule entity_drops false
gamerule spawn_mobs false
gamerule mob_drops false
gamerule fire_spread_radius_around_player 0
gamerule fall_damage false
gamerule fire_damage false
gamerule freeze_damage false
gamerule drowning_damage false
gamerule keep_inventory true
gamerule mob_griefing false
gamerule show_death_messages false
gamerule send_command_feedback false
gamerule locator_bar false

#强加载
forceload add 2999999 2999999

#数据
execute unless data storage mm:main map run data modify storage mm:main map set value {maps:[]}
execute unless data storage mm:main server_id run data modify storage mm:main server_id set value "1"
execute unless data storage mm:main server_players run data modify storage mm:main server_players set value []

#提示信息
tellraw @a {"translate":"mm.text.datapack.loaded","color":"yellow","with":[[{"translate":"mm.text_button.noumenon","color":"gold"},{"translate":"mm.text.datapack.name","color":"light_purple"},{"text":"v3.0.0 by NaiveMilky","color":"light_purple"}]]}

#发送接口信息
scoreboard players set #ALL mm_API 1