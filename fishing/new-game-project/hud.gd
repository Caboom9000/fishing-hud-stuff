extends CanvasLayer
#Scipt for hud

# Signal for starting game
signal start_game

#Shows a temporary message on the screen

func show_message(text):
	$Message.text = text       # Set the message text
	$Message.show()            # Makes the label visable
	$MessageTimer.start()      # Start timer for when to hide message


# Called when the game is over — shows messages in sequence
func show_game_over():
	show_message("Game Over")              # Show "Game Over" message
	await $MessageTimer.timeout            # Wait until the timer finishes

	$Message.text = "Fishing!"                        # Change the text
	$Message.show()                                   # Show it 
	await get_tree().create_timer(1.0).timeout        # Wait one more second

	$StartButton.show()           # Show the start button 


# Updates the score display label with the current score

func update_score(score):
	$ScoreLabel.text = str(score)          # Convert the score to text and show it



# Runs when the Start button is pressed

func _on_button_pressed() -> void:
	$StartButton.hide()                     # Hide the start button
	start_game.emit()                       # Calls signal to start game
	$Message.hide()                         # Hides the message when game starts



# Runs when the MessageTimer times out
#func _on_message_timer_timeout() -> void:
#	$Message.hide()                         # Hide the message label
#	
