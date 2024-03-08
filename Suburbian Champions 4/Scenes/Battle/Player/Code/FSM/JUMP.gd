extends Node

@export var gravity : float
@export var maxfall : float
@export var jumpforce : float
@export var dir : int
@export var fallspeed : float
@export var xspeed : float

var mydelta = 0

func Transition ():
	if $"../FALL".airjuggle > 2:
		return
	
	if not $"../".MyInputs.dead_buttons:
		if $"../".MyInputs.GetButton() == "B":
			$"../".current = $"../".get_node("NORMAL")
			$"../".current.Start("Air B")
			$"../FALL".airjuggle += 1
		
		if $"../".MyInputs.GetButton() == "A":
			$"../".current = $"../".get_node("NORMAL")
			$"../".current.Start("Air B")
			$"../FALL".airjuggle += 1

func Update(delta):
	pass

func Physics(delta):
	mydelta = delta
	var x = xspeed * mydelta * dir
	gravity += fallspeed * delta
	
	
	var collision = $"../../".move_and_collide(Vector2(x, gravity))
	if collision:
		
		if collision.get_collider().is_in_group("GROUND"):
			$"../FALL".airjuggle = 0
			$"../".current = $"../".get_node("IDLE")
			$"../".current.Start()
		
		if collision.get_collider().is_in_group("WALL LEFT"):
			if dir == -1:
				$"../../".move_and_collide(Vector2(0, gravity))
			else:
				$"../../".move_and_collide(Vector2(xspeed * delta, gravity))
		
		if collision.get_collider().is_in_group("WALL RIGHT"):
			if dir == 1:
				$"../../".move_and_collide(Vector2(0, gravity))
			else:
				$"../../".move_and_collide(Vector2(xspeed * delta * -1, gravity))
			

func Start(newdir):
	gravity = jumpforce
	dir = newdir
	
	$"../".Anims.set("parameters/MOVE/blend_position", Vector2(0, 1))
	
	$"../".get_node("FALL").Start(xspeed * mydelta * dir)
