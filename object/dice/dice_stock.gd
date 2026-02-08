extends Node
class_name DiceStock

@onready var vbox = $VBox

var dice: Array[Node]

func add(new_dice: Array[Node]) -> void:
	for die in new_dice:
		dice.append(die)
		vbox.add_child(die)
		die.roll()

func reroll_all() -> void:
	for die in dice:
		die.roll()
