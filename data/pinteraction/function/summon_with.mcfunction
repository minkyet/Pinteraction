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

# prepare summon nbt
execute if data storage pinteraction:temp options.nbt run \
    data modify storage pinteraction:temp summon set from storage pinteraction:temp options.nbt
execute unless data storage pinteraction:temp options.nbt run \
    data modify storage pinteraction:temp summon set value {}

# ensure interaction tags
execute unless data storage pinteraction:temp summon.Tags run \
    data modify storage pinteraction:temp summon.Tags set value []
data modify storage pinteraction:temp summon.Tags append value "pinteraction.interaction"
data modify storage pinteraction:temp summon.Tags append value "pinteraction.interaction.this"

# prepare passenger marker
data modify storage pinteraction:temp passenger set value {id: "marker", Tags: ["pinteraction.event"], data: {name: "pinteraction.event", event: {}}}
execute if data storage pinteraction:temp options.event run \
    data modify storage pinteraction:temp passenger.data.event set from storage pinteraction:temp options.event

# attach passenger marker
execute unless data storage pinteraction:temp summon.Passengers run \
    data modify storage pinteraction:temp summon.Passengers set value []
data modify storage pinteraction:temp summon.Passengers append from storage pinteraction:temp passenger

# summon interaction
function pinteraction:internal/summon_with/summon with storage pinteraction:temp

# add input tags to passenger marker
data modify storage pinteraction:temp options.Tags set from storage pinteraction:temp options.nbt.Tags
execute if data storage pinteraction:temp options.Tags run function pinteraction:internal/summon_with/add_tag

# join team
team join pinteraction.interaction @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1]

# clean up temp
tag @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1] remove pinteraction.interaction.this
data remove storage pinteraction:temp options
data remove storage pinteraction:temp summon
data remove storage pinteraction:temp passenger