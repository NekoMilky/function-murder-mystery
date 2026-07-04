#表头
tellraw @a[tag=mm_playing] ""
tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.highest_kd"}]

#计算K/D
scoreboard objectives add mm_temporary dummy
scoreboard objectives add mm_kd dummy
scoreboard objectives add mm_kd_d dummy
scoreboard objectives add mm_kd_ds dummy
$execute as @a[$(filter),tag=mm_playing,scores={mm_death_count=0}] run scoreboard players set @s mm_death_count 1

$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd = @s mm_kill_count
$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd *= 100 mm_main
$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd /= @s mm_death_count

$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd_d = @s mm_kill_count
$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd_d /= @s mm_death_count

$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd_ds = @s mm_kill_count
$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd_ds *= 10 mm_main
$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd_ds /= @s mm_death_count
$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_kd_ds %= 10 mm_main

$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_temporary = @s mm_kd
$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_temporary > @a[$(filter)] mm_temporary
$execute as @a[$(filter),tag=mm_playing] run scoreboard players operation @s mm_temporary -= @s mm_kd

$execute as @a[$(filter),tag=mm_playing,scores={mm_temporary=0}] run tellraw @a[tag=mm_playing] [{"text":"§e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e §e "},{"translate":"mm.text.highest_kd_entry","color":"white","with":[{"selector":"@s"},{"score":{"objective":"mm_kd_d","name":"@s"},"color":"green"},{"text":".","color":"green"},{"score":{"objective":"mm_kd_ds","name":"@s"},"color":"green"}]}]

#移除临时计分项
scoreboard objectives remove mm_temporary
scoreboard objectives remove mm_kd
scoreboard objectives remove mm_kd_d
scoreboard objectives remove mm_kd_ds