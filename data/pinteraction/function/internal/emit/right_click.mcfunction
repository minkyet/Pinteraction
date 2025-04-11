#> pinteraction:internal/emit/right_click
#
## Executed when player interacted with pinteraction
#
# @handle advancement pinteraction:event/right_click

# add temp tag
tag @s add pinteraction.player.this

# revoke advancement
advancement revoke @s only pinteraction:event/right_click

# load interaction's event
execute \
    as @e[type=interaction, distance=..10, tag=pinteraction.interaction] \
    if function pinteraction:internal/check_interaction \
    run function pinteraction:internal/load_callback

# emit event
data modify storage pinteraction:event input.callback set from storage pinteraction:event load.right_click
function pinteraction:internal/callback with storage pinteraction:event input

# reset input
data remove storage pinteraction:event input

# remove temp tag
tag @s remove pinteraction.player.this