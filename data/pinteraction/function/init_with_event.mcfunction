#> pinteraction:init_with_event
#
## initialize normal interaction entity into pinteraction with event
#
# @as
#   type=interaction
#   tag=!pinteraction.interaction
# @api
# @macro
#   event: {
#       right_click?: string,
#       left_click?: string,
#   }

# if already pinteraction or not interaction: return fail
execute if entity @s[tag=pinteraction.interaction] run return fail
execute if entity @s[type=!interaction] run return fail

# add tags
tag @s add pinteraction.interaction

# init pinteraction event
$execute at @s run summon marker ~ ~ ~ { \
    Tags: ["pinteraction.event", "pinteraction.event.this"], \
    data: { \
        name: "pinteraction.event", \
        event: $(event) \
    } \
}
execute at @s run ride @e[type=marker, distance=..0.1, tag=pinteraction.event.this, limit=1] mount @s

# join team
team join pinteraction.interaction @s

# remove temp tag
execute at @s run tag @e[type=marker, distance=..0.1, tag=pinteraction.event.this, limit=1] remove pinteraction.event.this