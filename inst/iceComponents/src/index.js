////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2020-07-22
// MODIFIED: 2020-07-22
// PURPOSE: primary script for package assets
// DEPENDENCIES: NA
// STATUS: in.progress
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// import styles
import "./scss/index.scss"


// import methods
import Accordion from "./js/_accordion"
import AccordionInput from "./js/_accordion_input"

// register
Shiny.inputBindings.register(Accordion);
Shiny.inputBindings.register(AccordionInput);