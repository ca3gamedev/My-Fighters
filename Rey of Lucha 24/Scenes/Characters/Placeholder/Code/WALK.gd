extends Node

@export var walk_speed : float

func Transition():
	
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT"):
			pass
	else:
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
	
	if Input.is_action_pressed("DOWN"):
		%FSM.current =  %FSM.get_node("DASH")

func Update(delta):
	
	if not %Data.isright:
		var angle = %LEFTAnim.get("parameters/MOVE/blend_position")
		angle = lerp(angle, -1.0, 0.2)
		%LEFTAnim.set("parameters/MOVE/blend_position", angle)
	else:
		var angle = %LEFTAnim.get("parameters/MOVE/blend_position")
		angle = lerp(angle, 1.0, 0.2)
		%LEFTAnim.set("parameters/MOVE/blend_position", angle)
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_just_pressed("RIGHT"):
		%Data.isright = false
		
	if Input.is_action_just_pressed("RIGHT") and not Input.is_action_pressed("LEFT") :
		%Data.isright = true
	
	var angle = %Anims.get("parameters/MOVE/blend_position")
	angle = lerp(angle, 1.0, 0.2)
	%Anims.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	
	var xdir = 0
	if %Data.isright:
		xdir = 1
	else:
		xdir = -1
	
	%FSM.Root.move_and_collide(Vector3(walk_speed * delta * xdir, 0, 0))
	
	
func Start():
	pass
