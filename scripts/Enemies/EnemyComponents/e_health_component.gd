class_name HealthComponent
extends Node2D


# Create the health variable and connect a setter
@export var health: int = 1:
	set(value):
		if health == value:
			return
		_health = value
		health_changed.emit()
		if _health <= 0:
			no_health.emit()

var _health: int = health
# Create our signals for health
signal health_changed() # Emit when the health value has changed
signal no_health() # Emit when there is no health left

func get_health() -> int:
	return _health
