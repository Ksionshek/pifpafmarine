class_name StageManager
extends Node

signal stage_completed

@onready var enemy_nest: Node = $EnemyNest
@onready var ui: CanvasLayer = $"../StageIntoUI"



var current_stage_index := 0
var current_wave_index := 0
var current_stage: StageData = null # StageData


var pending_wave: WaveData = null


func _ready() -> void:
	$EnemyNest.wave_cleared.connect(_on_enemy_nest_wave_cleared)


func load_stage(stage_data: Resource, st_idx: int) -> void:
	current_stage = stage_data
	current_stage_index = st_idx
	current_wave_index = 0
	start_next_wave()
	
func start_next_wave() -> void:
	if current_wave_index >= current_stage.waves.size():
		print("StageManager: Stage complete!")
		stage_completed.emit()
		return

	var wave = current_stage.waves[current_wave_index]
	print("StageManager: Starting wave ", current_wave_index)
	# Pokazujemy UI zanim wystartuje fala
	ui.show_intro(current_stage_index, current_wave_index)
	
	# Odłącz, jeśli był już wcześniej podpięty
	if ui.intro_finished.is_connected(_on_intro_finished):
		ui.intro_finished.disconnect(_on_intro_finished)

	# Ustaw aktualną falę jako pending
	pending_wave = wave
	ui.intro_finished.connect(_on_intro_finished)

	
func _on_enemy_nest_wave_cleared() -> void:
	print("StageManager: Wave cleared")
	current_wave_index += 1
	start_next_wave()
	
func _on_intro_finished():
	if pending_wave:
		var waveT = pending_wave
		pending_wave = null

		if enemy_nest.wave_cleared.is_connected(_on_enemy_nest_wave_cleared):
			enemy_nest.wave_cleared.disconnect(_on_enemy_nest_wave_cleared)
		enemy_nest.wave_cleared.connect(_on_enemy_nest_wave_cleared)

		enemy_nest.spawn_wave(waveT)
