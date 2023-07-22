class_name CharacterCommon extends Sprite2D

@export var ACTION_IMG_PATHS = {
	'IDLE': "res://assets/img/characters/squire/action/idle.png",
	'ATTACK': "res://assets/img/characters/squire/action/attack.png",
	'CAST': "res://assets/img/characters/squire/action/cast.png",
	'HIT': "res://assets/img/characters/squire/action/hit.png",
};
@export var IS_ACTION:bool = false;
@export var ACTION_STATE = EnumContainerHelper.ActionStateEnum.IDLE;
@export var HP_MAX:int = 100;
@export var EX_MAX:int = 100;

var delaySeconds = ConstantContainerHelper.ACTION_DELAY;

func _ready():
	self._setIdleState();
	self._setInitMaxValue(Vector2(HP_MAX, EX_MAX))
	self.setHpValue(HP_MAX);
	self.setExValue(0);

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

func _setAttackState(delta) -> void:
	self.set_texture(load(ACTION_IMG_PATHS.ATTACK));
	if(self._addDelayTimer(delta)):
		self._setIdleState();
		IS_ACTION = false;

func _setHitState(delta) -> void:
	self.set_texture(load(ACTION_IMG_PATHS.HIT));
	if(self._addDelayTimer(delta)):
		self._setIdleState();
		IS_ACTION = false;

func _setCastState(delta) -> void:
	self.set_texture(load(ACTION_IMG_PATHS.CAST));
	if(self._addDelayTimer(delta)):
		self._setIdleState();
		IS_ACTION = false;

func _setIdleState() -> void:
	delaySeconds = ConstantContainerHelper.ACTION_DELAY;
	self.set_texture(load(ACTION_IMG_PATHS.IDLE));

func _addDelayTimer(delta) -> bool:
	delaySeconds -= delta;
	return delaySeconds < 0;

func _setInitMaxValue(init:Vector2) -> void:
	self.get_node("health_ex_bar_common/health_bar").set_max(init.x);
	self.get_node("health_ex_bar_common/health_bar/ex_bar").set_max(init.y);

func setExValue(ex:int) -> void:
	self.get_node("health_ex_bar_common/health_bar/ex_bar").set_value(ex);

func setHpValue(hp) -> void:
	self.get_node("health_ex_bar_common/health_bar").set_value(hp);
