class_name e_MovementComponent extends Node2D


@export var speed : float = 800.0
var velocity : Vector2 = Vector2.ZERO



# Funkcja odpowiedzialna za ruch
func move(delta: float):
	get_parent().position += velocity * delta
	#print("Position: ", position, " Velocity: ", velocity)

# Funkcja aktualizująca kierunek ruchu
func update_velocity(direction: Vector2):
	velocity = direction.normalized() * speed
	#print("Updated Velocity: ", velocity)
#move_component.update_velocity(direction.normalized() * bullet_speed)
