extends Node2D

@onready var node_worldmap = get_node("WorldMap")
@onready var worker = $Workers/Worker
@onready var props = $Props

var last_selected_tile = null

var test_building = preload("res://scenes/props/test_factory.tscn")

var tiles = [
	[true, true],
	[false, true]
]

func _input(event):
	if event.is_action_pressed("interact"):
		var mouse_pos = get_global_mouse_position()
		var tile = node_worldmap.local_to_map(mouse_pos / 4)
		var cant_place = false
		
		for node in get_tree().get_nodes_in_group("props"):
			if node.position == Vector2(tile * 32):
				cant_place = true
		
		if not cant_place:
			var building = test_building.instantiate()
			props.add_child(building, true)
			building.position = tile * 32
			print("placed")



