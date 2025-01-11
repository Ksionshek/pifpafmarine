extends Node2D


@export var speed : float = 100.0
var velocity : Vector2 = Vector2.ZERO

# Funkcja odpowiedzialna za ruch
func move(delta: float):
	position += velocity * delta

# Funkcja aktualizująca kierunek ruchu
func update_velocity(direction: Vector2):
	velocity = direction.normalized() * speed
