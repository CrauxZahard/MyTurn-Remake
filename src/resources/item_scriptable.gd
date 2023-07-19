class_name ItemScriptable extends CardScriptable

enum TargetingType {
	SingleLiveEnemy = 0,
	SingleLiveAlly = 1,
	SingleLiveAny = 2,
	Auto = 3,
	SingleDeadOrAliveAlly = 4,
	SingleDeadOrAliveEnemy = 5,
	SingleDeadOrAliveAny = 6,
	SingleDeadAlly = 7,
	#SingleDeadEnemy = 8,
	SingleDeadAny = 9
}

@export var targetType: TargetingType
