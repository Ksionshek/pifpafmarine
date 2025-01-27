class_name FireInputComponent
extends Node2D

@onready var weapon_component: WeaponComponent = $"../WeaponComponent"
@onready var pifpafs: Node2D = $"../Pifpafs"


func fire_lasers(mousePos: Vector2) -> void:
	for marker in pifpafs.get_children():
		if marker.visible:
			weapon_component.spawn(marker.global_position, mousePos)
	
	
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("fire"):
		var mousePos = get_global_mouse_position()
		fire_lasers(mousePos)
