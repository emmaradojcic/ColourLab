extends XRToolsPickable

# A glowing orb of colour that the player can pick up.

# The colours an orb can be. The name is used later by the bowl.
const COLOURS = {
	"cyan": Color(0, 1, 1),
	"magenta": Color(1, 0, 1),
	"yellow": Color(1, 1, 0),
	"red": Color(1, 0, 0),
	"green": Color(0, 1, 0),
	"blue": Color(0, 0, 1),
	"white": Color(1, 1, 1),
	"black": Color(0, 0, 0),
}

# Pick the colour of this orb in the Inspector.
@export_enum("cyan", "magenta", "yellow", "red", "green", "blue", "white", "black")
var colour_name: String = "cyan"


func _ready():
	# Run the XR Tools pickable setup first.
	super()
	set_colour()


# Paint the orb in its colour.
func set_colour():
	var mesh = $MeshInstance3D
	# Make a copy of the material so each orb has its own colour.
	var material = mesh.mesh.material.duplicate()
	material.albedo_color = COLOURS[colour_name]
	material.emission = COLOURS[colour_name]
	mesh.material_override = material
