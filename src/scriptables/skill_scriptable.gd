class_name SkillScriptable extends CardScriptable

enum TargetingType {
	SingleLiveEnemy = 0,
	AllEnemies = 1,
	SingleLiveAlly = 2,
	AllAllies = 3,
	SingleLiveAny = 4,
	Auto = 5,
	Self = 6,
	SingleDeadOrAliveAlly = 7,
	SingleDeadOrAliveEnemy = 8,
	SingleDeadOrAliveAny = 9,
	SingleDeadAlly = 10,
	#SingleDeadEnemy = 11,
	SingleDeadAny = 12
 }

@export var targetType: TargetingType
@export var useRNG: bool
@export var skillCost: int
@export var skillEffect: Array[int] #to-do: Array[CardEffect]
