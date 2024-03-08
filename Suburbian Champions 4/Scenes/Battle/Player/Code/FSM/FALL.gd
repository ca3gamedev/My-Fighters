extends Node

@export var gravity : float
@export var xspeed : float
@export var airjuggle : int

func Transition():
	if airjuggle > 2:
		return
	
	if $"../".MyInputs.GetButton() == "B":
		$"../".current = $"../".get_node("NORMAL")
		$"../".current.Start("B")


func Update(delta):
	if $"../".Code.OnGround:
		airjuggle = 0
		$"../".current = $"../".get_node("IDLE")
		$"../".current.Start()

func Physics(delta):
	var collision = $"../../".move_and_collide(Vector2(xspeed, gravity * delta))
	
	if collision:
		if collision.get_collider().is_in_group("WALL LEFT") or collision.get_collider().is_in_group("WALL RIGHT"):
			$"../../".move_and_collide(Vector2(0, gravity))

func Start(x):
	airjuggle += 1
	xspeed = x
