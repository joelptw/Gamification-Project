extends RigidBody2D

var load_dict= load("res://Database/dataScript.gd").new()
var palabra = load_dict.load_data()
var tmpEs = null
var tmpEn = null
var pressEn = false
var pressEs = false 
var ld = load("res://Main.tscn")
var single = ld.instance()
var points = 0

func _ready():
	_on_Balloons_drawEN()
	_on_Balloons_drawES()
	
func _on_Balloons_drawEN():
	var lb = get_node("AnimatedSpriteEN/LabelEN")
	lb.set_text(palabra[1]["Ingles"])
	
func _on_Balloons_drawES():
	var lb = get_node("AnimatedSpriteES/LabelES")
	lb.set_text(palabra[1]["Traduccion"])

func _on_Area2DES_input_event(viewport,event,shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		#print(palabra[0])
		tmpEs = palabra[0]
		pressEs = true
		animations()
		compare()

func _on_Area2DEN_input_event(viewport,event,shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		#print(palabra[0])
		tmpEn = palabra[0]
		pressEn = true
		compare()

func animations():
	if pressEs == true:
		$AnimatedSpriteES.play("rojo")
	else:
		$AnimatedSpriteES.play("naranja")

func compare():
	print("español -> ",pressEs)
	print("ingles -> ",pressEn)
	if pressEn == true and pressEs == true:
		print("entro!")
		if (tmpEn!=null and tmpEs!=null) and tmpEn == tmpEs:
			print("COrrecto")
			queue_free()
			get_node("/root/Main").points += 10
	else:
		print("incorrecto")

	
	