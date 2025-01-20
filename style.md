Notes on keeping specific style between one another.

Static typing:
	Please use static typing as much as you possibly can.  It would probably
	help to make static typing the default in the settings if you haven't.
	Static typing improves performance, makes debugging easier, and imo makes
	scripts easier to understand.

Commenting:
	Try to use comments to explain your code in places where it may be
	confusing.  Use documentation comments (##) to explain all export variables,
	as well as any variables, signals, or functions that serve a purpose that
	isn't immediately understandable.

Order:
	Keep scripts in the standard order as described by Godot Documentation:
		class_name
		extends
		signal
		@export var
		var
		@onready var
		func _
		func
		class
