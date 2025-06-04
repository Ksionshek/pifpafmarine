class_name EnemyNest
extends Node

signal wave_cleared

@onready var spawner: Node = $EnemySpawner
@onready var bucket: Node = $EnemyBucket

func _ready() -> void:
	if not $EnemyBucket.wave_cleared.is_connected(_on_enemy_bucket_wave_cleared):
		$EnemyBucket.wave_cleared.connect(_on_enemy_bucket_wave_cleared)

func spawn_wave(wave_data: Resource) -> void:
	bucket.reset_kill_count(wave_data.count)
	spawner.spawn_wave(wave_data)

func _on_enemy_bucket_wave_cleared() -> void:
	print("EnemyNest: Wave cleared")
	wave_cleared.emit()
