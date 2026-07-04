scoreboard players set murderer_friendly_fire mm_settings 0
team modify mm_murderer friendlyFire false

tellraw @s {"translate":"mm.feedback.set.success","color":"yellow","with":[{"translate":"mm.text_settings.play.mode_features.murderer_friendly_fire"},{"translate":"mm.text.disable","color":"red"}]}