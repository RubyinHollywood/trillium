// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

socket.connect()
let chan = socket.channel("game", {})

let broadcastContainer = document.getElementById("broadcast")

chan.on("set", payload => {
  let broadcast = payload.body

  broadcastContainer.innerHTML = "someone won a set. great job."
  setTimeout(clearBroadcast, 1000);
})

function clearBroadcast (){
  broadcastContainer.innerHTML = ""
}
