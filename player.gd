extends CharacterBody2D

@export var speed = 400.0
var fixedx

func _ready():
	fixedx = position.x

func _get_input():
	var input_direction = Input.get_axis("ui_up","ui_down")
	velocity.y = input_direction * speed

func _physics_process(_delta):
	position.x = fixedx
	_get_input()
	move_and_slide()	
