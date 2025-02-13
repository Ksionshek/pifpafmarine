class_name Pifpafs
extends Node2D

@onready var center_pifpaf: Marker2D = $CenterPifpaf
@onready var right_pifpaf: Marker2D = $RightPifpaf
@onready var left_pifpaf: Marker2D = $LeftPifpaf

@export var tier: PifPafsPlayerPowerUp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func togglePif(tier):
	pass
