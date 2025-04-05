#> pinteraction:internal/emit/right_click
#
## Executed when player interacted with pinteraction
#
# @handle advancement pinteraction:event/right_click

# revoke advancement
advancement revoke @s only pinteraction:event/right_click

# load interaction's event
execute as @e[type=interaction, distance=..6, tag=pinteraction.interaction] run function pinteraction:internal/check_interaction

# emit event
data modify storage pinteraction:event input.callback set from storage pinteraction:event load.right_click
function pinteraction:internal/callback with storage pinteraction:event input

# reset input
data remove storage pinteraction:event input