#确认卸载
execute if score timer_uninstall mm_main matches 1.. run function mm:common/uni_confirm


#再次输入确认卸载
execute if score timer_uninstall mm_main matches 0 run tellraw @s {"translate":"mm.text.datapack.uninstall_confirm","color":"yellow","with":[{"text":"10","color":"red"},{"translate":"mm.text_button.here","color":"gold","click_event":{"action":"run_command","command":"/function mm:uni"}}]}
execute if score timer_uninstall mm_main matches 0 run scoreboard players set timer_uninstall mm_main 200
execute if score timer_uninstall mm_main matches 0 run scoreboard players set #ALL mm_API 2