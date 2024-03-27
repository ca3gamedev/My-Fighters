extends Node2D

func _ready():
	DataPaths.MyGUI = self
	$CanvasLayer/P1HP.value = CombatData.P1HP
	$CanvasLayer/P2HP.value = CombatData.P2HP


func SetInputLabel(arrow):
	
	var keys = []
	
	for i in arrow:
		keys.append(i.arrow)
	$CanvasLayer/Input.text = str(keys)
	$CanvasLayer/delta.text = str(arrow[0].timepressed)

func UpdateCombos():
	$CanvasLayer/Combos.text = str(CombatData.ComboP1)
	$CanvasLayer/CombosP2.text = str(CombatData.ComboP2)
	$CanvasLayer/P1HP.value = CombatData.P1HP
	$CanvasLayer/P2HP.value = CombatData.P2HP
