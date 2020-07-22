////////////////////////////////////////////////////////////////////////////////
// FILE: _accordion.js
// AUTHOR: David Ruvolo
// CREATED: 2020-07-08
// MODIFIED: 2020-07-22
// PURPOSE: accordion input component binding
// DEPENDENCIES: Shiny assets
// STATUS: in.progress
// COMMENTS: This input binding toggles all instances of the accordion
// component. This script will create a new constructor that extends the
// Shiny.InputBinding() and adjust the state of the component when the
// toggle is clicked. ARIA attributes will also be adjusted.
////////////////////////////////////////////////////////////////////////////////

// create new binding
var AccordionInput = new Shiny.InputBinding();
$.extend(AccordionInput, {
    
    // find: locate component within scope
    find: function(scope) {
        return $(scope).find(".accordion__input");
    },

    // initialize: null
    initialize: function(el) {
        var value = $(el).find(".accordion__checkbox").prop("checked");
        return value;
    },

    // getValue: null
    getValue: function(el) {
        var value = $(el).find(".accordion__checkbox").prop("checked");
        return value;
    },

    // subscribe: create an register DOM events
    subscribe: function(el, callback) {

        // onClick: toggle accordion state
        $(el).on("click", "button.accordion__toggle", function(e) {
            var btn = $(this);
            var icon = btn.find(".toggle__icon");
            var section = $(el).find(".accordion__content");

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
        });

        // onClick: return checkbox input
        $(el).on("change", "input.accordion__checkbox", function(e) {
            callback();
        });
    },

    // receiveMessage: server-side functions for updating this component
    receiveMessage: function(el, message) {

        // reset_accordion_input
        if (message === "reset") {
            var btn = $(el).find(".accordion__toggle");
            var icon = btn.find(".toggle__icon");
            var section = $(el).find(".accordion__content");
            btn.attr("aria-expanded", "false");
            section.attr("hidden", "");
            icon.removeClass("rotated");
            $(el).find(".accordion__checkbox").prop("checked", false);
        }

    },

    // unsubscribe: clean up
    unsubscribe: function(el) {
        $(el).off(".AccordionInput");
    }
})

// export
export default AccordionInput