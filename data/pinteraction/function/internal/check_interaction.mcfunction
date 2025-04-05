#> pinteraction:internal/check_interaction
#
## check if player interacted with pinteraction(this)
#
# @as
#   type=interaction
#   tag=pinteraction.interaction
# @within pinteraction:internal/emit/*

# if no target return fail
execute unless data entity @s interaction run return fail

# load callback
execute on passengers if entity @s[tag=pinteraction.event] run data modify storage pinteraction:event load set from entity @s data.event

# remove target data
data remove entity @s interaction