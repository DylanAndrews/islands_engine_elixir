var phoenix = require("phoenix")

var socket = new phoenix.Socket("/socket", {})

socket.connect()

function new_channel(player, screen_name) {
  return socket.channel("game:" + player, {screen_name: screen_name});
}

function join(channel) {
  channel.join()
    .receive("ok", response => {
      console.log("Joined successfully!", response)
    })
    .receive("error", response => {
      console.log("Unable to join", response)
    })
}

var game_channel = new_channel("moon", "diva")
join(game_channel)


function say_hello(channel, greeting) {
  channel.push("hello", {"message": greeting})
  .receive("ok", response => {
    console.log("Hello", response.message)
  })
  .receive("error", response => {
    console.log("Unable to say hello to the channel.", response.message)
  })
}

game_channel.on("said_hello", response => {
  console.log("Returned Greeting:", response.message)


function new_game(channel) {
  channel.push("new_game")
    .receive("ok", response => {
      console.log("New Game!", response)
    })
    .receive("error", response => {
      console.log("Unable to start a new game.", response)
    })
 }
