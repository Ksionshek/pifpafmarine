extends Node

var current_scene: Node = null

func load_scene(scene_path: String) -> void:
	if current_scene:
		current_scene.queue_free()

	var packed = load(scene_path) as PackedScene
	current_scene = packed.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func go_to_main_menu() -> void:
	load_scene("res://scenes/ui/MainMenu.tscn")

func go_to_level(level_number: int) -> void:
	var path = "res://scenes/levels/Level" + str(level_number) + ".tscn"
	load_scene(path)

func go_to_game_over() -> void:
	load_scene("res://scenes/ui/GameOver.tscn")

func go_to_victorŌy_screen() -> void:
	load_scene("res://scenes/ui/Victory.tscn")

func reload_current_scene() -> void:
	if current_scene:
		load_scene(current_scene.scene_file_path)
