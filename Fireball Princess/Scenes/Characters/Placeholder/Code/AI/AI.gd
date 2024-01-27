extends Node

@onready var current = $IDLE
@onready var Root = $"../../"

func _process(delta):
	
	$BRAIN.Transition()
	current.Update(delta)

func _physics_process(delta):

	current.Physics(delta)
