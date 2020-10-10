////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2020-07-22
// MODIFIED: 2020-10-10
// PURPOSE: primary script for package assets
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// import styles
import "./scss/index.scss";


// import methods
import Accordion from "./js/_accordion";
import AccordionInput from "./js/_accordion_input";
import card from "./js/_cards";
import CheckboxGroup from "./js/_checkbox_group";
import { errorBox, errorText } from "./js/_errors";
import fieldInput from "./js/_field_inputs";
import setDocMeta from "./js/_set_doc_attribs";
import Progressbar from "./js/_progressbar";

// on DOMContentLoaded
window.addEventListener("DOMContentLoaded", function(e) {
    const refElem = document.getElementById("icecomponents__meta");
    if (refElem) {
        setDocMeta();
    }
    if (!refElem) {
        console.error("iceComponents: document attributes are not defined");
    }
}, { once: true });



// register
Shiny.inputBindings.register(Accordion);
Shiny.inputBindings.register(AccordionInput);
Shiny.inputBindings.register(card);
Shiny.inputBindings.register(CheckboxGroup);
Shiny.inputBindings.register(errorBox);
Shiny.inputBindings.register(errorText);
Shiny.inputBindings.register(fieldInput);
Shiny.inputBindings.register(Progressbar);