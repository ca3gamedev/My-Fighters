extends Node

@export var walk_speed : float

@export var xdistance : float

func Update(delta):
	
	if not %Data.isright:
		var angle = %Data.Rot.get("parameters/MOVE/blend_position")
		angle = lerp(angle, -1.0, 0.2)
		%Data.Rot.set("parameters/MOVE/blend_position", angle)
	else:
		var angle = %Data.Rot.get("parameters/MOVE/blend_position")
		angle = lerp(angle, 1.0, 0.2)
		%Data.Rot.set("parameters/MOVE/blend_position", angle)
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_just_pressed("RIGHT"):
		%Data.isright = false
		
	if Input.is_action_just_pressed("RIGHT") and not Input.is_action_pressed("LEFT") :
		%Data.isright = true
	
	var angle = %Data.Anims.get("parameters/MOVE/blend_position")
	angle = lerp(angle, 1.0, 0.2)
	%Data.Anims.set("parameters/MOVE/blend_position", angle)
	
func Physics(delta):
	
	var xdir = 0
	if %Data.isright:
		xdir = 1
	else:
		xdir = -1
	
	%AI.Root.move_and_collide(Vector3(walk_speed * delta * xdir, 0, 0))
	

func Start():
	pass
