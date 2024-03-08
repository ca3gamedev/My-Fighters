extends Node

@export var hitstun : float
@export var separation : float
@export var Code : Node
@export var HitSeparate : bool
@export var separate_speed : float

func HIT():
	$Separate.start(separation)
	$Timer.start(hitstun)
	HitSeparate = true
	get_tree().paused = true
	

func _process(delta):
	if HitSeparate:
		SeparateHIT()

func _on_timer_timeout():
	get_tree().paused = false


func _on_separate_timeout():
	HitSeparate = false

func SeparateHIT():
	var right = 0
	if Code.IsRight:
		right = -1
	else:
		right = 1
	$"../".Oponent.Separate(right, separate_speed)
