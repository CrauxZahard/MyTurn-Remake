class_name Character extends Resource

# these are default values
func _init(p_name = "Placeholder", p_max = 1, p_hp = 1, p_en = 0, p_tex = null):
	self.name = p_name
	self.max_hp = p_max
	self.hp = p_hp
	self.energy = p_en
	self.image = p_tex

func subHP(damage):
	self.hp = max(0, self.hp - damage)

func addHP(heal):
	self.hp = min(self.max_hp, self.hp + heal)

func subEnergy(amount):
	self.energy = max(0, self.energy - amount)

func addEnergy(amount):
	self.energy = min(100, self.energy + amount)
