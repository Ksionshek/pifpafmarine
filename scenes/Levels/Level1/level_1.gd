class_name LevelManager
extends Node

signal level_completed

@export var stages: Array[StageData] # Array[StageData]
var current_stage_index := 0

@onready var stage_manager: Node = $StageManager

func _ready() -> void:
	start_next_stage()

func start_next_stage() -> void:
	if current_stage_index >= stages.size():
		print("LevelManager: Level complete!")
		level_completed.emit()
		return

	var stage_data = stages[current_stage_index]
	print("LevelManager: Starting stage ", current_stage_index)
	current_stage_index += 1
	stage_manager.load_stage(stage_data, current_stage_index)

func _on_stage_manager_stage_completed() -> void:
	start_next_stage()
