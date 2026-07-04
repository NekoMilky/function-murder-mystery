#游戏结束
function mm:waiting/game_end
scoreboard players set #ALL mm_API 8

#游戏模式
function mm:game/game_module/gamemode

#标题显示
execute if score innocent_left mm_data matches 0 run title @a[tag=mm_murderer] subtitle {"translate":"mm.title.murderer_win.subtitle","color":"yellow"}
execute if score innocent_left mm_data matches 0 run title @a[tag=mm_murderer] title {"translate":"mm.title.you_win","color":"green"}
execute if score innocent_left mm_data matches 0 run title @a[tag=mm_innocent] subtitle {"translate":"mm.title.innocent_lose.subtitle","color":"gold"}
execute if score innocent_left mm_data matches 0 run title @a[tag=mm_innocent] title {"translate":"mm.title.you_lose","color":"red"}
execute if score innocent_left mm_data matches 0 run tellraw @a[tag=mm_murderer] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"20"},{"translate":"mm.text.win_as.murderer"}]}
execute if score innocent_left mm_data matches 0 run scoreboard players add @a[tag=mm_murderer] mm_stats_1 1
execute if score innocent_left mm_data matches 0 run scoreboard players add @a[tag=mm_murderer] mm_stats_7 1
execute if score innocent_left mm_data matches 0 run scoreboard players add @a[tag=mm_murderer] mm_stats_14 20
execute if score innocent_left mm_data matches 0 run scoreboard players set @a[tag=mm_murderer] mm_API_p 36
execute if score innocent_left mm_data matches 0 run scoreboard players set @a[tag=mm_innocent] mm_API_p 46

execute if score murderer_left mm_data matches 0 run title @a[tag=mm_murderer] subtitle {"translate":"mm.title.murderer_lose.subtitle.die","color":"gold"}
execute if score murderer_left mm_data matches 0 run title @a[tag=mm_murderer] title {"translate":"mm.title.you_lose","color":"red"}
execute if score murderer_left mm_data matches 0 unless score murderer_count mm_settings matches 2.. run title @a[tag=mm_innocent] subtitle {"translate":"mm.title.innocent_win.subtitle.die.classic","color":"yellow"}
execute if score murderer_left mm_data matches 0 if score murderer_count mm_settings matches 2.. run title @a[tag=mm_innocent] subtitle {"translate":"mm.title.innocent_win.subtitle.die.double_up","color":"yellow"}
execute if score murderer_left mm_data matches 0 run title @a[tag=mm_innocent] title {"translate":"mm.title.you_win","color":"green"}
execute if score murderer_left mm_data matches 0 run tellraw @a[tag=mm_innocent] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"5"},{"translate":"mm.text.win_as.innocent"}]}
execute if score murderer_left mm_data matches 0 run scoreboard players add @a[tag=mm_innocent] mm_stats_1 1
execute if score murderer_left mm_data matches 0 run scoreboard players add @a[tag=mm_innocent] mm_stats_14 5
execute if score murderer_left mm_data matches 0 run scoreboard players add @a[tag=mm_detective,tag=!mm_dead] mm_stats_6 1
execute if score murderer_left mm_data matches 0 run scoreboard players set @a[tag=mm_murderer] mm_API_p 38
execute if score murderer_left mm_data matches 0 run scoreboard players set @a[tag=mm_innocent] mm_API_p 44

