extends Node

@export var walk_speed : float

func Transition():
	
	if Input.is_action_pressed("UP") and Input.is_action_pressed("DOWN"):
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
	if Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
	
	if Input.is_action_pressed("LEFT") and not  Input.is_action_pressed("RIGHT"):
		pass
	elif not Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
		pass
	else:
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
	
	if Input.is_action_pressed("DOWN"):
		%FSM.current =  %FSM.get_node("DASH")
	
	if Input.is_action_pressed("UP"):
		%FSM.current = %FSM.get_node("JUMP")
		%FSM.current.Start()

func Update(delta):

	if Input.is_action_pressed("LEFT"):
		%Data.isright = false
		
	if Input.is_action_just_pressed("RIGHT"):
		%Data.isright = true
		
	if %Data.isright == false and not Input.is_action_pressed("LEFT"):
		%Data.isright = true
	
	if not %Data.isright:
		var angle = %Data.Rot.get("parameters/MOVE/blend_position")
		angle = lerp(angle, -1.0, 0.2)
		%Data.Rot.set("parameters/MOVE/blend_position", angle)
	else:
		var angle = %Data.Rot.get("parameters/MOVE/blend_position")
		angle = lerp(angle, 1.0, 0.2)
		%Data.Rot.set("parameters/MOVE/blend_position", angle)
	
	var angle = %Data.Anims.get("parameters/MOVE/blend_position")
	angle = lerp(angle, 1.0, 0.2)
	%Data.Anims.set("parameters/MOVE/blend_position", angle)

func Physics(delta):

	var xdir = 0
	if %Data.isright:
		xdir = 1
	else:
		xdir = -1
	
	%FSM.Root.move_and_collide(Vector3(walk_speed * delta * xdir, 0, 0))

	
func Start():
	pass
