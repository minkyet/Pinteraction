#> pinteraction:internal/summon_with/event
#
## set pinteraction event
#
# @within pinteraction:summon_with
# @macro
#   nbt: Compound

$data merge entity @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1] $(nbt)