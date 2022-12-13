extends CharacterBody2D

@onready var node_worldmap = get_node("/root/World/WorldMap")
@onready var node_nav_agent = $NavigationAgent2D

func _init():
	print(node_worldmap)

func _input(event):
	if event.is_action_pressed("interact"):
		var mouse_pos = get_global_mouse_position()
		var tile = node_worldmap.local_to_map(mouse_pos / 4)
		self.position = self.position.move_toward(Vector2(tile.x * 32 + 16, tile.y * 32 + 12), 10000000)
