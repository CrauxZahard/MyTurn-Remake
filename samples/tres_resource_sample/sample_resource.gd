class_name SampleResource extends Resource

@export var sName: String;
@export var image: String;	

const _LIST_OF_PATHS = {
	"SAMPLE": "res://samples/tres_resource_sample/tres_sample.tres"
};

enum PathEnum {
	SAMPLE
}

func dataSetter(path:PathEnum) -> void:
	ResourceSaver.save(self, self._getPath(path));
	
func dataGetter(path:PathEnum):
	if(ResourceLoader.exists(self._getPath(path))):
		var data = ResourceLoader.load(self._getPath(path));
		return data;
	else:
		return "No data";
		
func _getPath(path: PathEnum) -> String:
	if (path == PathEnum.SAMPLE):
		return _LIST_OF_PATHS.SAMPLE
	return "No Path"
	
