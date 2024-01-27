extends Node

@export var walk_speed : float

func Transition():
	
	if Input.is_action_pressed("DOWN"):
		pass
	else:
		%FSM.current = %FSM.get_node("IDLE")
	if Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		var dir = 0
		if Input.is_action_pressed("LEFT"):
			dir = -1
		if Input.is_action_pressed("RIGHT"):
			dir = 1
		%FSM.current = %FSM.get_node("JUMP")
		%FSM.current.Start(dir)
	

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
	angle = lerp(angle, 2.0, 0.2)
	%Data.Anims.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	
	var xdir = 0
	if %Data.isright:
		xdir = 1
	else:
		xdir = -1
	
	%FSM.Root.move_and_collide(Vector3(walk_speed * delta * xdir, 0, 0))
	
