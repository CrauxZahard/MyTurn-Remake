class_name CharacterCommon extends Sprite2D

@export var IMG_PATHS = {
	'IDLE': "res://assets/img/characters/squire/action/idle.png",
	'ATTACK': "res://assets/img/characters/squire/action/attack.png",
	'CAST': "res://assets/img/characters/squire/action/cast.png",
	'HIT': "res://assets/img/characters/squire/action/hit.png",
};
@export var IS_ACTION:bool = false;
@export var ACTION_STATE = EnumContainerHelper.ActionStateEnum.IDLE;

var delaySeconds = ConstantContainerHelper.ACTION_DELAY;

func _ready():
	self._setIdleState();

func _process(delta):
	if(IS_ACTION == true):
		self._update_action(delta);

func _update_action(delta) -> void:
	const ENUM_ACTION = EnumContainerHelper.ActionStateEnum;
	match ACTION_STATE:
		ENUM_ACTION.HIT:
			self._setHitState(delta);
			pass
		ENUM_ACTION.ATTACK:
			self._setAttackState(delta);
			pass
		ENUM_ACTION.CAST:
			self._setCastState(delta);
			pass
		ENUM_ACTION.IDLE:
			self._setIdleState();
			pass
		_:
			self._setIdleState();
			pass

func _setAttackState(delta):
	self.set_texture(load(IMG_PATHS.ATTACK));
	if(_addDelayTimer(delta)):
		self._setIdleState();
		IS_ACTION = false;

func _setHitState(delta):
	self.set_texture(load(IMG_PATHS.HIT));
	if(_addDelayTimer(delta)):
		self._setIdleState();
		IS_ACTION = false;

func _setCastState(delta):
	self.set_texture(load(IMG_PATHS.CAST));
	if(_addDelayTimer(delta)):
		self._setIdleState();
		IS_ACTION = false;

func _setIdleState():
	delaySeconds = .5;
	self.set_texture(load(IMG_PATHS.IDLE));

func _addDelayTimer(delta) -> bool:
	delaySeconds -= delta;
	return delaySeconds < 0;
