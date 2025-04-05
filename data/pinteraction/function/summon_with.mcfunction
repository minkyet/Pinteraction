#> pinteraction:summon_with
#
## summon pinteraction with data
#
# @at
# @api
# @macro
#   options: {
#       nbt?: Compound,
#       event?: Compound,
#   }

# set input
$data modify storage pinteraction:temp options set value $(options)

# summon w/ event
execute if data storage pinteraction:temp options.event run function pinteraction:internal/summon_with/event with storage pinteraction:temp options
# summon w/o event
execute unless data storage pinteraction:temp options.event run \
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
        ], \
    }

# data merge nbt
execute if data storage pinteraction:temp options.nbt run function pinteraction:internal/summon_with/nbt with storage pinteraction:temp options

# join team
team join pinteraction.interaction @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1]

# remove temp
tag @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1] remove pinteraction.interaction.this
data remove storage pinteraction:temp options