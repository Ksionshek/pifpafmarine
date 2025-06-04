class_name Bullet
extends Node2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var scale_component: ScaleComponent = $ScaleComponent



var direction = Vector2(1,1)
var speed: int = 100

var is_marker_set = true
var marker_rotation


var target = Vector2(1,1)

func _ready() -> void:
	#Remove on touch with hurtbox. Unbind used to remove extra param. In this case we dont need hurtbox. The bullets
	#is gone after a hit.
	#GlobalSignals.connect("markerPoss", func(position)
	
	#)
	scale_component.tween_scale()
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
	

func calcTarget(a: Vector2, b: Vector2) -> Vector2:
	return (b - a).normalized()
	
func _process(_delta: float) -> void:
	if is_marker_set:	
		direction = calcTarget(target, global_position)
		is_marker_set = false
	
	move_component.velocity -= Vector2(direction * speed)

#remove the bullets when they are not visible on screen
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
