extends Node


func GetBasicArrow():
	var arrow = %Buffer.MyArrows[0].arrow
	if %Buffer.empty_keys:
		arrow = Vector2.ZERO
	return arrow

func GetButton():
	return %Buffer.mybutton

func GetHadoukenRight():
	if len(%Buffer.MyArrows) < 3:
		return false
		
	if %Buffer.MyArrows[0].arrow == Vector2.ZERO:
		if %Buffer.MyArrows[1].arrow == Vector2(1, 0):
			if %Buffer.MyArrows[2].arrow == Vector2(1, 1):
				return true
	
	if %Buffer.MyArrows[0].arrow == Vector2(1, 0):
		if %Buffer.MyArrows[1].arrow == Vector2(1, 1):
			if %Buffer.MyArrows[2].arrow == Vector2(0, 1):
				return true

	if %Buffer.MyArrows[0].arrow == Vector2(0, 0):
		if %Buffer.MyArrows[1].arrow == Vector2(1, 0):
			if %Buffer.MyArrows[2].arrow == Vector2(1, 1):
				return true
	
	return false

func GetHadoukenLeft():
	if len(%Buffer.MyArrows) < 3:
		return false
	if %Buffer.MyArrows[0].arrow == Vector2.ZERO:
		if %Buffer.MyArrows[1].arrow == Vector2(-1, 0):
			if %Buffer.MyArrows[2].arrow == Vector2(-1, 1):
				return true
	return false


func _process(delta):
	return
	if len(%Buffer.MyArrows) < 3:
		return false
	print(%Buffer.MyArrows[0].arrow, " / ", %Buffer.MyArrows[1].arrow, " / ", %Buffer.MyArrows[2].arrow)
