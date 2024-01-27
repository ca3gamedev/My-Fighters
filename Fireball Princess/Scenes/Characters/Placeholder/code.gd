extends Node

@export var Anims : AnimationTree
@export var Positions : AnimationTree
@export var Rot : AnimationTree

@export var WallRight : bool
@export var WallLeft : bool


func _ready():
	Anims.active = true
	Positions.active = true
	Rot.active = true
	
	$Data.Anims = Anims
	$Data.Positions = Positions
	$Data.Rot = Rot


func _on_hitbox_body_entered(body):
	if body.is_in_group("WALL LEFT"):
		WallLeft = true
	if body.is_in_group("WALL RIGHT"):
		WallRight = true


func _on_hitbox_body_exited(body):
	
	
	if body.is_in_group("WALL LEFT"):
		WallLeft = false
	if body.is_in_group("WALL RIGHT"):
		WallRight = false
