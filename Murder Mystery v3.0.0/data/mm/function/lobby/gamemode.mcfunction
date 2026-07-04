#未游戏
execute as @s[tag=!mm_playing,gamemode=!creative,gamemode=!adventure] run gamemode adventure

#未死亡
execute as @s[tag=mm_playing,tag=!mm_dead,tag=!mm_will_respawn,tag=!mm_spectator,gamemode=!creative,gamemode=!adventure] run gamemode adventure

#死亡
execute as @s[tag=mm_playing,tag=mm_will_respawn,gamemode=!creative,gamemode=!spectator] run gamemode spectator
execute as @s[tag=mm_playing,tag=mm_dead,gamemode=!creative,gamemode=!spectator] run gamemode spectator

#旁观
execute as @s[tag=mm_playing,tag=mm_spectator,gamemode=!creative,gamemode=!spectator] run gamemode spectator