# meteor.gd - Main script
extends Node2D

@export var damage : int = 10  

# All components 
var movement : Node
var health : Node
var ai : Node

func _ready():
	movement = $E_MovementComponent 
	health = $E_HealthComponent    
	ai = $E_AI             


func _process(delta):
	ai.update(delta)  # Zaktualizuj AI
	movement.move(delta)  # Zaktualizuj ruch
