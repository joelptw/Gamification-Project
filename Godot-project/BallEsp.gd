extends RigidBody2D

signal e

func _ready():
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		get_node("/root/Main").b_blue= get_script()
		if get_node("/root/Main").o_flag == false:
			get_node("/root/Main").o_flag = true
		else:
			get_node("/root/Main").o_flag = false
		
		emit_signal("e")

func select():
	$AnimatedSpriteEsp.play("naranja_select")
	
func normal():
	$AnimatedSpriteEsp.play("naranja")
		
func _on_BallEsp_draw(word):
	var lb = get_node("AnimatedSpriteEsp/LabelEsp")
	lb.set_text(word)

