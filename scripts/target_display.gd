class_name TargetDisplay
extends Node3D

# A sign that shows the colour the player should try to make.

# The name shown under the colour, e.g. "Green".
@export var target_name: String = "Green"

# The recipe for the target, in the same form as the bowl's amounts.
@export var target_amounts: Dictionary = {"cyan": 1, "yellow": 1}

# The actual colour, worked out from the recipe.
var target_colour: Color

@onready var swatch = $Swatch
@onready var name_label = $NameLabel

# Our own copy of the swatch material, so we can change its colour.
var swatch_material


func _ready():
	swatch_material = swatch.mesh.material.duplicate()
	swatch.material_override = swatch_material
	show_target(target_name, target_amounts)


# Show a new target colour on the sign.
func show_target(new_name, new_amounts):
	target_name = new_name
	target_amounts = new_amounts
	# Use the same maths as the bowl, so the target is always possible.
	target_colour = ColourMixer.mix_paint(target_amounts)
	swatch_material.albedo_color = target_colour
	name_label.text = target_name
