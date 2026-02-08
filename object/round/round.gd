extends Control
class_name Round

var round_state: RoundState
var NUM_DICE = 10
var HAND_SIZE = 5

@onready var password = $Password
@onready var dice_bag = $DiceContainer/DiceBag
@onready var dice_stock = $DiceContainer/DiceStock
@onready var control_panel = $ControlPanel

var selected_die: Die

func _ready() -> void:
	round_state = RoundState.new()
	dice_bag.populate(NUM_DICE)
	dice_stock.add(dice_bag.select_random(HAND_SIZE))
	dice_stock.die_selected.connect(on_die_selected)
	control_panel.interface_selected.connect(on_interface_selected)

func _on_reroll_pressed() -> void:
	dice_stock.reroll_all()

func on_die_selected(die: Die) -> void:
	selected_die = die
	
func on_interface_selected(interface: Interface) -> void:
	if !selected_die or !interface.is_empty():
		return
	var matches = interface.data.matcher.match(selected_die)
	if !matches:
		return
	interface.insert_die(selected_die)
	selected_die = null
	interface.data.resolver.resolve(get_resolver_context(interface))
	
func get_resolver_context(interface: Interface) -> ResolverContext:
	var context = ResolverContext.new()
	context.interface = interface
	context.password = password
	return context
	
