extends Node

const VERSION = 10
const BASE_URL = "https://discord.com/api"
const WS_URL = "wss://gateway.discord.gg"

func GET_HTTP_URL() -> String : return BASE_URL + "/v%s" % VERSION
func GET_WS_URL() -> String : return WS_URL + "/v%s&encoding=json" % VERSION
func GET_AUTH_HEADER(token: String) -> String : return "Authorization: Bot %s" % token
