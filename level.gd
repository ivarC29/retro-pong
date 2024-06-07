extends Node2D

var playerScore = 0
var player2Score = 0

func _ready():
	_restart_game()

func _process(delta):
	$ScorePlayer.text = str(playerScore)
	$ScorePlayer2.text = str(player2Score)

func _restart_game():
	$Ball.is_moving = false
	$Ball.velocity = Vector2.ZERO
	$Ball.position = Vector2 (get_viewport_rect().get_center())
	#$Ball.reset_ball()
	$RestartTimer.start()
	$Player.position.y = get_viewport_rect().size.y /2
	$Player2 .position.y = get_viewport_rect().size.y /2

func _on_left_wall_body_entered(body):
	if body == $Ball:
		player2Score += 1
		_restart_game()
	
func _on_right_wall_body_entered(body):
	if body == $Ball:
		playerScore += 1
		_restart_game()
