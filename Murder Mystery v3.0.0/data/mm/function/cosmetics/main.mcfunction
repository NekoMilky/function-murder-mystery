#装饰品初始值
execute as @a run scoreboard players enable @s mm_cosmetics
execute as @a unless score @s mm_knife_skin matches 0.. run scoreboard players set @s mm_knife_skin 1
execute as @a unless score @s mm_projectile matches 0.. run scoreboard players set @s mm_projectile 1
execute as @a unless score @s mm_lastwords matches 0.. run scoreboard players set @s mm_lastwords 1
execute as @a unless score @s mm_death_cry matches 0.. run scoreboard players set @s mm_death_cry 1
execute as @a unless score @s mm_head matches 0.. run scoreboard players set @s mm_head 1
execute as @a unless score @s mm_kill_effect matches 0.. run scoreboard players set @s mm_kill_effect 1

#游戏开始后拦截触发
execute if score game_start mm_main matches 2 as @a[scores={mm_cosmetics=1..},tag=mm_playing] run tellraw @s {"translate":"mm.feedback.wait_for_game_ending","color":"red"}
execute if score game_start mm_main matches 2 as @a[scores={mm_cosmetics=1..},tag=mm_playing] run scoreboard players reset @s mm_cosmetics

#主菜单
execute as @a[scores={mm_cosmetics=1}] run function mm:dialog/cosmetics/main

#匕首皮肤
execute as @a[scores={mm_cosmetics=11}] run function mm:dialog/cosmetics/entry/main {name:"knife_skin",base:100,api:2}
execute as @a[scores={mm_cosmetics=100..199}] run function mm:cosmetics/select {name:"knife_skin",base:100}

#弹射物轨迹
execute as @a[scores={mm_cosmetics=12}] run function mm:dialog/cosmetics/entry/main {name:"projectile",base:200,api:8}
execute as @a[scores={mm_cosmetics=200..299}] run function mm:cosmetics/select {name:"projectile",base:200}

#遗言
execute as @a[scores={mm_cosmetics=13}] run function mm:dialog/cosmetics/entry/main {name:"lastwords",base:300,api:3}
execute as @a[scores={mm_cosmetics=300..399}] run function mm:cosmetics/select {name:"lastwords",base:300}

#亡语
execute as @a[scores={mm_cosmetics=14}] run function mm:dialog/cosmetics/entry/main {name:"death_cry",base:400,api:4}
execute as @a[scores={mm_cosmetics=400..499}] run function mm:cosmetics/select {name:"death_cry",base:400}

#动态头饰
execute as @a[scores={mm_cosmetics=15}] run function mm:dialog/cosmetics/entry/main {name:"head",base:500,api:6}
execute as @a[scores={mm_cosmetics=500..599}] run function mm:cosmetics/select {name:"head",base:500}

#击杀效果
execute as @a[scores={mm_cosmetics=16}] run function mm:dialog/cosmetics/entry/main {name:"kill_effect",base:600,api:7}
execute as @a[scores={mm_cosmetics=600..699}] run function mm:cosmetics/select {name:"kill_effect",base:600}

#重置
execute as @a[scores={mm_cosmetics=1..}] run scoreboard players reset @s mm_cosmetics