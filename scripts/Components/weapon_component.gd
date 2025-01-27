class_name WeaponComponent
extends Node2D

# Export the dependencies for this component
# The scene we want to spawn
@export var scene: PackedScene
@onready var power_ups_holder_component: PowerUpHolderComponent = $"../PowerUpsHolderComponent"


# Spawn an instance of the scene at a specific global position on a parent
# By default the parent is the current "main" scene , but you can pass in
# an alternative parent if you so choose.
func spawn(global_spawn_position: Vector2 = global_position, mousePos: Vector2 = get_global_mouse_position(), parent: Node = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	
	# Instance the scene
	var instance = scene.instantiate()
	# Add it as a child of the parent
	parent.add_child(instance)
	# Update the global position of the instance.  
	# (This must be done after adding it as a child)
	instance.global_position = global_spawn_position
	instance.target = mousePos
	instance.rotation = get_parent().rotation
	###########################################
	#PowerUps Relevant Code
	#Loop over all of the upgrades currently on player, and apply their upgades to the spawn bullet
	###########################################
	for power_up in power_ups_holder_component.upgrades:
		print("weaponComp.gd   power_up: " + str(power_up))
		power_up.apply_upgrade(instance)
	# Return the instance in case we want to perform any other operations
	# on it after instancing it.
	return instance
