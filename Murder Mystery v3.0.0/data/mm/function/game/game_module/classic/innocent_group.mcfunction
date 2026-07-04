team join mm_innocent_1 @a[team=!mm_innocent_1,team=!mm_innocent_2,team=!mm_pinnocent_1,team=!mm_pinnocent_2,tag=mm_innocent,sort=random,limit=1]
team join mm_innocent_2 @a[team=!mm_innocent_1,team=!mm_innocent_2,team=!mm_pinnocent_1,team=!mm_pinnocent_2,tag=mm_innocent,sort=random,limit=1]
team join mm_pinnocent_1 @a[team=!mm_innocent_1,team=!mm_innocent_2,team=!mm_pinnocent_1,team=!mm_pinnocent_2,tag=mm_innocent,sort=random,limit=1]
team join mm_pinnocent_2 @a[team=!mm_innocent_1,team=!mm_innocent_2,team=!mm_pinnocent_1,team=!mm_pinnocent_2,tag=mm_innocent,sort=random,limit=1]

execute if entity @a[team=!mm_innocent_1,team=!mm_innocent_2,team=!mm_pinnocent_1,team=!mm_pinnocent_2,tag=mm_innocent] run function mm:game/game_module/classic/innocent_group
