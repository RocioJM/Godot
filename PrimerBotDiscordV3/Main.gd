extends Control

var prefix = "!"
#primer Robot
var token = "anadir token de tu bot"

# Called when the node enters the scene tree for the first time.
func _ready():
	var discord_bot = $DiscordBot
	
	discord_bot.TOKEN = token
	discord_bot.login()
	
	discord_bot.connect("bot_ready", self, "_on_bot_ready")
	#discord_bot.connect("message_create", self, "_on_message_create")
	discord_bot.connect("message_create", self, "_on_message_create")
	
func _on_bot_ready(bot : DiscordBot):
	print("bot is ready")
	
	#Update the bots presence
	bot.set_presence({
		"activity":{
			"type": "GAME",
			"name": "Tutorial Bot"
		}
	})
	
func _on_message_create1(bot : DiscordBot, message: Message, channel: Dictionary):
	if message.content and message.content != "":
		print("got a message: ", message.content)
	elif message.embeds.size() > 0:
		print("got a message with embeds: ", message.embeds)
	elif message.attachments.size() > 0:
		print("got a message with attachments: ", message.attachments)
	else:
		print("got an empty message")
	
func _on_message_create(bot : DiscordBot, message: Message, channel: Dictionary):
	#Check if message was sent by a bot
	if message.author.bot:
		print("Mensaje enviado por un bot")
		return
		
	if not message.content.begins_with(prefix):
		print("El mensaje enviado no tiene el prefijo.")
		return
	#Now we need to get the command name and the command arguments
	#We will use  Regular Expressions for test
	var raw_content = message.content.lstrip(prefix)
	var tokens = []
	var regex = RegEx.new()
	regex.compile("\\S+")
	
	for token in regex.search_all(raw_content):
		print("Token: "+ token.get_string())
		tokens.append(token.get_string())
	
	var cmd = tokens[0].to_lower()
	print("cmd: "+ cmd)
	tokens.remove(0)
	var args = tokens
	
	handle_command(bot, message, channel, cmd, args)


func handle_command(bot, message, channel, cmd, args):
	match cmd:
		"prueba":
			var image_url = "https://i.imgur.com/UJYN09a.jpg"
			#var image_url = "res://assets/michi2.jpeg"
			#var image_url = "https://images.unsplash.com/photo-1708733668414-b41fef98b21a?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
			var embed = Embed.new().set_description("Esto es la descripcion")
			embed.set_timestamp()
			embed.set_author("By Rocio JM", "https://github.com/RocioJM", "https://i.imgur.com/bdYj5n1.png")
			#embed.set_author("By Rocio JM", "https://github.com/RocioJM")
			embed.set_title("Testing Embed").set_url("https://www.twitch.tv/frikizillagamer")
			embed.set_color("#6e87eb")
			embed.set_thumbnail("https://i.imgur.com/CM4yiUQ.png")
			embed.set_image("https://i.imgur.com/UJYN09a.jpg")
			#embed.set_image("res://assets/imgMichi.jpg")
			embed.set_footer("Request by " + message.author.username)
			#embed.add_field("Field 1", "Text of field one", true)
			#embed.add_field("Field 2", "Text of field two", true)# si quitamos los true se ponen en diferentes filas
			#bot.send(message, "Hola Frikizillos soy RoBot!")
			bot.send(message, {
				"embeds": [embed]
			})
		"ping":
			var starttime = OS.get_ticks_msec() #start epoch
			var msg = yield(bot.reply(message, "Ping..."), "completed") #Wait for message to be send
			var latency = str(OS.get_ticks_msec() - starttime)
			bot.edit(msg, "Pong! My latency is "+ latency + "ms.")
		_:
			print("Dice que la palabra es: " + cmd)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
