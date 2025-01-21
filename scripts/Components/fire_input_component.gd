class_name FireInputComponent
extends Node2D

@onready var spawner_component: SpawnerComponent = $"../SpawnerComponent"
@onready var pifpaf: Marker2D = $"../Pifpaf"

func fire_lasers() -> void:
	spawner_component.spawn(pifpaf.global_position)
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("fire"):
		fire_lasers()