execute if score game_second mm_main matches 0 run title @a[tag=mm_murderer] subtitle {"translate":"mm.title.murderer_lose.subtitle.timeout","color":"gold"}
execute if score game_second mm_main matches 0 run title @a[tag=mm_murderer] title {"translate":"mm.title.you_lose","color":"red"}
execute if score game_second mm_main matches 0 unless score murderer_count mm_settings matches 2.. run title @a[tag=mm_innocent] subtitle {"translate":"mm.title.innocent_win.subtitle.timeout.classic","color":"yellow"}
execute if score game_second mm_main matches 0 if score murderer_count mm_settings matches 2.. run title @a[tag=mm_innocent] subtitle {"translate":"mm.title.innocent_win.subtitle.timeout.double_up","color":"yellow"}
execute if score game_second mm_main matches 0 run title @a[tag=mm_innocent] title {"translate":"mm.title.you_win","color":"green"}
execute if score game_second mm_main matches 0 run tellraw @a[tag=mm_innocent] {"translate":"mm.text.add_point","color":"gold","with":[{"text":"5"},{"translate":"mm.text.win_as.innocent"}]}
execute if score game_second mm_main matches 0 run scoreboard players add @a[tag=mm_innocent] mm_stats_1 1
execute if score game_second mm_main matches 0 run scoreboard players add @a[tag=mm_innocent] mm_stats_14 5
execute if score game_second mm_main matches 0 run scoreboard players add @a[tag=mm_detective,tag=!mm_dead] mm_stats_6 1
execute if score game_second mm_main matches 0 run scoreboard players set @a[tag=mm_murderer] mm_API_p 38
execute if score game_second mm_main matches 0 run scoreboard players set @a[tag=mm_innocent] mm_API_p 44

#本局游戏总结
tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}

tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.datapack.name","bold":true}]

execute if score innocent_left mm_data matches 0 unless score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.murderer.classic","color":"red"}]}]
execute if score innocent_left mm_data matches 0 if score murderer_count mm_settings matches 2.. run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.murderer.double_up","color":"red"}]}]

execute unless score game_mode mm_main matches 9 if score murderer_left mm_data matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.innocent","color":"green"}]}]
execute unless score game_mode mm_main matches 9 if score game_second mm_main matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.innocent","color":"green"}]}]

execute if score game_mode mm_main matches 9 if score murderer_left mm_data matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.detective","color":"aqua"}]}]
execute if score game_mode mm_main matches 9 if score game_second mm_main matches 0 run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.winner","with":[{"translate":"mm.text.winner.detective","color":"aqua"}]}]

tellraw @a ""

##侦探
execute if score murderer_count mm_settings matches 1 if entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.detective.classic","color":"gray","with":[{"storage":"mm:main","nbt":"game.Detective1.Name","color":"gray","interpret":true}]}]
execute if score murderer_count mm_settings matches 1 unless entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.detective.classic","color":"gray","with":[{"storage":"mm:main","nbt":"game.Detective1.Name","color":"gray","interpret":true,"strikethrough":true}]}]

