execute unless entity @s[tag=mm_playing] run return 0

execute as @s[scores={mm_menu=1..}] run tellraw @s {"translate":"mm.text.return_lobby_cancel","color":"red"}
execute as @s[scores={mm_menu=1..}] run scoreboard players set @s mm_menu -1

execute unless score @s mm_menu matches -1.. run tellraw @s {"translate":"mm.text.return_lobby_confirm","color":"green"}
execute unless score @s mm_menu matches -1.. run scoreboard players set @s mm_menu 60