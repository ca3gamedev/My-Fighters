extends Node

@export var Anims : AnimationTree
@export var Positions : AnimationTree
@export var Rot : AnimationTree

func _ready():
	$Data.Anims = Anims
	$Data.Positions = Positions
	$Data.Rot = Rot
