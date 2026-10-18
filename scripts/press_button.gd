class_name PressButton
extends XRToolsInteractableAreaButton

# A button you press down with your fingertip.
# XR Tools does the pressing. We just add a text label.
# Listen to the "button_pressed" signal to know when it is pressed.

# The words shown above the button.
@export var label_text: String = "Button"


func _ready():
	# Run the XR Tools button setup first.
	super()
	$Label3D.text = label_text
