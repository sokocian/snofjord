extends CharacterBody2D

@onready var node_worldmap = get_node("/root/World/WorldMap")
@onready var node_nav_agent = $NavigationAgent2D

func _init():
	print(node_worldmap)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		var tile = node_worldmap.local_to_map(mouse_pos / 4)
		self.position = self.position.move_toward(Vector2(tile.x * 32 + 16, tile.y * 32 + 12), 10000000)
#		var target_location = get_global_mouse_position()
#		node_nav_agent.set_target_location(target_location)
#
#func _physics_process(delta):
#	var move_direction = position.direction_to(node_nav_agent.get_next_location())
#	velocity = move_direction * 100
#	node_nav_agent.set_velocity(velocity)
#
#	if not node_nav_agent.is_navigation_finished():
#		move_and_slide()
