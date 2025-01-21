class_name Bullet
extends Node2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var move_component: MoveComponent = $MoveComponent

var direction
var speed: int = 100

func _ready() -> void:
	#Remove on touch with hurtbox. Unbind used to remove extra param. In this case we dont need hurtbox. The bullets
	#is gone after a hit.
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
	var mousePos = get_global_mouse_position()
	direction = -1 * (global_position - mousePos).normalized()
	print("Bullet.gd: mousePos: " + str(mousePos))
	print("Bullet.gd: dir: " + str(direction))
	
	
func _process(delta: float) -> void:
	move_component.velocity = Vector2(direction * speed)	
