title @s actionbar {\
  "translate": "mm.title.connection.actionbar",\
  "color": "white",\
  "with": [\
    {\
      "translate": "mm.title.murderer_chance.actionbar",\
      "color": "red",\
      "with": [\
        {\
          "score": {\
            "objective": "mm_m_chance_d",\
            "name":"@s"\
          }\
        },\
        {\
          "score": {\
            "objective": "mm_m_chance_ds",\
            "name":"@s"\
          }\
        }\
      ]\
    },\
    {\
      "translate": "mm.title.detective_chance.actionbar",\
      "color": "aqua",\
      "with": [\
        {\
          "score": {\
            "objective": "mm_d_chance_d",\
            "name":"@s"\
          }\
        },\
        {\
          "score": {\
            "objective": "mm_d_chance_ds",\
            "name":"@s"\
          }\
        }\
      ]\
    }\
  ]\
}