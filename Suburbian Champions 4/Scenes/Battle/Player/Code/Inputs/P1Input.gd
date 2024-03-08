extends Node

func GetKeys():
	
	%Buffer.AddKey(GetArrow(), GetButton())
	
func GetKeysP2():
	
	%Buffer.AddKey(GetArrowP2(), "none")

func GetArrow():
	var key = Vector2.ZERO
	
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		key.x = -1
	if Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		key.x = 1
	if Input.is_action_pressed("UP") and not Input.is_action_pressed("DOWN"):
		key.y = -1
	if Input.is_action_pressed("DOWN") and not Input.is_action_pressed("UP"):
		key.y = 1
	
	return key

func GetButton():
	var key = "none"
	
	if Input.is_action_just_released("A"):
		key = "A"
	if Input.is_action_just_released("B"):
		key = "B"
	if Input.is_action_just_released("C"):
		key = "C"
	if Input.is_action_just_released("D"):
		key = "D"
	
	return key

func GetArrowP2():
	var key = Vector2.ZERO
	
	if Input.is_action_pressed("LEFTP2") and not Input.is_action_pressed("RIGHTP2"):
		key.x = -1
	if Input.is_action_pressed("RIGHTP2") and not Input.is_action_pressed("LEFTP2"):
		key.x = 1
	if Input.is_action_pressed("UPP2") and not Input.is_action_pressed("DOWNP2"):
		key.y = -1
	if Input.is_action_pressed("DOWNP2") and not Input.is_action_pressed("UPP2"):
		key.y = 1
	
	return key
