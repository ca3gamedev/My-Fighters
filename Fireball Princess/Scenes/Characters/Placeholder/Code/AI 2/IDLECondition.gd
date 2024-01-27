extends ConditionLeaf

@export var distancetofollow : float

func tick(actor:Node, _blackboard:Blackboard) -> int:
	
	var distance = %DataAI.Root.global_position.distance_to(%DataAI.Root.Oponent.global_position)
	
	print(distance)
	
	if distance < distancetofollow:
		return FAILURE
	
	return SUCCESS
	
	
