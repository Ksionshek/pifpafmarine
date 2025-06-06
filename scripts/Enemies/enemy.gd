class_name Enemy
extends Node2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent



func _ready() -> void:
	#Thats the place to set all basic listners
	#e.x healthbar/hurtbox/ onhit animation/flash/shake
	health_component.no_health.connect(func():
		#Place for adding scores or anything after death of the enemy
		print('Enemy.gd: no health signal')
		
	)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		scale_component.tween_scale()
		flash_component.flash()
		#shake_component.tween_shake()
		#variable_pitch_audio_stream_player.play_with_variance()
		print("Enemy.gd: got hurt")
	)
	health_component.no_health.connect(queue_free)
	
	hitbox_component.hit_hurtbox.connect(_auc)
	
func _auc(hurtbox: HurtboxComponent):
	print("Enemy.gd hit someone")
		
		
		
