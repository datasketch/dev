---
title: "How to develop Datasketch Apps"
draft: false
menu: "nav"
weight: 7
---

## Generic Apps

### Objective

Develop many apps at once that share the same funcionalities. 


### Features

All apps should have the following funcionalities

- Same layout {shinypanles}
  - Data Panels
    - Data upload
    - Data preview or tweaking
  - Visualization Panels 
    - Inputs, controls and options for users
    - Result previews 
- Data upload from multiples sources:
  - Googlesheets, local files, url {dsmodules}
  - Datasketch Open Data {dsconnect}
- Export data and results
  - Download in multiple formats {dsmodules}
  - Publish to Datasketch Library {dsconnect}
- Multi-language support {shi18ny}
- Custom inputs (search, color palettes, etc) {shinyinvoer}
- Use tidy data types for humans when possible {homodatum} {datafringe}
- Use data validations for table inputs {hotr} with dictionaries {datafringe}
- Use parametrized apps from config files {parmesan}

### Package structure

![](/images/ds-apps-pkgs-1.jpg)


![](/images/ds-apps-pkgs-2.jpg)

## Generic app components

- Layout [{shinypanels}](http://github.com/datasketch/shinypanels)
- Interact with Datasketch library [{dsconnect}](http://github.com/datasketch/dsconnect)
- Interactive table input [{hotr}](http://github.com/datasketch/hotr)

## Data packages

- Data types for humans [{homodatum}](http://github.com/datasketch/homodatum)
- Tidy Data for Humans [{datafringe}](http://github.com/datasketch/datafringe)

## Visualization packages

- Ggplot wrapper  [{ggmagic}](http://github.com/datasketch/ggmagic)
- Highcharts wrapper  [{ggmagic}](http://github.com/datasketch/hgchmagic)
- Leaflet wrapper  [{ggmagic}](http://github.com/datasketch/lfltmagic)
- Geo data  [{geodata}](http://github.com/datasketch/geodata)


## Develop specific apps

### App pipeline

See galley of live apps here
https://airtable.com/shrCThQAEq8KHGDR2

Development roadmap
https://airtable.com/shr1PJHKuFYcEEdGQ


### How to name app repositories

All open source apps live in http://github.com/datasketch and the repositories must comply with the following naming convention `http://github.com/datasketch/app_key` where `key` is the unique identifier for each app.

The code of the apps must have the following structure:

- `app.R` Code for the app
- `www` custom assets for the app. When it is the same in many app, consider incorporating directly in {shinypanels}
- `app.Rproj` Rstudio project
- `.gitignore` Ignored files

TODO The repository `http://github.com/datasketch/app_structure` contains a sample app you can clone to start off.




### Submitting an App for review or publication

We are not yet ready for external contributions. Contact us and we will keep you posted.

### Coding guidelines

TODO Add Datasketch R coding guidelines

Suggested .gitignore for apps

```
.Rproj.user
.Rhistory
.RData
.Ruserdata
rsconnect
``` 

Suggested .gitignore for packages

```
# History files
.Rhistory
.Rapp.history

# Example code in package build process
*-Ex.R

# RStudio files
.Rproj.user/
.Rproj.user/*

# RData
.RData

# produced vignettes
vignettes/*.html
vignettes/*.pdf

#*.Rproj
.Rproj.user
.DS_Store
``` 













