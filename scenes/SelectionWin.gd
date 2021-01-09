extends CenterContainer 
export var options = {
	"Contractor" : "Contractor will reduce upgrade and renovation costs by 15% ",
	"Property Manager" : "Property managers earn 85% more income",
	"Realtor" : "Realtors transact home sales faster"
}

onready var optionText = $Panel/VBoxContainer/HBoxContainer/OptionText
onready var optionDesc = $Panel/VBoxContainer/Description
onready var optionKeys = options.keys()

var selectIdx = 0

class CustomSorter:
	static func len_desc(a, b):
		return a.length() > b.length()

func _ready():
	var _options = optionKeys.duplicate()
	_options.sort_custom(CustomSorter, "len_desc")
	var _optionText = optionText.duplicate()
	_optionText.text = _options[0]
	
	optionText.rect_min_size = _optionText.get_minimum_size()
	optionText.text = optionKeys[selectIdx]
	optionDesc.text = options[optionText.text]
	

func _process(delta):
	var _dup = optionText.duplicate()
	_dup.text = optionKeys[0] # longest string
	_dup.get_minimum_size()
	

func _on_Left_pressed():
	if selectIdx == 0:
		selectIdx = optionKeys.size() - 1
	else:
		selectIdx -= 1
	optionText.text = optionKeys[selectIdx]
	optionDesc.text = options[optionText.text]

func _on_Right_pressed():
	if selectIdx >= optionKeys.size() - 1:
		selectIdx = 0
	else:
		selectIdx += 1
	optionText.text = optionKeys[selectIdx]
	optionDesc.text = options[optionText.text]
