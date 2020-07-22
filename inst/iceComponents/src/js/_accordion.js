////////////////////////////////////////////////////////////////////////////////
// FILE: _accordion.js
// AUTHOR: David Ruvolo
// CREATED: 2020-07-08
// MODIFIED: 2020-07-22
// PURPOSE: accordion button input binding
// DEPENDENCIES: Shiny assets
// STATUS: in.progress
// COMMENTS: This input binding toggles all instances of the accordion
// component. This script will create a new constructor that extends the
// Shiny.InputBinding() and adjust the state of the component when the
// toggle is clicked. ARIA attributes will also be adjusted. Return current
// state for use in the server (if needed by the user).
////////////////////////////////////////////////////////////////////////////////

// create new binding
var Accordion = new Shiny.InputBinding();
$.extend(Accordion, {
    
    // find: locate component within scope
    find: function(scope) {
        return $(scope).find(".accordion");
    },

    // initialize: null
    initialize: function(el) {
        return null;
    },

    // getValue: null
    getValue: function(el) {
        return null;
    },

    // subscribe: create an register DOM events
    subscribe: function(el, callback) {

        // pull elements
        var btn = $(el).find(".accordion__toggle");
        var icon = btn.find(".toggle__icon");
        var section = $(el).find(".accordion__content");
        
        // onClick event
        btn.on("click", function(e) {

            // toggle: component state + ARIA attributes
            if (btn.attr("aria-expanded") === "false") {
                btn.attr("aria-expanded", "true");
                section.removeAttr("hidden");
                icon.addClass("rotated");
            } else {
                btn.attr("aria-expanded", "false");
                section.attr("hidden", "");
                icon.removeClass("rotated");
            }

            // return state (if needed in the server)
            callback();
        });
    },

    // receiveMessage: reset_accordion
    receiveMessage: function(el) {
        var btn = $(el).find(".accordion__toggle");
        var icon = btn.find(".toggle__icon");
        var section = $(el).find(".accordion__content");
        btn.attr("aria-expanded", "false");
        section.attr("hidden", "");
        icon.removeClass("rotated");
    },

    // unsubscribe: clean up
    unsubscribe: function(el) {
        $(el).off(".Accordion");
    }
})

// export
export default Accordion