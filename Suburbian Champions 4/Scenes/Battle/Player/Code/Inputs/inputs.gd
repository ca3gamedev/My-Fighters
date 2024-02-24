extends Node

@export var IsP1 : bool
@export var IdleBuffer : float

func _ready():
	$Buffer.IdleBuffer = IdleBuffer


func _process(delta):
	if IsP1:
		$P1Input.GetKeys()


func GetBasicArrow():
	return $GetCommand.GetBasicArrow()