execute if score murderer_count mm_settings matches 2 if entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective,scores={mm_spe_id=1}] if entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective,scores={mm_spe_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.detective.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Detective1.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Detective2.Name","color":"gray","interpret":true}]}]
execute if score murderer_count mm_settings matches 2 unless entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective,scores={mm_spe_id=1}] if entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective,scores={mm_spe_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.detective.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Detective1.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Detective2.Name","color":"gray","interpret":true}]}]
execute if score murderer_count mm_settings matches 2 if entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective,scores={mm_spe_id=1}] unless entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective,scores={mm_spe_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.detective.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Detective1.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Detective2.Name","color":"gray","interpret":true,"strikethrough":true}]}]
execute if score murderer_count mm_settings matches 2 unless entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective,scores={mm_spe_id=1}] unless entity @a[tag=!mm_dead,tag=mm_origin,tag=mm_detective,scores={mm_spe_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.detective.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Detective1.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Detective2.Name","color":"gray","interpret":true,"strikethrough":true}]}]

##杀手
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 1 if entity @a[tag=!mm_dead,tag=mm_murderer] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.murderer.classic","color":"gray","with":[{"storage":"mm:main","nbt":"game.Murderer1.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Murderer1.Kills","color":"gold"}]}]
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 1 unless entity @a[tag=!mm_dead,tag=mm_murderer] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.murderer.classic","color":"gray","with":[{"storage":"mm:main","nbt":"game.Murderer1.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Murderer1.Kills","color":"gold"}]}]

execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2 if entity @a[tag=!mm_dead,tag=mm_murderer,scores={mm_spe_id=1}] if entity @a[tag=!mm_dead,tag=mm_murderer,scores={mm_spe_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.role.murderer.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Murderer1.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Murderer1.Kills","color":"gold"},{"storage":"mm:main","nbt":"game.Murderer2.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Murderer2.Kills","color":"gold"}]}]
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2 unless entity @a[tag=!mm_dead,tag=mm_murderer,scores={mm_spe_id=1}] if entity @a[tag=!mm_dead,tag=mm_murderer,scores={mm_spe_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.role.murderer.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Murderer1.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Murderer1.Kills","color":"gold"},{"storage":"mm:main","nbt":"game.Murderer2.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Murderer2.Kills","color":"gold"}]}]
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2 if entity @a[tag=!mm_dead,tag=mm_murderer,scores={mm_spe_id=1}] unless entity @a[tag=!mm_dead,tag=mm_murderer,scores={mm_spe_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.role.murderer.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Murderer1.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Murderer1.Kills","color":"gold"},{"storage":"mm:main","nbt":"game.Murderer2.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Murderer2.Kills","color":"gold"}]}]
execute unless score game_mode mm_main matches 9 if score murderer_count mm_settings matches 2 unless entity @a[tag=!mm_dead,tag=mm_murderer,scores={mm_spe_id=1}] unless entity @a[tag=!mm_dead,tag=mm_murderer,scores={mm_spe_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e "},{"translate":"mm.text.role.murderer.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Murderer1.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Murderer1.Kills","color":"gold"},{"storage":"mm:main","nbt":"game.Murderer2.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Murderer2.Kills","color":"gold"}]}]

##英雄
execute if data storage mm:main game.Hero1 unless data storage mm:main game.Hero2 if entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=1}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.hero.classic","color":"gray","with":[{"storage":"mm:main","nbt":"game.Hero1.Name","color":"gray","interpret":true}]}]
execute if data storage mm:main game.Hero1 unless data storage mm:main game.Hero2 unless entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=1}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.hero.classic","color":"gray","with":[{"storage":"mm:main","nbt":"game.Hero1.Name","color":"gray","interpret":true,"strikethrough":true}]}]
execute unless data storage mm:main game.Hero1 if data storage mm:main game.Hero2 if entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.hero.classic","color":"gray","with":[{"storage":"mm:main","nbt":"game.Hero2.Name","color":"gray","interpret":true}]}]
execute unless data storage mm:main game.Hero1 if data storage mm:main game.Hero2 unless entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.hero.classic","color":"gray","with":[{"storage":"mm:main","nbt":"game.Hero2.Name","color":"gray","interpret":true,"strikethrough":true}]}]

execute if data storage mm:main game.Hero1 if data storage mm:main game.Hero2 if entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=1}] if entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.hero.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Hero1.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Hero2.Name","color":"gray","interpret":true}]}]
execute if data storage mm:main game.Hero1 if data storage mm:main game.Hero2 unless entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=1}] if entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.hero.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Hero1.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Hero2.Name","color":"gray","interpret":true}]}]
execute if data storage mm:main game.Hero1 if data storage mm:main game.Hero2 if entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=1}] unless entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.hero.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Hero1.Name","color":"gray","interpret":true},{"storage":"mm:main","nbt":"game.Hero2.Name","color":"gray","interpret":true,"strikethrough":true}]}]
execute if data storage mm:main game.Hero1 if data storage mm:main game.Hero2 unless entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=1}] unless entity @a[tag=!mm_dead,tag=mm_hero,scores={mm_hero_id=2}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.hero.double_up","color":"gray","with":[{"storage":"mm:main","nbt":"game.Hero1.Name","color":"gray","interpret":true,"strikethrough":true},{"storage":"mm:main","nbt":"game.Hero2.Name","color":"gray","interpret":true,"strikethrough":true}]}]

##击杀者
execute if score game_mode mm_main matches 9 as @a[tag=mm_dead,tag=mm_murderer,scores={mm_kill_count=1..}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.killer","color":"gray","with":[{"selector":"@s","color":"gray","strikethrough":true},{"score":{"name":"@s","objective":"mm_kill_count"},"color":"gold"}]}]
execute if score game_mode mm_main matches 9 as @a[tag=!mm_dead,tag=mm_murderer,scores={mm_kill_count=1..}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.role.killer","color":"gray","with":[{"selector":"@s","color":"gray"},{"score":{"name":"@s","objective":"mm_kill_count"},"color":"gold"}]}]

tellraw @a[tag=mm_playing] ""

tellraw @a[tag=mm_playing] {"text":"=============================================","color":"green"}