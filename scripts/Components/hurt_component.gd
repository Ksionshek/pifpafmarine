class_name HurtComponent
extends Node

@export var health_component: HealthComponent

# Grab a hurtbox so we know when we have taken a hit
@export var hurtbox_component: HurtboxComponent

func _ready() -> void:
	# Connect the hurt signal on the hurtbox component to an anonymous function
	# that removes health equal to the damage from the hitbox
	hurtbox_component.hurt.connect(func(hitbox_component: HitboxComponent):
		health_component.health -= hitbox_component.damage
	)
