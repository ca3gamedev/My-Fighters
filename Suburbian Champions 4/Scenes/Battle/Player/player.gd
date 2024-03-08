extends CharacterBody2D

@export var IsP1 : bool

@export var Oponent : CharacterBody2D

func _ready():
	$Inputs.IsP1 = IsP1
	
	if IsP1 :
		DataPaths.P1 = self
	else:
		DataPaths.P2 = self

func Separate(dir, speed):
	self.move_and_collide(Vector2(dir * speed, 0))

func HIT():
	$FSM.HIT()
	$HitStun.HIT()
	if IsP1:
		CombatData.ComboP1 += 1
	else:
		CombatData.ComboP2 += 1
	DataPaths.MyGUI.UpdateCombos()
