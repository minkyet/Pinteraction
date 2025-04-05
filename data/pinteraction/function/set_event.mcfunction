#> pinteraction:set_event
#
## set pinteraction event
#
# @as
#   type=interaction
#   tag=pinteraction.interaction
# @macro
#   event: {
#       right_click?: string,
#       left_click?: string,
#   }
# @api
#
## Example:
#   execute as @n[type=interaction] run function pinteraction:add_listener {event:{right_click: "say right click", left_click: "say left click"}}

# check @s
execute on passengers unless entity @s[type=marker, tag=pinteraction.event] run return fail

$execute on passengers if entity @s[type=marker, tag=pinteraction.event] run data merge entity @s {data:{event:$(event)}}