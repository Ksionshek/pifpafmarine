class_name BaseBulletPowerUp
extends Resource

#This is the base PowerUp that all other bullet powerups will inherit from

@export var texture: Texture2D = preload("res://kenney_space-shooter-redux/PNG/Effects/fire00.png")
@export var upgrade_text : String = "Speed"


#This is the function that we later call when firing our bullet.
func apply_upgrade(bullet: Bullet):
	#Do nothing by default
	pass 
