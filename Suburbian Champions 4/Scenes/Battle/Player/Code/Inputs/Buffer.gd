extends Node

@onready var timelastkey = 0

@onready var MyArrows = []
var IdleBuffer = 100

var mydelta = 0
@onready var MyKey = load("res://Scenes/Battle/Player/Code/Inputs/MyKey.gd")

func _process(delta):
	mydelta = delta
	
	if timelastkey > IdleBuffer and MyArrows.size() > 0:
		timelastkey = 0 
		MyArrows = []
		MyArrows.append(GetEmptyArrow())
	elif timelastkey < IdleBuffer :
		timelastkey += delta

func _ready():
	var arrow = GetEmptyArrow()
	MyArrows.append(arrow)


func AddKey(arrow, button):
	
	if MyArrows[0].arrow != arrow:
		var newarrow = GetNewArrow(arrow)
		MyArrows.insert(0, newarrow)
		
		if len(MyArrows) > 9 :
			MyArrows.remove_at(9)
	else:
		MyArrows[0].timepressed += mydelta
	


func GetNewArrow(arrow):
	var newarrow 
	newarrow = MyKey.new()
	newarrow.arrow = arrow
	newarrow.timepressed = 0
	
	return newarrow

func GetEmptyArrow():
	var newkey = MyKey.new()
	newkey.arrow = Vector2.ZERO
	newkey.timepressed = 0
	
	return newkey
