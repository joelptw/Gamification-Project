extends RigidBody2D

var load_dict= load("res://Database/dataScript.gd").new()
var palabra = load_dict.load_data()

export (int)var min_speed = 150  # Minimum speed range.
export (int)var max_speed = 250  # Maximum speed range.
var ball_type = ["naranja","azul"]


func _ready():
	_on_Balloons_drawEN()
	_on_Balloons_drawES()
	
func rand():
	var temp = load_dict.load_data()
	pass

func _on_Balloons_drawEN():
	var lb = get_node("AnimatedSpriteEN/LabelEN")
	print(palabra[0])
	lb.set_text(palabra[1]["Ingles"])
	
func _on_Balloons_drawES():
	var lb = get_node("AnimatedSpriteES/LabelES")
	print("entraaca")
	print(palabra[0])
	lb.set_text(palabra[1]["Traduccion"])


func _on_Area2DES_input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_clickEsp()

func on_clickEsp():
    print("clave esp", palabra[0])

func _on_Area2DEN_input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()
		
func on_click():
     print("clave eng", palabra[0])
