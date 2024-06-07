extends CharacterBody2D

var speed = 800.0
@onready var ball = get_parent().get_node("Ball")
var direction = 0
var fixedx

func _ready():
	fixedx = position.x

func _physics_process(delta: float):
	position.x = fixedx
	if ball.position.x > get_viewport_rect().size.x / 2 :
		direction = Vector2(0, _get_direction())
		velocity = direction * speed
		move_and_slide()

func _get_direction():
	if abs(ball.position.y - position.y) > 5:
		if ball.position.y > position.y:
			return 1
		else: 
			return -1
	else: 
		return 0
