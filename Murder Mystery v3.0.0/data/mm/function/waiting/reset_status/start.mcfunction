#重置
function mm:waiting/reset_status/end

#随机装饰品
execute as @a[tag=mm_playing,tag=!mm_choose_spectator] run function mm:waiting/reset_status/random_cosmetics/start {name:"knife_skin"}
execute as @a[tag=mm_playing,tag=!mm_choose_spectator] run function mm:waiting/reset_status/random_cosmetics/start {name:"projectile"}
execute as @a[tag=mm_playing,tag=!mm_choose_spectator] run function mm:waiting/reset_status/random_cosmetics/start {name:"lastwords"}
execute as @a[tag=mm_playing,tag=!mm_choose_spectator] run function mm:waiting/reset_status/random_cosmetics/start {name:"death_cry"}
execute as @a[tag=mm_playing,tag=!mm_choose_spectator] run function mm:waiting/reset_status/random_cosmetics/start {name:"head"}
execute as @a[tag=mm_playing,tag=!mm_choose_spectator] run function mm:waiting/reset_status/random_cosmetics/start {name:"kill_effect"}

#队伍
##杀手
team add mm_murderer
execute unless score game_mode mm_main matches 9 run team modify mm_murderer nametagVisibility hideForOtherTeams
execute if score game_mode mm_main matches 9 run team modify mm_murderer nametagVisibility never
team modify mm_murderer seeFriendlyInvisibles true
execute unless score game_mode mm_main matches 9 unless score game_mode mm_main matches 10 if score murderer_friendly_fire mm_settings matches 0 run team modify mm_murderer friendlyFire false
execute unless score game_mode mm_main matches 9 unless score game_mode mm_main matches 10 if score murderer_friendly_fire mm_settings matches 1..2 run team modify mm_murderer friendlyFire true
execute if score game_mode mm_main matches 9 run team modify mm_murderer friendlyFire true
execute if score game_mode mm_main matches 10 run team modify mm_murderer friendlyFire false
team modify mm_murderer collisionRule never
##平民
team add mm_innocent_1
team modify mm_innocent_1 nametagVisibility never
team modify mm_innocent_1 seeFriendlyInvisibles false
team modify mm_innocent_1 friendlyFire true
team modify mm_innocent_1 collisionRule never
team add mm_innocent_2
team modify mm_innocent_2 nametagVisibility never
team modify mm_innocent_2 seeFriendlyInvisibles false
team modify mm_innocent_2 friendlyFire true
team modify mm_innocent_2 collisionRule never
team add mm_pinnocent_1
team modify mm_pinnocent_1 nametagVisibility never
team modify mm_pinnocent_1 seeFriendlyInvisibles false
team modify mm_pinnocent_1 friendlyFire true
team modify mm_pinnocent_1 collisionRule never
team add mm_pinnocent_2
team modify mm_pinnocent_2 nametagVisibility never
team modify mm_pinnocent_2 seeFriendlyInvisibles false
team modify mm_pinnocent_2 friendlyFire true
team modify mm_pinnocent_2 collisionRule never
##幸存者
team add mm_survivor
team modify mm_survivor color green
team modify mm_survivor nametagVisibility never
team modify mm_survivor friendlyFire false
execute if score game_mode mm_main matches 7 run team modify mm_survivor friendlyFire true
team modify mm_survivor collisionRule never
##感染者
team add mm_infected
team modify mm_infected color red
team modify mm_infected nametagVisibility never
team modify mm_infected friendlyFire false
team modify mm_infected collisionRule never
##警长
team add mm_sheriff
team modify mm_sheriff color aqua
team modify mm_sheriff nametagVisibility hideForOtherTeams
team modify mm_sheriff friendlyFire false
team modify mm_sheriff collisionRule never
##逃犯
team add mm_outlaw
team modify mm_outlaw color red
team modify mm_outlaw nametagVisibility hideForOtherTeams
team modify mm_outlaw friendlyFire false
team modify mm_outlaw collisionRule never
##人类
team add mm_human
team modify mm_human nametagVisibility never
team modify mm_human friendlyFire true
team modify mm_human collisionRule never
##机器人
team add mm_robot
team modify mm_robot nametagVisibility never
team modify mm_robot friendlyFire true
team modify mm_robot collisionRule never

