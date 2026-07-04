$effect give @s $(effect) $(duration) 0 true

$tellraw @s {"translate":"mm.text.prop.active.self","color":"green","with":[{"translate":"mm.text_settings.play.mode_features.prop_enable.4","color":"blue","bold":true},{"translate":"mm.text.prop.4.active","color":"green","with":[{"text":"$(duration)","color":"gold"},{"translate":"mm.text.prop.4.active.$(effect)","color":"yellow"}]}]}