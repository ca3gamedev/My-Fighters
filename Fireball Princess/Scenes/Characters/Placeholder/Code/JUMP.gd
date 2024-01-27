extends Node

@export var jump_impulse : float
@export var gravity : float
@export var modifier : float
@onready var myinertia = 0.0
@onready var x_dir = 0
@export var x_speed : float

var mydelta = 0

func Transition():
	pass
	
func Update(delta):
	
	if not %Data.isright:
		var angle = %Data.Rot.get("parameters/MOVE/blend_position")
		angle = lerp(angle, -1.0, 0.2)
		%Data.Rot.set("parameters/MOVE/blend_position", angle)
	else:
		var angle = %Data.Rot.get("parameters/MOVE/blend_position")
		angle = lerp(angle, 1.0, 0.2)
		%Data.Rot.set("parameters/MOVE/blend_position", angle)
	
	mydelta = delta
	myinertia -= gravity * delta
	if myinertia <= -gravity:
		myinertia = -gravity
	
func Physics(delta):
	if %Data.isright:
		x_dir = 1
	else:
		x_dir = -1
	
	var speed = Vector3(x_speed * delta * x_dir, myinertia * modifier, 0)
	if %Start.Root.WallLeft:
		if x_dir == -1:
			speed.x = 0
		else:
			speed.x = x_speed * delta
	if %Start.Root.WallRight:
		if x_dir == 1:
			speed.x = 0
		else:
			speed.x = -(x_speed * delta)
	
	var collision = %Start.RealRoot.move_and_collide(speed)
	if collision:
		
		if collision.get_collider().is_in_group("GROUND"):
			if Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
				%FSM.current = %FSM.get_node("IDLE")
				%FSM.current.Start()
				return

			if Input.is_action_pressed("LEFT"):
				%Data.isright = false
				
			if Input.is_action_just_pressed("RIGHT"):
				%Data.isright = true
			%FSM.current = %FSM.get_node("IDLE")

func Start():
	
	if Input.is_action_pressed("LEFT") and Input.is_action_pressed("RIGHT"):
		%FSM.current = %FSM.get_node("IDLE")
		%FSM.current.Start()
		return

	if Input.is_action_pressed("LEFT"):
		%Data.isright = false
		
	if Input.is_action_just_pressed("RIGHT"):
		%Data.isright = true
	
	myinertia = jump_impulse * modifier
