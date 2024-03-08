extends Node

@export var IsP1 : bool
@export var IdleBuffer : float
@export var ButtonBuffer : float
@export var dead_buttons : bool
@export var SpecialBuffer : float
@export var dead_special : bool

func _ready():
	$Buffer.IdleBuffer = IdleBuffer
	$Buffer.ButtonBuffer = ButtonBuffer


func _process(delta):
	if IsP1:
		$P1Input.GetKeys()
	else:
		$P1Input.GetKeysP2()


func GetBasicArrow():
	return $GetCommand.GetBasicArrow()

func GetButton():
	return $GetCommand.GetButton()

func GetHadouken(right):
	if right:
		return $GetCommand.GetHadoukenLeft()
	else:
		return $GetCommand.GetHadoukenRight()

func CleanBuffer():
	$Buffer.Clean()
