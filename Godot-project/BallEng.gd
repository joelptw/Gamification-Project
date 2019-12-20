extends RigidBody2D

signal p

func _ready():
	pass

func _on_Area2DEng_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		print("clicked")
		get_node("/root/Main").b_blue = get_script()
		if get_node("/root/Main").b_flag == false:
			get_node("/root/Main").b_flag = true
		else:
			get_node("/root/Main").b_flag = false
		
		emit_signal("p")
		
func _on_BallEng_draw(word):
	var lb = get_node("AnimatedSpriteEng/LabelEng")
	lb.set_text(word)

func select():
	$AnimatedSpriteEng.play("azul_select")
	
func normal():
	$AnimatedSpriteEng.play("azul")