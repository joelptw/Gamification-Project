extends Area2D


func _ready():
	pass # Replace with function body.
	
func _on_Area2DEN_input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()
		
func on_click():
    print("Click globo Esp")
