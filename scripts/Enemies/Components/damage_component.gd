class_name DamageComponent
extends Node2D


@export var damage: int = 10
@export var is_active: bool = true

func take_damage(target: Node) -> void:
	if not is_active:
		return
		
	print("DmgComp target" + str(target))
		
	#apply dmg when target has health component
	if target.has_method("take_damage"):
		target.take_damage(damage)
		#TODO some await func in future for sounds
		#queue_free()
