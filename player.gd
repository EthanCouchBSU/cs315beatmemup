extends CharacterBody2D
@export var SPEED = 150
var facing = 1
@onready var animTree = $AnimationTree

func _ready():
	pass

func _process(delta):
	var dir = Input.get_vector("left","right","up","down")
	self.velocity = dir*SPEED
	
	if dir.x < 0 and facing ==1:
		self.scale.x *= -1
		facing = -1
		
	if dir.x > 0 and facing ==-1:
		self.scale.x *= -1
		facing = 1
		
	if self.velocity.length() >0.1:
		animTree['parameters/conditions/walk'] = true
		animTree['parameters/conditions/idle'] = false
	else:
		animTree['parameters/conditions/walk'] = false
		animTree['parameters/conditions/idle'] = true
		
	if Input.is_action_just_pressed("space"):
		animTree['parameters/conditions/attack'] = true
	else:
		animTree['parameters/conditions/attack'] = false
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.hit()
		print("hit")
	pass # Replace with function body.
