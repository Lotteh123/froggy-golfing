extends Camera3D

@onready var Frog = $".."

#variables for raycast
const ray_length = 100
var mouse_pos : Vector2
var from : Vector3
var to : Vector3
var space : PhysicsDirectSpaceState3D
var query : PhysicsRayQueryParameters3D

#variable for cam follow
var vector : Vector3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	camera_follow()
	
func camera_follow() -> void:
	vector = Vector3(Frog.transform.origin.x,position.y,Frog.transform.origin.z)
	self.transform.origin = self.transform.origin.lerp(vector,1)
	
func camera_raycast():
	mouse_pos = get_viewport().get_mouse_position()
	from = project_ray_origin(mouse_pos)
	to = from + project_ray_normal(mouse_pos) * ray_length
	space = get_world_3d().direct_space_state
	
	query = PhysicsRayQueryParameters3D.create(from,to,2)
	
	return space.intersect_ray(query)
	


func _on_frog_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	pass # Replace with function body.
