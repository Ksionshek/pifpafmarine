class_name e_HealthComponent extends Node2D

var entity
@export var hp := 10
@export var max_health := 100

#possible signals: entity took dmg/die/

func _ready() -> void:
	#hp = max_health
	entity = get_parent()
	
func take_damage(amount: int):
	hp -= amount
	print("HPComp of: " + str(entity.name) + " hp: " + str(hp))
	if hp <= 0:
		die()
		
func die():
	print(str(entity.name) + " died")
	entity.queue_free()
	
func is_dead() -> bool:
	return hp == 0
