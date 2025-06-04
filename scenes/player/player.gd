class_name Player
extends Node2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var power_ups_holder_component: PowerUpHolderComponent = $PowerUpsHolderComponent
@onready var pifpafs: Pifpafs = $Pifpafs


func _ready() -> void:
	GameManager.player = self
	#Thats the place to set all basic listners
	#e.x healthbar/hurtbox/ onhit animation/flash/shake
	health_component.no_health.connect(_on_no_health)
	hurtbox_component.hurt.connect(_on_hurt)
	hitbox_component.hit_hurtbox.connect(_on_hit)
	
	
func _on_no_health():
	GameManager.player_dead()
	
func _on_hurt(hitbox: HitboxComponent):
	print("AUC DOSTALEM")
	scale_component.tween_scale()
	flash_component.flash()
	
func _on_hit(hurtbox: HurtboxComponent) -> void:
	# Tu możesz dodać np. reakcję na trafienie przeciwnika
	print("Player hit something: ", hurtbox)

	
func _exit_tree() -> void:
	GameManager.player = null
