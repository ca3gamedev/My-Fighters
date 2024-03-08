extends Node

func Transition():
	
		
	if not $"../".MyInputs.dead_buttons:
		var button = $"../".MyInputs.GetButton()
		if button == "A":
			$"../".current = $"../".get_node("NORMAL")
			$"../".current.Start("A")
		if button == "B":
			$"../".current = $"../".get_node("NORMAL")
			$"../".current.Start("B")
		if button == "C" :
			$"../".current = $"../".get_node("NORMAL")
			$"../".current.Start("Flying Kick Weak")
		if button == "D" :
			$"../".current = $"../".get_node("NORMAL")
			$"../".current.Start("Flying Kick")
	
	if $"../".MyInputs.GetBasicArrow().x != 0:
		$"../".current = $"../".get_node("WALK")
		$"../".current.Start()
		
	if $"../".Code.IsRight:
		$"../..".get_node("Sprites").scale.x = -1
	else:
		$"../..".get_node("Sprites").scale.x = 1
	
	if $"../".MyInputs.GetBasicArrow().y == -1:
		$"../".current = $"../".get_node("JUMP")
		$"../".current.Start($"../".MyInputs.GetBasicArrow().x)
		
	if not $"../".Code.OnGround:
		$"../".current = $"../".get_node("FALL")
		$"../".current.Start(0)
	
func Update(delta):
	pass

func Physics(delta):
	pass

func Start():
	$"../".Anims.set("parameters/MOVE/blend_position", Vector2i.ZERO)
