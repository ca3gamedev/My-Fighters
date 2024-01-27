extends Node


func Transition():
	
	if Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
		return
	
	if Input.is_action_pressed("UP") and Input.is_action_pressed("DOWN"):
		return
		
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT"):
		%FSM.current = %FSM.get_node("WALK")
	if Input.is_action_pressed("DOWN"):
		%FSM.current =  %FSM.get_node("DASH")
	if Input.is_action_pressed("UP"):
		%FSM.current = %FSM.get_node("JUMP")
		%FSM.current.Start()

func Update(delta):
	
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

func Physics(delta):
	pass
	
func Start():
	pass
