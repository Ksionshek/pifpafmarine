extends CanvasLayer

@onready var stage_label: Label = $CenterContainer/StageLabel

signal intro_finished()

func show_intro(stage_index: int, wave_index: int) -> void:
	stage_label.text = "Stage %d - Wave %d" % [stage_index, wave_index + 1]
	visible = true
	stage_label.modulate.a = 0.0

	var tween = create_tween()
	tween.tween_property(stage_label, "modulate:a", 1.0, 0.5)
	tween.tween_interval(1.0)
	tween.tween_property(stage_label, "modulate:a", 0.0, 0.5)

	tween.finished.connect(_on_tween_finished)

func _on_tween_finished() -> void:
	visible = false
	intro_finished.emit()
