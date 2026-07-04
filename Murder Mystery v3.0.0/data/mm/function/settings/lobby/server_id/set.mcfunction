$data modify storage mm:main server_id set value "$(id)"

$tellraw @s {"translate":"mm.feedback.lobby.server_id.set.success","color":"green","with":[{"text":"$(id)"}]}