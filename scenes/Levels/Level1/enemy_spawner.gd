class_name EnemySpawner
extends Node

@onready var enemy_bucket: Node = $"../EnemyBucket"

var spawn_timer: Timer
var enemy_scene: PackedScene
var enemies_to_spawn: int = 0
var spawn_interval: float = 1.0

func _ready() -> void:
	spawn_timer = Timer.new()
	spawn_timer.one_shot = false
	add_child(spawn_timer)
	spawn_timer.connect("timeout", Callable(self, "_spawn_enemy"))

func spawn_wave(wave_data: WaveData) -> void:
	print("EnemySpawner: Spawning ", wave_data.count, " enemies")
	enemy_scene = wave_data.enemy_scene
	enemies_to_spawn = wave_data.count
	spawn_interval = wave_data.spawn_interval
	spawn_timer.wait_time = spawn_interval
	spawn_timer.start()

func _spawn_enemy() -> void:
	if enemies_to_spawn <= 0:
		spawn_timer.stop()
		return

	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = get_random_spawn_position()
	enemy_bucket.add_child(enemy_instance)
	enemies_to_spawn -= 1

func get_random_spawn_position() -> Vector2:
	var x = randf_range(-160, 670)
	var y = randf_range(-90, 390)
	return Vector2(x, y)
