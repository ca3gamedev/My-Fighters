extends Node

@export var speed_separate : float

func _process(delta):
	if $"../".HitboxCollision:
		var right = 0
		if $"../".IsRight:
			right = 1
		else:
			right = -1
		$"../../".Separate(right,  speed_separate * delta)
