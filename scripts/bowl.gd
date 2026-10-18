extends Node3D

# The mixing bowl. It catches orbs that are dropped into it.

# Sent when an orb lands in the bowl. Other scripts can listen for this.
signal colour_added(colour_name)

# How many seconds before an orb comes back after going in the bowl.
@export var orb_return_wait: float = 1.5

@onready var catcher = $Catcher
@onready var liquid = $Liquid

# How many parts of each colour are in the bowl, e.g. {"cyan": 2}.
var amounts = {}

# Our own copy of the liquid material, so we can change its colour.
var liquid_material


func _ready():
	liquid_material = liquid.mesh.material.duplicate()
	liquid.material_override = liquid_material


func _physics_process(_delta):
	# Check every orb that is inside the bowl right now.
	for body in catcher.get_overlapping_bodies():
		# Only take orbs that are loose (not held or floating at home).
		if body is Orb and body.is_loose():
			add_orb(body)


# Take one orb into the bowl.
func add_orb(orb):
	# Add one part of this colour.
	amounts[orb.colour_name] = amounts.get(orb.colour_name, 0) + 1
	print("Added ", orb.colour_name, "  bowl now has ", amounts)
	update_liquid()
	colour_added.emit(orb.colour_name)
	# Hide the orb and send it back to its starting spot soon.
	orb.respawn_later(orb_return_wait)


# Work out the mixed colour and show it on the liquid.
func update_liquid():
	var mixed_colour = ColourMixer.mix_paint(amounts)
	liquid_material.albedo_color = mixed_colour
