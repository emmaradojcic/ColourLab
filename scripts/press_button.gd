class_name PressButton
extends XRToolsInteractableAreaButton

# A button you press down with your fingertip.
# XR Tools does the pressing. We just add a text label and a colour.
# Listen to the "button_pressed" signal to know when it is pressed.

# The words shown above the button.
@export var label_text: String = "Button"

# The colour of the round part you press.
@export var button_colour: Color = Color(0.85, 0.2, 0.2)


func _ready():
	# Run the XR Tools button setup first.
	super()
	$Label3D.text = label_text

	# Give this button its own copy of the material in its colour.
	var top = $ButtonTop
	var material = top.mesh.material.duplicate()
	material.albedo_color = button_colour
	top.material_override = material
