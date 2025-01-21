class_name Bullet
extends Node2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var move_component: MoveComponent = $MoveComponent


func _ready() -> void:
	#Remove on touch with hurtbox. Unbind used to remove extra param. In this case we dont need hurtbox. The bullets
	#is gone after a hit.
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
