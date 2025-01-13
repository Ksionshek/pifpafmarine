class_name e_HealthComponent extends Node2D

var entity
@export var hp := 10
@export var max_health := 10

func _ready() -> void:
	#hp = max_health
	entity = get_parent()
	
func take_damage(amount: int):
	hp -= amount
	if hp <= 0:
		die()
		
func die():
	print(str(entity.name) + " died")
	queue_free()
	
func is_dead() -> bool:
	return hp == 0
