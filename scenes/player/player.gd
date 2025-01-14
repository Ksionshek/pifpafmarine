class_name Player
extends CharacterBody2D


@onready var weapon_component = $WeaponComponent

func _process(delta: float) -> void:
	if Input.is_action_pressed("fire"):
		# Wystrzel pocisk w kierunku kursora
		var direction = (get_global_mouse_position() - weapon_component.global_position).normalized()
		weapon_component.shoot(direction, global_position)
