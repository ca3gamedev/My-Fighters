extends Node

func GetKeys():
	
	var key = GetArrow()
	%Buffer.AddKey(key, "none")
	
	DataPaths.MyGUI.SetInputLabel(%Buffer.MyArrows)
	
	
func GetArrow():
	var key = Vector2.ZERO
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		key.x = -1
	if Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		key.x = 1
	if Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		key.x = -1
	if Input.is_action_pressed("DOWN") and not Input.is_action_pressed("UP"):
		key.x = 1
	
	return key
