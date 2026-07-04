#母体无敌状态消失
execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible,nbt={SelectedItem:{components:{"minecraft:custom_data":{Knife:1}}}}] run function mm:game/game_module/infection_v2/alpha_invincible_gone

#母体无限飞刀
execute as @a[tag=mm_alpha,tag=!mm_dead,scores={mm_thrown_knife=0}] run scoreboard players set @s mm_thrown_knife 99999

function mm:game/game_module/throw_knife/main {filter:"predicate=mm:infected_and_alpha",cooldown:"infection_cooldown_normal mm_settings",cooldown_throw:"infection_cooldown_throw mm_settings"}