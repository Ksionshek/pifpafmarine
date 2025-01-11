extends Node2D

@export var detection_range : float = 300.0
var player : Node2D

func _ready():
	player = get_node("/root/Player")

# AI Logic
# Follow the player
func update(delta: float):
	var direction_to_player = (player.position - position).normalized()
	if position.distance_to(player.position) < detection_range:
		#Use MoveComponent 
		get_node("E_MovementComponent").update_velocity(direction_to_player)
