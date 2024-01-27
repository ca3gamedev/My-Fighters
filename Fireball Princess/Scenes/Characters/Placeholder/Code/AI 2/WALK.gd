extends ActionLeaf

@export var distancetofollow : float

func tick(actor:Node, _blackboard:Blackboard) -> int:
	var distance = %DataAI.Root.global_position.distance_to(%DataAI.Root.Oponent.global_position)
	if distance > distancetofollow:
		return SUCCESS
	
	if not %Data.isright:
		var angle = %Data.Rot.get("parameters/MOVE/blend_position")
		angle = lerp(angle, -1.0, 0.2)
		%Data.Rot.set("parameters/MOVE/blend_position", angle)
	else:
		var angle = %Data.Rot.get("parameters/MOVE/blend_position")
		angle = lerp(angle, 1.0, 0.2)
		%Data.Rot.set("parameters/MOVE/blend_position", angle)
	
	var angle = %Data.Anims.get("parameters/MOVE/blend_position")
	angle = lerp(angle, 0.0, 0.2)
	%Data.Anims.set("parameters/MOVE/blend_position", angle)

	return FAILURE
	
