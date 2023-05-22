extends Node

class_name Godord

var ws : WebSocketPeer = WebSocketPeer.new()
var tokenManager : TokenManager = TokenManager.new()
var signals : Signals = Signals.new()

var OP : Dictionary = {
	"Event": 0,
	"Heartbeat": 1,
	"Identify": 2,
	"Hello": 10,
	"HeartbeatACK": 11
}

signal READY

var _intents : int

func allow(intents: Array[int]):
	_intents = GatewayIntents.calculate_intents(intents)

func login(): 
	ws.connect_to_url(APIS.GET_WS_URL())

func on(signalName, callable):
	signals.connect(signalName, callable)

func update():
	ws.poll()
	if ws.get_ready_state() == WebSocketPeer.STATE_OPEN:
		while ws.get_available_packet_count():
			var packet_bytes = ws.get_packet()
			var packet_string = packet_bytes.get_string_from_utf8()
			var packet = JSON.parse_string(packet_string)
			forward_event(packet)

func forward_event(packet: Variant):
	var op = int(packet.op)
	match op:
		OP.Event:
			var eventName = packet.t
			var data = packet.d
			signals[eventName].emit(data)
		OP.Hello: 
			HelloEvent(packet)
		OP.HeartbeatACK: pass
			#print("HeartbeatACK: ", packet)

func HelloEvent(packet: Variant):
	var heartbeat_interval = packet.d.heartbeat_interval / 10000
	identify()
	var timer := Timer.new()
	timer.timeout.connect(heartbeat)
	add_child(timer)
	timer.wait_time = heartbeat_interval
	timer.start()

func heartbeat():
	var payload : Dictionary = {"op": OP.Heartbeat, "d": null}
	ws.send_text(JSON.stringify(payload))

func identify():
	var identifyData = Payloads.IDENTIFY
	
	identifyData["token"] = tokenManager.token
	identifyData["intents"] = _intents
	
	var identify = {
		"op": OP.Identify,
		"d": identifyData
	}

	ws.send_text(JSON.stringify(identify))
