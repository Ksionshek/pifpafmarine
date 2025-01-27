class_name FlashComponent
extends Node

const FLASH_MATERIAL = preload("res://effects/white_flash_material.tres")

# Export the sprite this compononet will be flashing
@export var sprite: CanvasItem

# Export a duration for the flash
@export var flash_duration: = 0.2

# We need to store the original sprite's material so we can reset it after the flash
var original_sprite_material: Material

var timer: Timer = Timer.new()

func _ready() -> void:
	add_child(timer)
	original_sprite_material = sprite.material

func flash():
	sprite.material = FLASH_MATERIAL
	timer.start(flash_duration)
	await timer.timeout
	sprite.material = original_sprite_material
