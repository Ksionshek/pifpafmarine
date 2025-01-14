class_name Bullet
extends Area2D


@onready var move_component = $E_MovementComponent
@onready var damage_component = $DamageComponent

func _process(delta: float) -> void:
	move_component.move(delta)
	


func _on_body_entered(body: Node2D) -> void:
	if damage_component.is_active:
		print('Bullet onbodyent: ' + str(body))
		damage_component.take_damage(body)
