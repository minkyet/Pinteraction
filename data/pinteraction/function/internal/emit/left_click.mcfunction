#> pinteraction:internal/emit/left_click
#
## Executed when player attacked pinteraction
#
# @handle advancement pinteraction:event/left_click

# revoke advancement
advancement revoke @s only pinteraction:event/left_click

# load interaction's event
execute as @e[type=interaction, distance=..6, tag=pinteraction.interaction] run function pinteraction:internal/check_attack

# emit event
data modify storage pinteraction:event input.callback set from storage pinteraction:event load.left_click
function pinteraction:internal/callback with storage pinteraction:event input

# reset input
data remove storage pinteraction:event input