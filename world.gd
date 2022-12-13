extends Node2D

@onready var node_worldmap = get_node("WorldMap")
@onready var node_selection = $CameraHolder/Selection
@onready var worker = $Workers/Worker
@onready var props = $Props

var last_selected_tile = null

var test_building = preload("res://test_factory.tscn")

var tiles = [
	[true, true],
	[false, true]
]

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var mouse_pos = get_global_mouse_position()
			var tile = node_worldmap.local_to_map(mouse_pos / 4)
#			#var tile_data = _worldmap.get_cell_tile_data(0, tile)
#
#			#if tile_data == null:
#			node_worldmap.set_cell(0, tile, 0, Vector2i(0, 0))
			#if prop_map[tile.x][tile.y] == "empty":
			var cant_place = false
			for node in get_tree().get_nodes_in_group("props"):
				if node.position == Vector2(tile * 32):
					cant_place = true
			
			if not cant_place:
				var building = test_building.instantiate()
				props.add_child(building, true)
				building.position = tile * 32
				print("placed")
			
func _physics_process(_delta):
	var mouse_pos = get_local_mouse_position()
	var tile = node_worldmap.local_to_map(mouse_pos / 4)
		
	node_selection.position = node_selection.position.lerp(tile * 32, .5)
	



