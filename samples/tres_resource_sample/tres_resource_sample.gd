extends Node2D

var _sampRes:SampleResource = SampleResource.new(); 

func _ready():
	const pathEnum = self._sampRes.PathEnum;
	self._sampRes.sName = "Tezada"
	self._sampRes.image = "res://icon.svg"
	self._sampRes.dataSetter(pathEnum.SAMPLE);
	self.createTextAndImage();
	
func createTextAndImage():
	const pathEnum = self._sampRes.PathEnum;
	var data = self._sampRes.dataGetter(pathEnum.SAMPLE);
	self.get_node("Label").set_text(data.sName);
	self.get_node("logo").set_texture(load(data.image));
