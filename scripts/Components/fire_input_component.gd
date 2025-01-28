class_name FireInputComponent
extends Node2D

@onready var weapon_component: WeaponComponent = $"../WeaponComponent"
@onready var pifpafs: Node2D = $"../Pifpafs"


#Fire_rate related
@export var fire_rate : float = 0.4
var canShoot : bool = true
var timer: Timer = Timer.new()
func _ready() -> void:
	add_child(timer)

func fire_lasers(mousePos: Vector2) -> void:
	for marker in pifpafs.get_children():
		if marker.visible:
			weapon_component.spawn(marker.global_position, mousePos)
	
	
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("fire") and canShoot:
		timer.start(fire_rate)
		var mousePos = get_global_mouse_position()
		fire_lasers(mousePos)
		canShoot = false
		await timer.timeout
		canShoot = true
