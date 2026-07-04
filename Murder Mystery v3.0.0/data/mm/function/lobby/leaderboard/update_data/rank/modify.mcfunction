$data modify entity @n[tag=mm_leaderboard,tag=mm_entry] CustomName.with[0] set value "$(rank)"
$data modify entity @n[tag=mm_leaderboard,tag=mm_entry] CustomName.with[1] set value {"text":"$(name)","color":"$(name_color)"}
$data modify entity @n[tag=mm_leaderboard,tag=mm_entry] CustomName.with[2] set value {"text":"$(entry_value)","color":"green"}