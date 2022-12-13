extends Camera2D

@export var min_zoom = .3
@export var max_zoom = 3

func _input(event):
	if event.is_action_pressed("zoom_in"):
		var change = clamp(self.zoom.x + .25, min_zoom, max_zoom)
		self.zoom = self.zoom.lerp(Vector2(change, change), .5)
	
	if event.is_action_pressed("zoom_out"):
		var change = clamp(self.zoom.x - .25, min_zoom, max_zoom)
		self.zoom = self.zoom.lerp(Vector2(change, change), .5)
	
