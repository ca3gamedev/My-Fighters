extends Node

@export var walk_speed : float
@export var dir : int

func Transition():
	if $"../".MyInputs.GetBasicArrow().x == 0:
		$"../".current = $"../".get_node("IDLE")
		$"../".current.Start()
	
	if $"../".MyInputs.GetBasicArrow().y == -1:
		$"../".current = $"../".get_node("JUMP")
		$"../".current.Start($"../".MyInputs.GetBasicArrow().x)
	
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
	

func Update(delta):
	pass
	
func Physics(delta):
	dir = $"../".MyInputs.GetBasicArrow().x
	var speed = walk_speed * dir * delta
	$"../../".move_and_collide(Vector2(speed, 0))

func Start():
	$"../".Anims.set("parameters/MOVE/blend_position", Vector2i.RIGHT)
