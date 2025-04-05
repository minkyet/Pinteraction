#> pinteraction:internal/check_attack
#
## check if player attacked pinteraction(this)
#
# @as
#   type=interaction
#   tag=pinteraction.interaction
# @within pinteraction:internal/emit/*

# if no target return fail
execute unless data entity @s attack run return fail

# load callback
execute on passengers if entity @s[tag=pinteraction.event] run data modify storage pinteraction:event load set from entity @s data.event

# remove target data
data remove entity @s attack