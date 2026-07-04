$data modify storage mm:main temporary.floating set value {\
  "translate": "mm.text_settings.map.map_features.floating",\
  "color": "white",\
  "with": [\
    {\
      "translate": "mm.text_settings.map.map_features.$(name)",\
      "color": "white"\
    },\
    {\
      "text": "0",\
      "color": "gold"\
    }\
  ]\
}

data modify storage mm:main temporary.type set value "storage"
data modify storage mm:main temporary.target set value "mm:main"
data modify storage mm:main temporary.path set value "temporary.floating.with[1].text"
execute store result storage mm:main temporary.value int 1 run data get entity @s equipment.feet.components."minecraft:custom_data".Cost
function mm:utils/set_string_data with storage mm:main temporary

$execute as @s[tag=!mm_npc] at @s run data modify entity @n[tag=mm_$(name)_title,tag=mm_special_element,distance=..3] CustomName set from storage mm:main temporary.floating
execute as @s[tag=mm_npc] at @s run data modify entity @s CustomName set from storage mm:main temporary.floating