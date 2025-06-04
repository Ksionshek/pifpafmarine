extends Node

### PLAYER VARS ###
var player_hp = 100
var isPlayerAlive := true
var player : Player = null

### GAME VARS ###
const sec_level_1_period: int = 30
static var score: int = 0

var current_level: int = 1
var current_stage: int = 0

var total_levels: int = 6

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
	start_game()
	
	
	
#Singelton for respawning
var node_creation_parent = null
#func based on wave system tutorial
func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
	
signal level_started(level_number)
signal level_completed(level_number)
signal stage_started(stage_number)
signal stage_completed(stage_number)


func start_game():
	current_level = 1
	current_stage = 0
	start_level(current_level)

func start_level(level: int):
	current_level = level
	emit_signal("level_started", level)
	print("Level.gd emit start_level ")

func complete_stage():
	emit_signal("stage_completed", current_stage)
	current_stage += 1
	print("Level.gd emit complete stage")
	# Przykładowa logika przejścia do kolejnego stage'a
	# Można potem zintegrować z StageManager
	
func reset_progress() -> void:
	current_level = 1
	current_stage = 1
	score = 0
