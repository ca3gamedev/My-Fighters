extends Node

@export var move : bool
@export var speed : Vector2

func _process(delta):
	
	if move:
		var dir = 0
		if %Code.IsRight:
			dir = -1
		else:
			dir = 1
		
		var move_speed = dir * speed * delta
		
		$"../".move_and_collide(move_speed)
	
	
