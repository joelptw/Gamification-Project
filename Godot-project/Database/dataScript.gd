extends Node
var data = "res://Database/data.json"
var dict = {}

func load_data():
	var file = File.new()
	if not file.file_exists(data):
		print("no existe data")
	file.open(data, file.READ)
	dict = parse_json(file.get_as_text())
	var rd = randi()%100+1
	return [rd, dict[str(rd)]]