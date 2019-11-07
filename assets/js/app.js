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
const EVENT_ATTR = 'phx-click';
const Hooks = {};
Hooks.OpenModal = {
  mounted() {
    this.el.addEventListener('click', () => {
      if(confirm('Are you sure?')) {
        this.pushEvent(this.el.getAttribute(EVENT_ATTR), this.el.getAttribute('phx-value'));
      }
    });
  }
};
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
// Default SortableJS
// import Sortable from 'sortablejs';


// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".
import "./custom"

// import socket from "./socket"
import LiveSocket from "phoenix_live_view"

let liveSocket = new LiveSocket("/live", {hooks: Hooks})
liveSocket.connect()
