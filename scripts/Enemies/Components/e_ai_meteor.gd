class_name e_AI_Meteor extends Node2D

@export var detection_range : float = 800.0
var player: Node2D

var move_component: e_MovementComponent

func _ready() -> void:
	
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() > 0:
		player = players[0]
	else:
		player = null
		print('AI meteor: No player to find')
# AI Logic
# Follow the player
func update(delta: float):
	if player:
		var direction_to_player = (player.position - get_parent().position).normalized()
		if get_parent().position.distance_to(player.position) < detection_range:
			#Use MoveComponent 
			print("AI: update_volocity")
			move_component.update_velocity(direction_to_player)
		else:
			move_component.update_velocity(Vector2.ZERO)
