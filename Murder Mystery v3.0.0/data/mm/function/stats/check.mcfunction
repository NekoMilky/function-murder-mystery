$execute unless score $(player_name) mm_stats_1 matches 0.. run tellraw @s {"translate":"mm.feedback.stats.check.fail","color":"red","with":[{"text":"$(player_name)"}]}
$execute unless score $(player_name) mm_stats_1 matches 0.. run return 0

$function mm:dialog/stats/check {player_name:$(player_name)}