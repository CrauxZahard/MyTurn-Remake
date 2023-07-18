class_name CardScriptable extends Resource

enum Type {
	Yellow,
	Red,
	Blue,
	Green,
	Purple,
	Others
}

@export var type: Type
@export var cardName: String
@export var cardDesc: String
@export var cardImage: Texture
