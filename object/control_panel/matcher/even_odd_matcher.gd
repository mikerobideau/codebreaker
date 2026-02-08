extends Matcher
class_name EvenOddMatcher

enum EvenOdd {
	EVEN,
	ODD
}

@export var even_odd: EvenOdd

func match(die: Die) -> bool:
	return die.value % 2 == even_odd
