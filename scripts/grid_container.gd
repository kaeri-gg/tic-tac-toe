extends GridContainer

@onready var grid_container: GridContainer = %GridContainer

@onready var player_1_score_ui: Label = %Player_1_Score
@onready var player_2_score_ui: Label = %Player_2_Score
@onready var message: Label = %Message


var buttons: Array[Button]
var turn: int = 0
var game_ended: bool = false
var player1_score: int = 0
var player2_score: int = 0

const PLAYER1_SYMBOL: String = 'X'
const PLAYER2_SYMBOL: String = 'O'
const GRID_LENGTHS: int = 3

const WINS: Array = [
	[0,1,2], # vertical wins
	[3,4,5],
	[6,7,8],
	
	[0,3,6], # horizontal wins
	[1,4,7],
	[2,5,8],
	
	[0,4,8], # diagonal wins
	[2,4,6]
]

func _ready():
	for node in grid_container.get_children():
		if node is Button:
			buttons.push_back(node)
			reset(node)
			bind_event_to(node)

# this function will be called for all buttons
func on_button_pressed(button: Button):
	# prevents multiple clicks!
	if button.text :
		return
	if game_ended :
		return 
		
	# assign symbol to a button	
	button.text = get_symbol()
	rotate_turn()
	
	var winners_indexes = get_winner_indexes(button.text)
	var is_winner = winners_indexes.size() > 0
	var is_tie = turn == 9
	
	if is_winner:
		add_score(button)
		update_score()
		highlight(winners_indexes)
		end_game()
		
	elif is_tie:
		message.text = "It's a tie!"
		end_game()

func bind_event_to(button: Button) -> void:
	button.pressed.connect(on_button_pressed.bind(button))

func is_even() -> bool:
	return turn % 2 == 0 # it will return true otherwise false
	# it is equivalent to 
	# if turn % 2 == 0:
		# return true
	# else:
		# return false
			

func get_symbol() -> String:
	if is_even():
		return PLAYER1_SYMBOL 
	else:
		return PLAYER2_SYMBOL

func rotate_turn() -> void:
	turn += 1
	
func get_winner_indexes(symbol: String) -> Array:
	for WIN in WINS :
		
		#var count : int = 0
		var wins : Array = []
		for index in WIN :
			if buttons[index].text == symbol: 
				#count += 1
				wins.push_back(index)
		if wins.size() == GRID_LENGTHS:
			# we got a winner~
			message.text = "Player " + str(symbol) + " wins!"
			return wins
	# no wins
	return []
		
func add_score(button: Button) -> void:
	if button.text == PLAYER1_SYMBOL:
		player1_score += 1
	else:
		player2_score += 1
		
func update_score() -> void:
	player_1_score_ui.text = str(player1_score)
	player_2_score_ui.text = str(player2_score)
	
func highlight(winners_indexes: Array) -> void:
	for index in winners_indexes:
		buttons[index].disabled = true
	
func end_game() -> void:
	game_ended = true

func reset(button: Button) -> void:
	button.text = ''
	message.text = ''
	
func reset_game(buttons: Array[Button]) -> void:
	turn = 0
	game_ended = false
	for button in buttons:
		reset(button)
