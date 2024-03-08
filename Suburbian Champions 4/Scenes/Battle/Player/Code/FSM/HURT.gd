extends Node

func Transition():
	pass

func Update(delta):
	pass

func Physics(delta):
	pass

func Start():
	$"../".Anims.set("parameters/conditions/HIT", true)
	$"../".Sprites.seek(0, true)
