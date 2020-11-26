////////////////////////////////////////////////////////////////////////////////
// FILE: _errors.js
// AUTHOR: David Ruvolo
// CREATED: 2020-10-09
// MODIFIED: 2020-10-09
// PURPOSE: error components
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////


// new binding for errorboxes
var errorBox = new Shiny.InputBinding();
$.extend(errorBox, {
    find: function(scope) {
        return $(scope).find(".error__box");
    },
    initialize: function(el) {
        return null;
    },
    getValue: function(el) {
        return null;
    },
    receiveMessage: function(el, message) {
        if (message.type === "show") {
            $(el).removeClass("error__hidden");
            $(el).find(".error__box__text").text(message.error);
        }

        if (message.type === "hide") {
            $(el).addClass("error__hidden");
            $(el).find(".error__box__text").text("");
        }
    },
    unsubscribe: function(el) {
        $(el).off(".errorBox");
    }
});


// new binding for error text messages
var errorText = new Shiny.InputBinding();
$.extend(errorText, {
    find: function(scope) {
        return $(scope).find(".error__text");
    },
    initialize: function(el) {
        return null;
    },
    getValue: function(el) {
        return null;
    },
    receiveMessage: function(el, message) {
        if (message.type === "show") {
            $(el).removeClass("error__text__hidden");
            $(el).text(message.error);
        }

        if (message.type === "hide") {
            $(el).addClass("error__text__hidden");
            $(el).text("");
        }
    },
    unsubscribe: function(el) {
        $(el).off(".errorText");
    }
});


module.exports = {
    errorBox: errorBox,
    errorText: errorText
}

