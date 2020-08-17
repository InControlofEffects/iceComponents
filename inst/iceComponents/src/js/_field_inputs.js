////////////////////////////////////////////////////////////////////////////////
// FILE: _field_inputs.js
// AUTHOR: David Ruvolo
// CREATED: 2020-08-17
// MODIFIED: 2020-08-17
// PURPOSE: input binding for password input
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// input
var fieldInput = new Shiny.InputBinding();

// create binding
$.extend(fieldInput, {
    find: function(scope) {
        return $(scope).find(".field__input");
    },

    // on render
    initialize: function(el) {

        // clear existing value (useful for page refresh)
        $(el).val("");

        // prevent form submission on "Enter"
        $(el).on("keydown", function(e) {
            switch(e.key) {
                case "Enter":
                  e.preventDefault();
                  break ;
            }
        });

        // redirect focus to container
        $(el).on("focus", function(e) {
            $(el).parent().addClass("field__focus");
        });

        // on blur
        $(el).on("blur", function(e) {
            $(el).parent().removeClass("field__focus");
        })

        // return init value
        return $(el).val(); 
    },

    // send value back to shiny
    getValue: function(el) {
        return $(el).val();
    },

    // return value when user is typing
    subscribe: function(el, callback) {
        $(el).on("input", function(e) {
            callback();
        })
    },

    // receive messages
    receiveMessage: function(el, message) {

        // invalidate input
        // when called in the server via invalidate_password_input,
        // the following code will add the attribute `aria-invalid`
        // and insert an error message in the span element
        if (message.type === "invalidateInput") {
            $(el).attr("aria-invalid", "true");
            $(el).parent().addClass("field__invalid");

            // find span element
            var errorElem = "#" + $(el).attr("aria-describedby").split(" ")[1];
            $(errorElem).text(message.error);

            // add event that clears error message after typing
            $(el).on("keypress", function(e) {
                if (e.target.value.length > 3) {
                    $(el).removeAttr("aria-invalid");
                    $(el).parent().removeClass("field__invalid");
                    $(errorElem).text("");
                    $(el).off("keypress");
                }
            });
        }

        // reset input 
        // when called via reset_password_input, the following code
        // will remove the invalid property and clear the error message
        if (message.type === "resetInput") {
            $(el).val("");
            $(el).removeAttr("aria-invalid");
            $(el).parent().removeClass("field__invalid");

            // reset error message
            var errorElem = "#" + $(el).attr("aria-describedby").split(" ")[1];
            $(errorElem).text("");
        }
    },

    // unsubscribe
    unsubscribe: function(el) {
        $(el).off(".fieldInput");
    }
});


// export
export default fieldInput;
