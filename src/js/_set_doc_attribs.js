////////////////////////////////////////////////////////////////////////////////
// FILE: _set_doc_attribs.js
// AUTHOR: David Ruvolo
// CREATED: 2020-10-07
// MODIFIED: 2020-10-07
// PURPOSE: set document attributes
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// define function
function setDocMeta() {
    const targetElem = document.getElementsByTagName("html")[0];
    const refElem = document.getElementById("icecomponents__meta");
    targetElem.lang = refElem.getAttribute("data-html-lang");
    targetElem.dir = refElem.getAttribute("data-html-dir");
}

export default setDocMeta

