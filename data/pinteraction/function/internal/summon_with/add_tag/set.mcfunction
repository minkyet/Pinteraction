#> pinteraction:internal/summon_with/add_tag/set
#
## set tag to pinteraction
#
# @within pinteraction:internal/summon_with/add_tag
# @at
# @macro
#   tag: string

$tag @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1] add $(tag)
$execute as @e[type=interaction, distance=..0.1, tag=pinteraction.interaction.this, limit=1] on passengers run tag @s add $(tag)
