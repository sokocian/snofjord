extends Camera2D

@onready var node_worldmap = get_node("/root/World/WorldMap/")
@onready var node_selection = get_node("/root/World/Player/Selection/")

@export var min_zoom = .3
@export var max_zoom = 3

func _input(event):
	if event.is_action_pressed("zoom_in"):
		var change = clamp(self.zoom.x + .25, min_zoom, max_zoom)
		self.zoom = self.zoom.lerp(Vector2(change, change), .5)
	
	if event.is_action_pressed("zoom_out"):
		var change = clamp(self.zoom.x - .25, min_zoom, max_zoom)
		self.zoom = self.zoom.lerp(Vector2(change, change), .5)
		
func _physics_process(_delta):
	var mouse_pos = get_local_mouse_position()
	var tile = node_worldmap.local_to_map(mouse_pos / 4)
		
	node_selection.position = node_selection.position.lerp(tile * 32, .85)
