####################################################
# Tools are sick. The code in this script is treated
# nearly the same as if the game is running. The one
# difference is we can do Engine.is_editor_hint() to
# find out if we're currently in the editor
# Docs: https://docs.godotengine.org/en/stable/tutorials/plugins/running_code_in_the_editor.html#how-to-use-tool
####################################################
@tool
extends Area2D

@export var upgrade_label : Label
@export var sprite : Sprite2D
@export var power_up : BasePowerUp:
	set(val):
		power_up = val
		needs_update = true

# Used when editing to denote that the sprite has changed and needs updating
@export var needs_update := false


func _ready() -> void:
	area_entered.connect(on_area_entered)
	sprite.texture = power_up.texture
	upgrade_label.text = power_up.upgrade_text


func _process(delta: float) -> void:
	
	# This is run only when we're editing the scene
	# It updates the texture of the sprite when we replace the upgrade strategy
	if Engine.is_editor_hint():
		if needs_update:
			sprite.texture = power_up.texture
			upgrade_label.text = power_up.upgrade_text
			needs_update = false


func on_area_entered(player_hurtbox: Area2D):
	var actor = player_hurtbox.get_parent()
	print('PowerUp.gd: Someone touched me')
	print('PowerUp.gd: body.name: ' + str(player_hurtbox.name))
	if actor is Player:
		######################################
		# PowerUp Relevant Code:
		# This adds the upgrade to our player,
		# which the player uses when firing.
		# matching the type of powerup to put upgrades
		# in diffrent place
		######################################
		if power_up is BaseBulletPowerUp:
			print("PowerUp.gd: is BaseBulletPowerUp")
			actor.power_ups_holder_component.bullet_upgrades.append(power_up)
		if power_up is PifPafsPlayerPowerUp:
			print("PowerUp.gd: is PifPafsPlayerPowerUp")
			actor.power_ups_holder_component.pifpafs_upgrades.append(power_up)
		else:
			print("PowerUp.gd: :(")
		
		queue_free()
