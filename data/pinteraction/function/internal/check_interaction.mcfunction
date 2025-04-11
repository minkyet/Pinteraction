#> pinteraction:internal/check_interaction
#
## check if player interacted with pinteraction(this)
#
# @as
#   type=interaction
#   tag=pinteraction.interaction
# @within pinteraction:internal/emit/right_click

return run execute on target if entity @s[tag=pinteraction.player.this]