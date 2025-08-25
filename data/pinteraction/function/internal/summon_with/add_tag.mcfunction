#> pinteraction:internal/summon_with/add_tag
#
## add tag to pinteraction.interaction.this
#
# @within pinteraction:internal/summon_with
# @at
# @input storage pinteraction:temp options.nbt.Tags: string[]
# @output storage pinteraction:temp options.tag: string
# @loop recursion

# pop tag from Tags
data modify storage pinteraction:temp options.tag set from \
    storage pinteraction:temp options.Tags[0]
data remove storage pinteraction:temp options.Tags[0]

# add tag
function pinteraction:internal/summon_with/add_tag/set with storage pinteraction:temp options

# loop if Tags remain
execute if data storage pinteraction:temp options.Tags[0] run function pinteraction:internal/summon_with/add_tag