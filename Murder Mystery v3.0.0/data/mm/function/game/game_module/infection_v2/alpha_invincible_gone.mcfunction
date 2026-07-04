execute unless entity @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible] run return 0

execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible,nbt={SelectedItem:{components:{"minecraft:custom_data":{Knife:1}}}}] run tellraw @a[tag=mm_survivor] {"translate":"mm.text.alpha_invincible_end.knife_exposed.others","color":"green"}
execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible,nbt={SelectedItem:{components:{"minecraft:custom_data":{Knife:1}}}}] run tellraw @s {"translate":"mm.text.alpha_invincible_end.knife_exposed.self","color":"gold"}
execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible,nbt={SelectedItem:{components:{"minecraft:custom_data":{Knife:1}}}}] run tag @s add mm_uninvincible
execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible,nbt={SelectedItem:{components:{"minecraft:custom_data":{Knife:1}}}}] run tag @s remove mm_invincible
execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible,nbt={SelectedItem:{components:{"minecraft:custom_data":{Knife:1}}}}] run return 0

execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible] run tellraw @a[tag=mm_survivor] {"translate":"mm.text.alpha_invincible_end.expired.others","color":"green"}
execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible] run tellraw @s {"translate":"mm.text.alpha_invincible_end.expired.self","color":"gold"}
execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible] run tag @s add mm_uninvincible
execute as @a[tag=mm_alpha,tag=!mm_dead,tag=mm_invincible] run tag @s remove mm_invincible