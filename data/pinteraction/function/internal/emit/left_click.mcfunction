#> pinteraction:internal/emit/left_click
#
## Executed when player attacked pinteraction
#
# @handle advancement pinteraction:event/left_click

# add temp tag
tag @s add pinteraction.player.this

# revoke advancement
advancement revoke @s only pinteraction:event/left_click

# load interaction's event
execute \
    as @e[type=interaction, distance=..10, tag=pinteraction.interaction] \
    if function pinteraction:internal/check_attack \
    run function pinteraction:internal/load_callback

# emit event
data modify storage pinteraction:event input.callback set from storage pinteraction:event load.left_click
function pinteraction:internal/callback with storage pinteraction:event input

# reset input
data remove storage pinteraction:event input

# remove temp tag
tag @s remove pinteraction.player.this