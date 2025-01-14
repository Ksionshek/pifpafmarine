extends Node

var player_hp = 100
var isPlayerAlive := true

func set_player_hp(new_hp: int) -> void:
	if new_hp < 1:
		player_dead()
	player_hp = new_hp

func get_player_hp() -> int:
	return player_hp
	
func player_dead():
	isPlayerAlive = false
	
func initialize_game() -> void:
	print('GM init_game()')
	print('GM hp: ' + str(player_hp))
	
	
func _ready() -> void:
	print('GM ready')
	initialize_game()
	
