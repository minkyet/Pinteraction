#> pinteraction:internal/summon_with/event
#
## set pinteraction event
#
# @within pinteraction:summon_with
# @macro
#   event: Compound

$summon interaction ~ ~ ~ { \
    Tags:["pinteraction.interaction", "pinteraction.interaction.this"], \
    Passengers:[ \
        { \
            id: "marker", \
            Tags: ["pinteraction.event"], \
            data: { \
                name: "pinteraction.event", \
                event: $(event) \
            } \
        } \
    ], \
}