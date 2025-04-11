#> pinteraction:internal/load_callback
#
## load callback from pinteraction.event
#
# @as
#   type=interaction
#   tag=pinteraction.interaction
# @within pinteraction:internal/emit/*

# load callback
execute on passengers if entity @s[tag=pinteraction.event] run data modify storage pinteraction:event load set from entity @s data.event

# remove target data
data remove entity @s attack
data remove entity @s interaction