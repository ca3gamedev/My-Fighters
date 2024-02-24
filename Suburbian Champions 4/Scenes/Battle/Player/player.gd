extends CharacterBody2D

@export var IsP1 : bool


func _ready():
	$Inputs.IsP1 = IsP1
	
	if IsP1 :
		DataPaths.P1 = self
	else:
		DataPaths.P2 = self
