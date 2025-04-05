#> pinteraction:summon
#
## summon pinteraction
#
# @at
# @api

## pinteraction.event's NBT structure example
# data: {
#     event: {
#         right_click: "say left click",
#         left_click: "say right click"
#     }
# }

# summon
summon interaction ~ ~ ~ { \
    Tags:["pinteraction.interaction", "pinteraction.interaction.this"], \
    Passengers:[ \
        { \
            id: "marker", \
            Tags: ["pinteraction.event"], \
            data: { \
                name: "pinteraction.event", \
                event: {} \
            } \
        } \
    ] \
}

# join team
team join pinteraction.interaction @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1]

# remove temp tag
tag @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1] remove pinteraction.interaction.this