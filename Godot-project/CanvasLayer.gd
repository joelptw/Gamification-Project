extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
    $MessageTimer.start()

func show_game_over():
    show_message("Game Over su score es "+ get_node("/root/Main/top/LabelScore").get_text())
    yield($MessageTimer, "timeout")
    $MessageLabel.text = "Dodge the\nCreeps!"
    $MessageLabel.show()
    yield(get_tree().create_timer(1), "timeout")
    $Start.show()

func _on_Start_pressed():
	$Start.hide()
	emit_signal("start_game")
