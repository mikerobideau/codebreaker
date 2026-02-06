extends RefCounted
class_name RoundState

enum RoundStateValue {
	IDLE,
	DICE_PLAYED,
	COMPLETED,
	GAME_OVER
}

var state: RoundStateValue

func _ready() -> void:
	state = RoundStateValue.IDLE

func transition_to_idle() -> bool:
	state = RoundStateValue.IDLE
	return true
	
func transition_to_dice_played() -> bool:
	state = RoundStateValue.DICE_PLAYED
	return true
	
func transition_to_completed() -> bool:
	state = RoundStateValue.COMPLETED
	return true
	
func transition_to_game_over() -> bool:
	state = RoundStateValue.GAME_OVER
	return true
	
func is_idle() -> bool:
	return state == RoundStateValue.IDLE
