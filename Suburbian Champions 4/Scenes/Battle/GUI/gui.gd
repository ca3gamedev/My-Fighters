extends Node2D

func _ready():
	DataPaths.MyGUI = self


func SetInputLabel(arrow):
	
	var keys = []
	
	for i in arrow:
		keys.append(i.arrow)
	$CanvasLayer/Input.text = str(keys)
	$CanvasLayer/delta.text = str(arrow[0].timepressed)
