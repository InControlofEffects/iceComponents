////////////////////////////////////////////////////////////////////////////////
// FILE: _accordion.js
// AUTHOR: David Ruvolo
// CREATED: 2020-07-08
// MODIFIED: 2020-07-23
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

        // define function that handles state
        function toggleAccordion() {
            var btn = $(el).find(".accordion__toggle");
            var icon = $(el).find(".toggle__icon");
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
        }

        // onFocus
        $(el).on("focusin", function(e) {
            $(el).addClass("accordion__focused");
        });

        // onBlur
        $(el).on("focusout", function(e) {
            $(el).removeClass("accordion__focused");
        });

        // onClick: toggle accordion state
        $(el).on("click", "button.accordion__toggle", function(e) {
            toggleAccordion();
        });

        // onClick: return checkbox input
        $(el).on("change", "input.accordion__checkbox", function(e) {

            // add class name to parent container
            var isChecked = $(this).prop("checked");
            if (isChecked) {
                $(el).addClass("accordion__checked");
            } else {
                $(el).removeClass("accordion__checked");
            }

            // run callback
            callback();
        });
    },

    // receiveMessage: server-side functions for updating this component
    receiveMessage: function(el, message) {

        // reset_accordion_input
        if (message === "reset") {
            
            // close accordion
            $(el).find(".accordion__toggle").attr("aria-expanded", "false");
            $(el).find(".accordion__content").attr("hidden", "");
            $(el).find(".toggle__icon").removeClass("rotated");
            
            // reset accordion to default selected state
            var initial_state = !($(el).attr("data-accordion-initial-state"));
            if (initial_state) {
                $(el).find(".accordion__checkbox").prop("checked", true);
                $(el).addClass("accordion__checked");
            } else {
                $(el).find(".accordion__checkbox").prop("checked", false);
                $(el).removeClass("accordion__checked");
            }
        }

    },

    // unsubscribe: clean up
    unsubscribe: function(el) {
        $(el).off(".AccordionInput");
    }
})

// export
export default AccordionInput