extends Node


func Transition():
	if Input.is_action_pressed("LEFT") or Input.is_action_pressed("RIGHT"):
		%FSM.current = %FSM.get_node("WALK")
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
	
	var angle = %Anims.get("parameters/MOVE/blend_position")
	angle = lerp(angle, 0.0, 0.2)
	%Anims.set("parameters/MOVE/blend_position", angle)

func Physics(delta):
	pass
	
func Start():
	pass
