![The In Control of Effects project](incontrolofeffects.png)

<!-- badges: start -->
[![Build Status](https://travis-ci.com/InControlofEffects/iceComponents.svg?token=nbvsGFZ6SFL5RUxtUKJb&branch=prod)](https://travis-ci.com/InControlofEffects/iceComponents)
<!-- badges: end -->

# iceComponents

The `iceData` package is a primary dependency for the shiny application `iceApp` and part of the [In Control of Effects project](https://github.com/InControlofEffects). The In Control of Effects application is a shiny app that provides antipsychotic medication recommendations based on an individual's preference for avoiding side effects. The aim of the project is to initiate a discussion between the individual and their psychiatrist regarding antipsychotic medications and the risk of side effects.

This package includes several of the components used in the application. The components used in this package are designed specifically for the application, however they can be adapted for use in your applications. These components are slightly experimental and serve as a starting point for the [accessibleshiny package](https://github.com/davidruvolo51/accessibleshiny).

## Installation

You can install the released version of iceComponents using the devtools package.

``` r
devtools::install_github("InControlofEffects/iceComponents@prod")
```

## Use

The `iceComponents` package provides a few custom UI components and a few Shiny server functions.

### ShinyUI

| Function | Arguments | Description |
| :------- | :-------- | :------------
| `use_iceComponents` | --- | Load package assets into the client (required)
| `accordion()` | `inputId`, `title`, `content`, `heading_level`, `class` | Create a collapsible section
| `accordion_input()` | `inputId`, `title`, `content`, `checked`, `class` | Create a collapsible section that also acts as a checkbox input
| `checkbox_group()` | `inputId`, `title`, `caption`, `choices`, `values`, `checked` | Create a series of checkboxes

### ShinyServer

| Function | Arguments | Description |
| :------- | :-------- | :------------
| `reset_accordion()` | `inputId` | Reset accordion component to it's initial state (i.e., closed)
| `reset_accordion_input()` | `inputId` | Reset accordion component to it's initial state (i.e., closed) and initial checked state
| `reset_checkbox_group()`  | `inputId` | Reset a checkbox group to the initial checked state
| `clear_checkbox_group()`  | `inputId` | Forces all checkboxes to unchecked