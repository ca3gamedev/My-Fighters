extends Node


@onready var MyArrows = []
@export var empty_keys : bool
@export var mybutton = "none"
var empty_timer = 0
@export var IdleBuffer : float
@export var ButtonBuffer : float
@onready var empty_button = 0
@onready var empty_special = 0

var mydelta = 0
@onready var MyKey = load("res://Scenes/Battle/Player/Code/Inputs/MyKey.gd")

func _process(delta):
	mydelta = delta
	
	if empty_keys:
		empty_timer += delta
	
	empty_button += delta
	empty_special += delta
	
	if empty_timer > IdleBuffer:
		if MyArrows.size() > 0:
			MyArrows = []
			MyArrows.append(GetEmptyArrow())
	
	if empty_button > ButtonBuffer:
		get_parent().dead_buttons = true
	else:
		get_parent().dead_buttons = false
	
	if empty_special > $"../".SpecialBuffer:
		$"../".dead_special = true
	else:
		$"../".dead_special = false
	
func _ready():
	var arrow = GetEmptyArrow()
	MyArrows.append(arrow)


func Clean():
	MyArrows = []
	MyArrows.append(GetEmptyArrow())
	mybutton = "none"


func AddKey(arrow, button):
	
	if button != "none":
		empty_button = 0
		empty_special = 0
		mybutton = button
	
	if MyArrows[0].arrow != arrow:
		var newarrow = GetNewArrow(arrow)
		MyArrows.insert(0, newarrow)
		empty_timer = 0
		
		if len(MyArrows) > 9 :
			MyArrows.remove_at(9)
	else:
		MyArrows[0].timepressed += mydelta
		
	if arrow == Vector2.ZERO:
		empty_keys = true
	else:
		empty_keys = false
	


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
