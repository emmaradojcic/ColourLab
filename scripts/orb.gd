class_name Orb
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

# How many seconds an orb waits on the floor before going home.
@export var drop_wait: float = 3.0

# Where the orb floats when it is waiting to be picked up.
var home_transform: Transform3D

@onready var respawn_timer = $RespawnTimer


func _ready():
	# Run the XR Tools pickable setup first.
	super()
	set_colour()
	home_transform = global_transform

	# Listen to our own XR Tools signals and the timer.
	dropped.connect(_on_dropped)
	picked_up.connect(_on_picked_up)
	respawn_timer.timeout.connect(respawn)


# Paint the orb in its colour.
func set_colour():
	var mesh = $MeshInstance3D
	# Make a copy of the material so each orb has its own colour.
	var material = mesh.mesh.material.duplicate()
	material.albedo_color = COLOURS[colour_name]
	material.emission = COLOURS[colour_name]
	mesh.material_override = material


# True when the orb is falling or rolling freely.
# It is not loose while held or while floating at home (both are frozen).
func is_loose():
	return not freeze


# Put the orb back where it started, floating and still.
func respawn():
	respawn_timer.stop()
	visible = true
	enabled = true
	freeze = true
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	global_transform = home_transform


# Hide the orb, then bring it back home after a short wait.
func respawn_later(wait_seconds):
	visible = false
	# Stop hands grabbing it while it is hidden.
	enabled = false
	# Freeze it so it stops moving and the bowl does not count it again.
	freeze = true
	respawn_timer.start(wait_seconds)


# When the player lets go, start the countdown to go home.
func _on_dropped(_pickable):
	respawn_timer.start(drop_wait)


# If the player grabs it again, cancel the countdown.
func _on_picked_up(_pickable):
	respawn_timer.stop()
