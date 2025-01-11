extends Node2D

@export var speed = 200  # Prędkość poruszania się w jednostkach na sekundę
var player: CharacterBody2D 

func _ready():
	# Pobieramy odwołanie do rodzica (czyli CharacterBody2D)
	player = get_parent()  


func _process(delta):
	var dir = Input.get_vector('left', 'right', 'up', 'down')
	player.velocity = dir * speed
		# Normalizujemy kierunek, aby poruszać się z równą prędkością we wszystkich kierunkach
	if dir.length() > 0:
		dir = dir.normalized()
		
	player.move_and_slide()
