extends CanvasGroup

@onready var text_label: RichTextLabel = $Panel/Box/VBox/Text
@onready var hint_label: Label = $Panel/Box/VBox/Hint

var _lines: Array[String] = []
var _idx := 0
var active := false

func _ready() -> void:
	visible = true
	show_dialogue(["TEST LINE A", "TEST LINE B", "TEST LINE C"])


func show_dialogue(lines: Array[String]) -> void:
	_lines = lines
	_idx = 0
	active = true
	visible = true
	_display_current()

func _display_current() -> void:
	text_label.text = _lines[_idx]
	hint_label.text = tr("DIALOGUE_CONTINUE_HINT")

func try_advance() -> bool:
	if not active:
		return false
	_idx += 1
	if _idx >= _lines.size():
		active = false
		visible = false
	else:
		_display_current()
	return true