#计分板
scoreboard objectives add mm_tstun_tick dummy
scoreboard players set @a[tag=mm_playing] mm_tstun_tick -1

scoreboard objectives add mm_stun_tick dummy
scoreboard players set @a[tag=mm_playing] mm_stun_tick -1

scoreboard objectives add mm_death_type dummy
scoreboard players set @a[tag=mm_playing] mm_death_type 0

scoreboard objectives add mm_kill_count dummy
scoreboard players set @a[tag=mm_playing] mm_kill_count 0

scoreboard objectives add mm_kill_count_s dummy
scoreboard players set @a[tag=mm_playing] mm_kill_count_s 0

scoreboard objectives add mm_death_count dummy
scoreboard players set @a[tag=mm_playing] mm_death_count 0

scoreboard objectives add mm_survive_time dummy
scoreboard players set @a[tag=mm_playing] mm_survive_time 0

scoreboard objectives add mm_cd_tick dummy
scoreboard players set @a[tag=mm_playing] mm_cd_tick -1

scoreboard objectives add mm_sc_tick dummy
scoreboard players set @a[tag=mm_playing] mm_sc_tick 0

scoreboard objectives add mm_throw_tick dummy
scoreboard players set @a[tag=mm_playing] mm_throw_tick -1

scoreboard objectives add mm_froze_tick dummy
scoreboard players set @a[tag=mm_playing] mm_froze_tick -1

scoreboard objectives add mm_de_con_tick dummy
scoreboard players set @a[tag=mm_playing] mm_de_con_tick -1

scoreboard objectives add mm_safe_tick dummy
scoreboard players set @a[tag=mm_playing] mm_safe_tick -1

scoreboard objectives add mm_total_tick dummy

scoreboard objectives add mm_res_second dummy
scoreboard players set @a[tag=mm_playing] mm_res_second 0

scoreboard objectives add mm_res_tick dummy
scoreboard players set @a[tag=mm_playing] mm_res_tick -1

scoreboard objectives add mm_life dummy
scoreboard players set @a[tag=mm_playing] mm_life 0

scoreboard objectives add mm_thrown_knife dummy
scoreboard players set @a[tag=mm_playing] mm_thrown_knife 0

scoreboard objectives add mm_players_id dummy
scoreboard players set @a[tag=mm_playing] mm_players_id 0

scoreboard objectives add mm_spe_id dummy

scoreboard objectives add mm_hero_id dummy

scoreboard objectives add mm_shoot_det minecraft.used:minecraft.bow

scoreboard objectives add mm_health_l dummy
scoreboard players set @a[tag=mm_playing] mm_health_l -1

scoreboard objectives add mm_health_w dummy
scoreboard players set @a[tag=mm_playing] mm_health_w -1

scoreboard objectives add mm_health_f dummy
scoreboard players set @a[tag=mm_playing] mm_health_f -1

scoreboard objectives add mm_health_d dummy

scoreboard objectives add mm_monorail_tick dummy
scoreboard players set @a[tag=mm_playing] mm_monorail_tick 0

scoreboard objectives add mm_wall_tick dummy
scoreboard players set @a[tag=mm_playing] mm_wall_tick 0

scoreboard objectives add mm_web_tick dummy
scoreboard players set @a[tag=mm_playing] mm_web_tick 0

scoreboard objectives add mm_snowman_tick dummy
scoreboard players set @a[tag=mm_playing] mm_snowman_tick 0

scoreboard objectives add mm_torch_tick dummy
scoreboard players set @a[tag=mm_playing] mm_torch_tick 0

scoreboard objectives add mm_toygun_tick dummy
scoreboard players set @a[tag=mm_playing] mm_toygun_tick 0

scoreboard players set track_message mm_main 0

data modify storage mm:main game set value {}

#属性
execute as @a[tag=mm_playing] run attribute @s attack_damage base set 0
execute as @a[tag=mm_playing] run attribute @s knockback_resistance base set 1

#玩家编号
function mm:waiting/number_players {id:1}