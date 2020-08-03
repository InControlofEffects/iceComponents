////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2020-07-22
// MODIFIED: 2020-08-03
// PURPOSE: primary script for package assets
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// import styles
import "./scss/index.scss"


// import methods
import Accordion from "./js/_accordion"
import AccordionInput from "./js/_accordion_input"
import CheckboxGroup from "./js/_checkbox_group"

// register
Shiny.inputBindings.register(Accordion);
Shiny.inputBindings.register(AccordionInput);
Shiny.inputBindings.register(CheckboxGroup);