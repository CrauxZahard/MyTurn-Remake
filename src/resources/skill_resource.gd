class_name SkillResource extends CardResource

enum MutiTypeTarget {
	SINGLE,
	ALL,
	RANDOM,
 }

enum SelectableTarget {
	ALLY,
	ENEMY,
	BOTH,
	SELF
}

@export var MULTI_TYPE: MutiTypeTarget;
@export var SELECT: SelectableTarget;
@export var STATUS: EnumContainerHelper.StatusTarget;
@export var IS_RNG: bool;
@export var SKILL_COST: int;
@export var SKILL_EFFECT: Array[int]; #to-do: Array[CardEffect]


