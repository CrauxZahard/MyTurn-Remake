class_name CardEffect  extends Resource
# TODO: complete generateEffect()
enum CardEffectType {
	Choose,
	Pierce,
	Echo,
	Channel,
	Resonance,
	Reuse2,
	Reuse3
}

@export var type: CardEffectType

static func generateEffect(cardEffectType: CardEffectType) -> CardEffect:
	var cardEffect: CardEffect = null
	match cardEffectType:
		CardEffectType.Choose:
			pass
		CardEffectType.Pierce:
			pass
		CardEffectType.Echo:
			pass
		CardEffectType.Channel:
			pass
		CardEffectType.Resonance:
			pass
		CardEffectType.Reuse2:
			pass
		CardEffectType.Reuse3:
			pass
	return cardEffect
	

