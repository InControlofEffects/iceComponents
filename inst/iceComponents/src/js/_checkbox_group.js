////////////////////////////////////////////////////////////////////////////////
// FILE: _checkbox_group.js
// AUTHOR: David Ruvolo
// CREATED: 2020-07-23
// MODIFIED: 2020-07-23
// PURPOSE: Shiny input binding for custom checkbox input group
// DEPENDENCIES: NA
// STATUS: in.progress
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// create new binding
var CheckboxGroup = new Shiny.InputBinding();
$.extend(CheckboxGroup, {
    find: function(scope) {
        return $(scope).find(".checkbox__group");
    },

    // method: initialize
    // Find all checkbox inputs and set checked property based on user-defined
    // states
    initialize: function(el) {
        var nodes = $(el).find(".option__checkbox");
        nodes.map(function(n) {
            if (this.getAttribute("checked") === "true") {
                this.checked = true;
            } else {
                this.checked = false;
            }
        });
    },

    // method: getValue
    // Find all inputs that are checked and return as an array
    getValue: function(el) {
        // find inputs and return checked IDs
        var nodes = $(el).find(".option__checkbox");
        var checked = nodes.map(function(n) {
            if (this.checked) {
                return this.id;
            }
        }).get();
        return checked;
    },

    // method: subscribe
    // Watch for checkbox state changes. If changed, trigger method
    // getValue (i.e., callback)
    subscribe: function(el, callback) {
        $(el).on("change", "input[type='checkbox']", function(e) {
            callback();
        });
    },

    // method: receiveMessage
    // Use this method to receive messages from the shiny server. This is
    // ideal for functions such as "reset"
    receiveMessage: function(el, message) {

        // reset checkbox group to at render state
        if (message === "reset") {
            this.initialize(el);
            $(el).find(".option__checkbox").trigger("change");
        }

        // clear checkbox group selections
        if (message === "clear") {
            var nodes = $(el).find(".option__checkbox");
            nodes.map(function(n) {
                this.checked = false;
            });
            $(el).find(".option__checkbox").trigger("change");
        }
    },

    // method: unsubscribe
    // detach binding and events
    unsubscribe: function(el) {
        $(el).off(".CheckboxGroup");
        $(el).off("change")
    }
});

// export
export default CheckboxGroup
