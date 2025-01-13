extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Add enemy to the scene and set all his components. Need to fix that a bit
	#summonMeteor()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func summonMeteor():
	var meteor = preload("res://scenes/Enemies/Meteor/meteor.tscn").instantiate()
	meteor.get_node("E_AI").move_component = meteor.get_node("E_MovementComponent")
	add_child(meteor)
