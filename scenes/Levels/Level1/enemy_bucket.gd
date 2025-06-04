class_name EnemyBucket
extends Node2D

signal wave_cleared

var max_enemies: int = 0
var killed_enemies: int = 0

func reset_kill_count(max_count: int) -> void:
	print("EnemyBucket: reset_kill_count to ", max_count)
	max_enemies = max_count
	killed_enemies = 0

func _on_child_exiting_tree(node: Node) -> void:
	killed_enemies += 1
	if killed_enemies >= max_enemies:
		print("EnemyBucket: Wave cleared!")
		wave_cleared.emit()
