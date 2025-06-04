class_name MoveComponent extends Node2D

@export var actor: Node2D
@export var velocity: Vector2
@export var speed: int = 75

func _process(delta: float) -> void:
	actor.translate(velocity * delta)
