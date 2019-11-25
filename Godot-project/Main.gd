extends Node

var Balloons = load("res://Balloons.tscn")

var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 10:
		var new = Balloons.instance()
		add_child(new)
		new.position.x = rand_range(0,100)
		new.position.y = rand_range(100,200)

"""
func game_over():
	$ScoreTImer.stop()
	$BalloonsTimer.stop()
	$StartTimer.stop()
"""

func new_game():
	score = 0
	$StartTimer.start()
	
func _on_StartTimer_timeout():
	$BalloonsTimer.start()
	$ScoreTImer.start()
	
func _on_ScoreTImer_timeout():
	#score +=1
	pass 

"""
func _on_BalloonsTimer_timeout():
	$path/pathSpawn.set_offset(randi())
	var ball = Balloon.instance()
	add_child(ball)
	var direction = $path/pathSpawn.rotation + PI / 2
	ball.position = $path/pathSpawn.position
	direction += rand_range(-PI / 4, PI / 4)
	ball.rotation = direction
	ball.linear_velocity = Vector2(rand_range(ball.min_speed, ball.max_speed), 0)
	ball.linear_velocity = ball.linear_velocity.rotated(direction)
"""
