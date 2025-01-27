class_name MoveComponent extends Node2D

@export var actor: Node2D
@export var velocity: Vector2

func _process(delta: float) -> void:
	actor.translate(velocity * delta)

#func _process(delta):
#	var dir = Input.get_vector('left', 'right', 'up', 'down')
#	actor.velocity = dir * speed
#		# Normalizujemy kierunek, aby poruszać się z równą prędkością we wszystkich kierunkach
#	if dir.length() > 0:
#		dir = dir.normalized()
#		
#	actor.move_and_slide()
