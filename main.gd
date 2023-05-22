extends Node

@onready var bot : Godord = $Godord

func _ready():
	bot.allow([
		GatewayIntents.GUILD_MESSAGES,
		GatewayIntents.GUILD_MEMBER,
		GatewayIntents.MESSAGE_CONTENT,
	])

	bot.signals.READY.connect(on_ready)
	bot.signals.MESSAGE_CREATE.connect(on_message)

	bot.login()


func _process(delta):
	bot.update()

func on_ready(bot):
	print(bot)

func on_message(message):
	print(message.content)
