![The In Control of Effects project](incontrolofeffects.png)

<!-- badges: start -->
![version](https://img.shields.io/github/package-json/v/InControlofEffects/iceComponents/prod?color=%235ABCB9)
[![Build Status](https://travis-ci.com/InControlofEffects/iceComponents.svg?token=nbvsGFZ6SFL5RUxtUKJb&branch=prod)](https://travis-ci.com/InControlofEffects/iceComponents)
![R-CMD-check](https://github.com/InControlofEffects/iceComponents/workflows/R-CMD-check/badge.svg)
<!-- badges: end -->

# In Control of Effects UI Components

The `iceComponents` package is a primary dependency for the shiny application `iceApp` and part of the [In Control of Effects project](https://github.com/InControlofEffects). The In Control of Effects application is a shiny app that provides antipsychotic medication recommendations based on an individual's preference for avoiding side effects. This project aims to initiate a discussion between the individual and their psychiatrist regarding antipsychotic medications and the risk of side effects.

This package includes several of the components that are used in the Shiny app. The components used in this package are designed specifically for the application, but they can be adapted for use in your applications. These components are slightly experimental and serve as a starting point for the [accessible shiny](https://github.com/davidruvolo51/accessibleshiny) package.

## Installation

You can install `iceComponents` using the `devtools` package.

``` r
devtools::install_github("InControlofEffects/iceComponents")
```

## Use

The `iceComponents` package provides a few custom UI components and a few Shiny server functions. To enable the package, call the function `use_iceComponents` at the top of the UI.

```r
ui <- tagList(
    iceComponents::use_iceComponents(),
    ...
)
```

### Shiny UI

| function  | arguments | description 
| :-------  | :-------- | :----------
| `use_iceComponents` | --- | Load package assets into the client (required).
| `accordion` | `inputId`, `title`, `content`, `heading_level`, `class` | Create a collapsible section.
| `accordion_input` | `inputId`, `title`, `content`, `checked`, `class` | Create a collapsible section with checkbox input.
| `checkbox_group` | `inputId`, `title`, `caption`, `choices`, `values`, `checked` | Create a series of checkboxes
| `input` | `inputId`, `label`, `type`, `icon` | create an input element

### Shiny Server

| function  | arguments | description 
| :-------  | :-------- | :----------
| `reset_accordion` | `inputId` | Reset accordion component to it's initial state (i.e., closed)
| `reset_accordion_input` | `inputId` | Close and reset input to default checked state
| `clear_accordion_input` | `inputId` | Force close and uncheck input (will override defaults)
| `reset_checkbox_group`  | `inputId` | Reset a checkbox group to the initial checked state
| `clear_checkbox_group`  | `inputId` | Unchecks all checkboxes
| `invalidate_input` | `inputId`, `error` | Invalidate an input element and display an error message
| `clear_input` | `inputId` | Removes form validation attributes/classes, but leaves text entered by user
| `reset_input` | `inputId` | Clear input text and form validation attributes/classes