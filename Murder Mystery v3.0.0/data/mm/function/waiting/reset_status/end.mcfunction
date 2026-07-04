#随机装饰品
function mm:waiting/reset_status/random_cosmetics/end {name:"knife_skin"}
function mm:waiting/reset_status/random_cosmetics/end {name:"projectile"}
function mm:waiting/reset_status/random_cosmetics/end {name:"lastwords"}
function mm:waiting/reset_status/random_cosmetics/end {name:"death_cry"}
function mm:waiting/reset_status/random_cosmetics/end {name:"head"}
function mm:waiting/reset_status/random_cosmetics/end {name:"kill_effect"}

#属性
execute as @a[tag=mm_playing] run attribute @s attack_damage base set 1
execute as @a[tag=mm_playing] run attribute @s knockback_resistance base set 0

#队伍
team remove mm_murderer
team remove mm_innocent_1
team remove mm_innocent_2
team remove mm_pinnocent_1
team remove mm_pinnocent_2
team remove mm_survivor
team remove mm_infected
team remove mm_sheriff
team remove mm_outlaw
team remove mm_human
team remove mm_robot

#计分板
scoreboard objectives remove mm_tstun_tick
scoreboard objectives remove mm_stun_tick
scoreboard objectives remove mm_death_type
scoreboard objectives remove mm_kill_count
scoreboard objectives remove mm_kill_count_s
scoreboard objectives remove mm_death_count
scoreboard objectives remove mm_survive_time
scoreboard objectives remove mm_cd_tick
scoreboard objectives remove mm_sc_tick
scoreboard objectives remove mm_throw_tick
scoreboard objectives remove mm_froze_tick
scoreboard objectives remove mm_de_con_tick
scoreboard objectives remove mm_safe_tick
scoreboard objectives remove mm_total_tick
scoreboard objectives remove mm_res_second
scoreboard objectives remove mm_res_tick
scoreboard objectives remove mm_life
scoreboard objectives remove mm_health_l
scoreboard objectives remove mm_health_w
scoreboard objectives remove mm_health_f
scoreboard objectives remove mm_health_d
scoreboard objectives remove mm_thrown_knife
scoreboard objectives remove mm_players_id
scoreboard objectives remove mm_spe_id
scoreboard objectives remove mm_hero_id
scoreboard objectives remove mm_shoot_det
scoreboard objectives remove mm_monorail_tick
scoreboard objectives remove mm_wall_tick
scoreboard objectives remove mm_web_tick
scoreboard objectives remove mm_snowman_tick
scoreboard objectives remove mm_torch_tick
scoreboard objectives remove mm_toygun_tick

#其他
kill @e[tag=mm_toygun_teleporter]
kill @e[tag=mm_froze_teleporter]
kill @e[tag=mm_dead_body_teleporter]
kill @e[tag=mm_dropped_bow]
kill @e[tag=mm_monorail]
kill @e[type=item]
kill @e[tag=mm_thrown_knife]
kill @e[type=arrow]
kill @e[tag=mm_lastwords]
kill @e[tag=mm_prop]
tp @e[tag=mm_ghost] ~ -128 ~
kill @e[tag=mm_ghost]
tp @e[tag=mm_snowman] ~ -128 ~
kill @e[tag=mm_snowman]
tp @e[tag=mm_projectile_l] ~ -128 ~
kill @e[tag=mm_projectile_l]
execute if score dead_body_clear mm_settings matches 1 run tp @e[tag=mm_dead_body] ~ -128 ~
execute if score dead_body_clear mm_settings matches 1 run kill @e[tag=mm_dead_body]
execute as @e[tag=mm_wall] at @s run setblock ~ ~ ~ air
execute as @e[tag=mm_wall] run kill @s
execute as @e[tag=mm_torch] at @s run setblock ~ ~1 ~ air
execute as @e[tag=mm_torch] run kill @s
execute as @e[tag=mm_web] at @s run setblock ~ ~ ~ air
execute as @e[tag=mm_web] run kill @s

#状态
execute as @a[tag=mm_playing] run function mm:lobby/reset_status_player