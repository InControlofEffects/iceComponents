![The In Control of Effects project](incontrolofeffects.png)

<!-- badges: start -->
![version](https://img.shields.io/github/package-json/v/InControlofEffects/iceComponents/prod?color=%235ABCB9)
![R-CMD-check](https://github.com/InControlofEffects/iceComponents/workflows/R-CMD-check/badge.svg)
<!-- badges: end -->

# In Control of Effects UI Components

The `iceComponents` package is a primary dependency for the shiny application `iceApp` and part of the [In Control of Effects project](https://github.com/InControlofEffects). The In Control of Effects application is a shiny app that provides antipsychotic medication recommendations based on an individual's preference for avoiding side effects. This project aims to initiate a discussion between the individual and their psychiatrist regarding antipsychotic medications and the risk of side effects.

This package includes several of the components that are used in the Shiny app. These components are designed for applications that have a series of "pages" that users click through and interact with. For example, instructions pages or surveys. The components used in this package are designed specifically for the application, but they can be adapted for use in your applications. These components are slightly experimental and serve as a starting point for the [accessible shiny](https://github.com/davidruvolo51/accessibleshiny) package.

More information about the project can be found in the [information repository](https://github.com/InControlofEffects/information).

## Installation

You can install `iceComponents` using the `devtools` (or `remotes`) package.

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
| `back_btn` | `inputId`, `label` | create back button for page navigation
| `checkbox_group` | `inputId`, `title`, `caption`, `choices`, `values`, `checked` | Create a series of checkboxes
| `card` | `inputId`, `text`, `icon_name`, `icon_type` | display a text card
| `card_group` | `...`, `class` | a container for multiple cards
| `container` | `class`, `...` | a generic container for writing pages into
| `error_box` | `inputId`, `class`, `icon_name`, `icon_type` | create an error message container
| `forward_btn` | `inputId`, `label` | create forward button (i.e., next page) for page navigation
| `input` | `inputId`, `label`, `type`, `icon` | create an input element
| `navigation` | `...` | create a page naviation component (use `back_btn` and/or `forward_btn`)
| `page` | `inputId`, `class`, `...` | a container for creating pages
| `progress` | ... | an R6 class for creating progressbars
| `set_doc_attribs` | `lang`, `dir` | set attributes in the `<html>` element

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
| `show_error_box` | `inputId`, `error` | update and show an error box
| `hide_error_box` | `inputId` | hide an error box
| `update_card` | `inputId` | modify the text of a text card

### Accounts Management

In addition to the functions above, there is also the `accounts` class. This object contains a series of methods for managing user accounts.

```r
# create new instance
db <- iceComponents::accounts$new()

# define instance configuration
db$config(
    name = "my-app-accounts",
    version = "1.0.0"
)

# add user
db$add_user(
    username = "myCoolName",
    password = "test",
    type = "standard"
)

# change password for `test`
db$reset_password(
    username = "myCoolName",
    password = "new-pwd"
)

# save and view
db$print_data()
db$save_data(dir = "data/")
```
