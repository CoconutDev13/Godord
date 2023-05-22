extends Node

const GUILDS : int = 1 << 0
const GUILD_MEMBER : int = 1 << 1
const GUILD_MODERATION : int = 1 << 2
const GUILD_EMOJIS_AND_STICKERS : int = 1 << 3
const GUILD_INTEGRATIONS : int = 1 << 4
const GUILD_WEBHOOKS : int = 1 << 5
const GUILD_INVITES : int = 1 << 6 
const GUILD_VOICE_STATES : int = 1 << 7
const GUILD_PRESENCES : int = 1 << 8
const GUILD_MESSAGES : int = 1 << 9
const GUILD_MESSAGE_REACTIONS : int = 1 << 10
const GUILD_MESSAGE_TYPING : int = 1 << 11
const DIRECT_MESSAGES : int = 1 << 12
const DIRECT_MESSAGE_REACTIONS : int = 1 << 13
const DIRECT_MESSAGE_TYPING : int = 1 << 14
const MESSAGE_CONTENT : int = 1 << 15
const GUILD_SCHEDULED_EVENTS : int = 1 << 16
const AUTO_MODERATION_CONFIGURATION : int = 1 << 20
const AUTO_MODERATION_EXECUTION : int = 1 << 21

func calculate_intents(intents: Array[int]):
	var result = 0
	for intent in intents:
		result += intent

	return result

func common():
	return [
		GUILD_MEMBER,
		GUILD_MESSAGES,
		MESSAGE_CONTENT
	]

func all():
	return [
		GUILDS,
		GUILD_MEMBER,
		GUILD_MODERATION,
		GUILD_EMOJIS_AND_STICKERS,
		GUILD_INTEGRATIONS,
		GUILD_WEBHOOKS,
		GUILD_INVITES,
		GUILD_VOICE_STATES,
		GUILD_PRESENCES,
		GUILD_MESSAGES,
		GUILD_MESSAGE_REACTIONS,
		GUILD_MESSAGE_TYPING,
		MESSAGE_CONTENT,
		GUILD_SCHEDULED_EVENTS,
		AUTO_MODERATION_CONFIGURATION,
		AUTO_MODERATION_EXECUTION
	]
