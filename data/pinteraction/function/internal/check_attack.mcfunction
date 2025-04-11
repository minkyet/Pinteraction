#> pinteraction:internal/check_attack
#
## check if player attacked pinteraction(this)
#
# @as
#   type=interaction
#   tag=pinteraction.interaction
# @within pinteraction:internal/emit/left_click

return run execute on attacker if entity @s[tag=pinteraction.player.this]