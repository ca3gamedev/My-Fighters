extends Node


func Transition():
	
	if not $"../".Code.cancel_timer:
		return

func Update(delta):
	pass

func Physics(delta):
	pass

func Start(key):
	
	match(key):
		"A" :
			$"../".Anims.set("parameters/conditions/ATTACK", true)
			$"../".Anims.set("parameters/ATTACKS/blend_position", Vector2(0, -0.5))
		"B" :
			$"../".Anims.set("parameters/conditions/ATTACK", true)
			$"../".Anims.set("parameters/ATTACKS/blend_position", Vector2(0.5, 0))
		"Air B":
			$"../".Anims.set("parameters/conditions/ATTACK", true)
			$"../".Anims.set("parameters/ATTACKS/blend_position", Vector2(0, 0.5))
		"Flying Kick":
			$"../".Anims.set("parameters/conditions/ATTACK", true)
			$"../".Anims.set("parameters/ATTACKS/blend_position", Vector2(1, 1))
		"Flying Kick Weak":
			$"../".Anims.set("parameters/conditions/ATTACK", true)
			$"../".Anims.set("parameters/ATTACKS/blend_position", Vector2(0, -1))

func GetAttack():
	return $"../".Anims.get("parameters/ATTACKS/blend_position")
