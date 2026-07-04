execute at @s align x align y align z positioned ~0.5 ~ ~0.5 run summon minecraft:mannequin ~ ~ ~ {hide_description:1b,immovable:1b,Invulnerable:1b,NoGravity:1b,Tags:["mm_npc_lobby","mm_npc_game"]}
$execute at @s align x align y align z positioned ~0.5 ~ ~0.5 run data modify entity @n[tag=mm_npc_lobby,tag=mm_npc_game] profile.name set value "$(profile_name)"

execute at @s align x align y align z positioned ~0.5 ~2.5 ~0.5 run summon minecraft:armor_stand ~ ~ ~ {CustomName:{"translate":"mm.text.click_to_play","color":"yellow","bold":true},CustomNameVisible:1b,Small:1b,Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,Tags:["mm_npc_game","mm_click_to_play"]}
execute at @s align x align y align z positioned ~0.5 ~2.2 ~0.5 run summon minecraft:armor_stand ~ ~ ~ {CustomName:[{"translate":"mm.text.datapack.name","color":"aqua","bold":true},{"text":" [v3.0.0]","color":"light_purple","bold":false}],CustomNameVisible:1b,Small:1b,Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,Tags:["mm_npc_game","mm_datapack_name"]}
execute at @s align x align y align z positioned ~0.5 ~1.9 ~0.5 run summon minecraft:armor_stand ~ ~ ~ {CustomName:{"translate":"mm.text.current_playing.single","color":"yellow","bold":true,"with":[{"text":"0"}]},CustomNameVisible:1b,Small:1b,Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,Tags:["mm_npc_game","mm_current_playing"]}

execute at @s align x align y align z positioned ~0.5 ~ ~0.5 run summon minecraft:chest_minecart ~ ~ ~ {Rotation:[24f,24f],Tags:["mm_npc_game","mm_menu"],DisplayState:{Name:"minecraft:barrier"},Invulnerable:1b}
execute at @s align x align y align z positioned ~0.5 ~0.7 ~0.5 run summon minecraft:chest_minecart ~ ~ ~ {Rotation:[24f,24f],Tags:["mm_npc_game","mm_menu"],DisplayState:{Name:"minecraft:barrier"},Invulnerable:1b}
execute at @s align x align y align z positioned ~0.5 ~1.4 ~0.5 run summon minecraft:chest_minecart ~ ~ ~ {Rotation:[24f,24f],Tags:["mm_npc_game","mm_menu"],DisplayState:{Name:"minecraft:barrier"},Invulnerable:1b}

tellraw @s {"translate":"mm.feedback.lobby.npc_game.create.success","color":"green"}