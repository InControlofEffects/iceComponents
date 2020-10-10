////////////////////////////////////////////////////////////////////////////////
// FILE: _cards.js
// AUTHOR: David Ruvolo
// CREATED: 2020-10-10
// MODIFIED: 2020-10-10
// PURPOSE: input binding for cards
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// create new binding
var card = new Shiny.InputBinding();
$.extend(card, {
    find: function (scope) {
        return $(scope).find(".ice__card");
    },
    initialize: function (el) {
        return null;
    },
    getValue: function (el) {
        return null;
    },
    receiveMessage: function(el, message) {
        $(el).find(".ice__card__label").text(message.text);
    },
    unsubscribe: function(el) {
        $(el).off(".card");
    }
});

export default card;