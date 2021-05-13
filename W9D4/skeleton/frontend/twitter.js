const FollowToggle = require("./follow_toggle")

function callback($el) {
  $el.each = new FollowToggle($el)
}