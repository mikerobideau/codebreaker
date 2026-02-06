extends Control
class_name Round

var round_state: RoundState
var NUM_DICE = 10
var HAND_SIZE = 5

@onready var dice_bag = $DiceContainer/DiceBag
@onready var dice_stock = $DiceContainer/DiceStock

func _ready() -> void:
	round_state = RoundState.new()
	dice_bag.populate(NUM_DICE)
	dice_stock.add(dice_bag.select_random(HAND_SIZE))

func _on_reroll_pressed() -> void:
	dice_stock.reroll_all()
