extends Node


@export var xdistance : float
@export var smalldistance : float

func Transition():
	if %AI.Root.Oponent.global_position.distance_to(%AI.Root.global_position) < xdistance:
		%AI.current = %AI.get_node("IDLE")
	if %AI.Root.Oponent.global_position.distance_to(%AI.Root.global_position) > xdistance:
		%AI.current = %AI.get_node("WALK")
		%Data.isright = false
	if %AI.Root.Oponent.global_position.distance_to(%AI.Root.global_position) < smalldistance:
		%AI.current = %AI.get_node("WALK")
		%Data.isright = true



func _on_timer_timeout():
	Transition()
