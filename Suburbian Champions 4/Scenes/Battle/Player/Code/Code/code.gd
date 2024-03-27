extends Node

@export var IsRight : bool
@export var HitboxCollision : bool

@export var OnGround : bool
@export var Ground : RayCast2D
@export var cancel_timer : bool

func _process(delta):
	if $"../".global_position.x > $"../".Oponent.global_position.x:
		IsRight = true
	else:
		IsRight = false
	
	if Ground.is_colliding():
		if Ground.get_collider().is_in_group("GROUND"):
			OnGround = true
	else:
		OnGround = false

func GetWalk(dir):
	
	if $"../".IsP1:
		if dir.x == -1 and not IsRight:
			return "WALK B"
		if dir.x == 1 and not IsRight:
			return "WALK F"
		if dir.x == -1 and IsRight:
			return "WALK B"
		if dir.x == 1 and IsRight:
			return "WALK F"
	
	if not $"../".IsP1:
		if dir.x == -1 and not IsRight:
			return "WALK B"
		if dir.x == 1 and not IsRight:
			return "WALK F"
		if dir.x == -1 and IsRight:
			return "WALK B"
		if dir.x == 1 and IsRight:
			return "WALK F"
				
	return "none"

func _on_hitbox_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("HITBOX"):
		HitboxCollision = false

func _on_hitbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("HITBOX"):
		HitboxCollision = true


func _on_attack_box_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("HITBOX"):
		if get_parent().IsP1 != area.get_parent().get_parent().IsP1:
			cancel_timer = true
			$CancelTimer.start(0.2)
			area.get_parent().get_parent().HIT(%FSM.currentdamage)

func EndCombo():
	if $"../".IsP1:
		CombatData.ComboP1 = 0
	else:
		CombatData.ComboP2 = 0
	DataPaths.MyGUI.UpdateCombos()


func _on_cancel_timer_timeout():
	cancel_timer = false
