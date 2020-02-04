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
- Data upload from Datasketch Open Data {dsAppsIO, dsconnect}
- Export modal {using dsAppsIO, dsconnect}
- Multi-language support using {shi18ny}
- Custom inputs (search, color palettes, etc) {shinyinvoer}
- Use data types for humans when possible {homodatum}
- Use data validations for table inputs {hotr} with dictionaries {datafringe}
- Use parametrized contents when possible {parmesan}

### Deployment

TODO:  How to deploy apps with github actions automatically



## Develop specific apps

All open source apps live in http://github.com/datasketch and the repositories must comply with the following naming convention `http://github.com/datasketch/app_key` where `key` is the unique identifier for each app.

The code of the apps must have the following structure:

- `app.R` Code for the app
- `www` custom assets for the app. When it is the same in many app, consider incorporating directly in {shinypanels}
- `app.Rproj` Rstudio project
- `.gitignore` Ignored files

The repository `http://github.com/datasketch/app_structure` contains a sample app you can clone to start off.

### Submitting an App for review or publication

When you come up with your own Datasketch App that you want to publish, make sure it aligns with everything outlined in [How to contribute] TODO

### Sugested .gitignore

```
.Rproj.user
.Rhistory
.RData
.Ruserdata
rsconnect
``` 













