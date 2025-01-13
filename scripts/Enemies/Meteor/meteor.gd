# meteor.gd - Main script
class_name Meteor extends Node2D

@export var damage : int = 10

# All components 
@onready var move_component: Node2D = $E_MovementComponent
@onready var health_component: Node2D = $E_HealthComponent
@onready var ai_component: Node2D = $E_AI

#TODO health_component

func _process(delta):
	print("Before AI Update")
	ai_component.update(delta)  # Zaktualizuj AI
	print("Before MoveComponent Move")
	move_component.move(delta)  # Zaktualizuj ruch
