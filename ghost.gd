extends CharacterBody2D


@onready var healthBar = $healthBar
var health = 2
const SPEED = 300.0

func hit():
	health -=1
	print(health)
	healthBar.value = health
	if (health == 0):
		queue_free()

func _process(delta):
	pass
	
