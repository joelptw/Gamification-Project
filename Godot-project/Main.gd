extends Node

var Balloons = load("res://Balloons.tscn")

var azul = load("res://BallEng.tscn")
var naranja = load("res://BallEsp.tscn")
var load_dict= load("res://Database/dataScript.gd").new()
var points = 0 setget set_points, get_points

var b_blue setget set_blue, get_blue #Here
var b_flag = false setget set_b_flag, get_b_flag

var b_orange setget set_orange, get_orange
var o_flag = false setget set_o_flag, get_o_flag

var cont = 0
var cont_b = 0

var blue_type 
var ora_type = naranja.instance().get_script()
var blue_arr = []
var ora_arr = []
var tmp = b_blue
var temp_code_b = null
var temp_code_o = null

var id_b = 0
var id_o = 0

var time = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	randomize()

	for i in 20:
		var uno = azul.instance()
		blue_arr.append(uno)
	
	for i in 20:
		var uno = naranja.instance()
		ora_arr.append(uno)
	
	for i in range(len(blue_arr)):
		var palabra = load_dict.load_data()
		write(palabra[1]["Ingles"], palabra[1]["Traduccion"], blue_arr[i], ora_arr[i])
		ora_arr[i].set_meta("key", palabra[0])
		add_child(ora_arr[i])
		blue_arr[i].set_meta("key", palabra[0])
		add_child(blue_arr[i])
		blue_arr[i].connect("p",self,"b_connection",[blue_arr[i]])
		ora_arr[i].connect("e",self,"o_connection",[ora_arr[i]])
	#print(uno.get_script())
	#print(uno2.get_script())
	
	"""
	for i in 10:
		var palabra = load_dict.load_data()
		write(palabra[1]["Ingles"], palabra[1]["Traduccion"])
	"""
	
func b_connection(code):
	id_b = code.get_instance_id()
	cont += 1
	temp_code_b = code.get_meta("key")
	if b_flag == true:
		print(code.get_script())
		code.select()
	else:
		code.normal()
	
	if cont == 2:
		if tmp == b_blue:
			for i in blue_arr:
				var wr = weakref(i)
				if wr.get_ref():
					i.normal()
			print("entro en b")
		else:
			compare()
		cont = 0
	print(cont)
	
func o_connection(code):
	print(o_flag)
	id_o = code.get_instance_id()
	cont += 1
	temp_code_o = code.get_meta("key")
	if o_flag == true:
		print("conchasumar")
		code.select()
	else:
		code.normal()
	
	if cont == 2:
		if tmp == b_blue:
			for i in ora_arr:
				var wr = weakref(i)
				if wr.get_ref():
					i.normal()
			print(tmp)
			print("entro en o")
		else:
			compare()
		cont = 0
	print(cont)	

func compare():
	if temp_code_b == temp_code_o:
		for i in range(len(blue_arr)):
			var wr = weakref(blue_arr[i]);
			var wr2 =weakref(ora_arr[i]);
			if wr.get_ref():
				if blue_arr[i].get_instance_id() == id_b:
					blue_arr[i].queue_free()
			if wr2.get_ref():
				if ora_arr[i].get_instance_id() == id_o:
					ora_arr[i].queue_free()
		get_node("/root/Main").points += 10
	else:
		print("aca p") 
		for i in range(len(blue_arr)):
			var wr = weakref(blue_arr[i]);
			var wr2 =weakref(ora_arr[i]);
			if wr.get_ref():
				blue_arr[i].normal()
			if wr2.get_ref():
				ora_arr[i].normal()
		time -=5
	b_flag = false
	o_flag = false
	
func set_points(value):
	points = value
	get_node("top/LabelScore").set_text("Score: "+str(points))
	
func get_points():
	return points
	
func write(wordEn, wordEs, newA,newN):
	newA._on_BallEng_draw(wordEn)
	newN._on_BallEsp_draw(wordEs)

func new_game():
	$top/ScoreTImer.start()
		
func _on_StartTimer_timeout():
	pass
	
func _on_ScoreTImer_timeout():
	time -=1
	var o = get_node("top/LabelTimer")
	o.set_text("Tiempo: "+str(time))
	if time <= 0:
		time = 0
		game_over()

func game_over():
	$top/ScoreTImer.stop()
	#$Label.set_text("Su puntaje es " + get_node("root/Main/top/LabelScore").get_text())
	#$Button.show()
	
func set_blue(value):
	if tmp == null:
		tmp = value
	else:
		tmp = b_blue
	b_blue = value
	
	print("elt teeemp", tmp)
	print("el blue", b_blue)
	
func get_blue():
	pass

func set_orange(value):
	pass
	
func get_orange():
	pass

func set_b_flag(value):
	b_flag = value
	
func get_b_flag():
	return b_flag

func set_o_flag(value):
	o_flag = value
	
func get_o_flag():
	return o_flag

func tacho_pe():
	for i in 10:
		var new = Balloons.instance()
		new.position.x = rand_range(0,100)
		new.position.y = rand_range(100,200)
		add_child(new)
	