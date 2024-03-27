extends Node

@export var MyInputs : Node
@export var Code : Node
@export var Anims : AnimationTree
@export var Sprites : AnimationPlayer

@export var HitStun : Node
@onready var current = $FALL

@export var currentdamage : int

func _ready():
	Anims.active = true

func _process(delta):
	current.Transition()
	current.Update(delta)


func _physics_process(delta):
	current.Physics(delta)

func HIT():
	current = $HURT
	current.Start()
	
func ReturnToIdle():
	HitStun.HitSeparate = false
	Anims.set("parameters/conditions/HIT", false)
	Anims.set("parameters/conditions/ATTACK", false)
	current = $IDLE
	current.Start()

func ReturnToFall():
	HitStun.HitSeparate = false
	Anims.set("parameters/conditions/HIT", false)
	Anims.set("parameters/conditions/ATTACK", false)
	current = $FALL
