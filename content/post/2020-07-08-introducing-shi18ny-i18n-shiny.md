---
title: "Introducing {shi18ny}: Internationalization for shinyapps"
date: 2020-07-08T14:23:34-05:00
draft: false
description: "Etiam nec nibh aliquam, ornare quam eget, feugiat leo. Maecenas ut justo ac magna convallis cursus. Suspendisse ac tempus quam."
# One of normal or cover
render_layout: "normal"
---

At [Datasketch](http://datasketch.co), we want to make data science more accessible and more inclusive, and we believe that one of the big challenges in bringing the data to the people is about translating the language in which the information is presented. 

For more accessibility and inclusion, we need
easy ways to create data visualization and analysis tools so that non-coders and non-statisticians can understand data; and
the ability to **internationalize** this information: to translate these tools into multiple languages and communicate the information to people all across the world.

To solve this problem, we have created `shi18ny` (read: ‘shiny internationalization’), a package to translate your Shiny apps into 15 different languages - and we’re constantly working to add more!

> Can’t wait to find out more about the package and don’t want to read our motivational thoughts? Simply jump to the [documentation of the package](https://shi18ny.datasketch.dev/). Here you also find a list of all currently available languages.*

Or watch our [UseR2020 talk](https://user2020.r-project.org/program/posters/) on youtube: shi18ny: Internationalization for Shiny Apps 


Motivation
The issues that arise in our globally connected world often don’t only affect a limited few but many. Communicating these issues clearly, and in a data-driven way, is quickly becoming more and more important in a world of social media bubbles and fake news. With the COVID-19 pandemic dominating our lives and the news channels it’s becoming even more apparent that we need to work harder to make data-driven information easily understandable and accessible to people all over the world.

Breaking down the confusing masses of data that are available about global issues, such as the development of cases of the coronavirus, and making them available online through data visualization tools is crucial. In recent times [Data Visualization has gone mainstream](https://www.fastcompany.com/90450827/its-official-data-visualization-has-gone-mainstream) up to the point where some charts like ["Flatten the curve" are becoming iconic](https://www.forbes.com/sites/evaamsen/2020/04/29/how-flatten-the-curve-is-on-its-way-to-become-a-historic-disease-image) and coranavirus dashboards are now everywhere on the web, or at least in the English speaking part of the web.

Many of the global databases, dashboards and platforms are written in English, looking at some estimates from the year 2008, we find that at that point around [a third of the population of the world spoke English](https://www.cambridge.org/core/journals/english-today/article/two-thousand-million/68BFD87E5C867F7C3C47FD0749C7D417). While this is a large number in absolute terms - and it is likely to have grown since then - we are still excluding the majority of the world’s population by catering only for the English-speaking part. And clearly, only a fraction of the English-speaking population speak English as their first language making it potentially difficult for the remaining part to truly understand the information and consequences communicated about global issues such as the corona crisis.

This is why at Datasketch we wanted to come up with a way to translate data visualization apps in Shiny into other languages so that people all over the world can inform themselves about important global issues without having to be statisticians, mathematicians, or coders, and importantly, without having to know how to speak English.

And yes, you could write a shiny app in your own language, but wouldn't it be nice to do it in multiple languages at once?

How `shi18ny` was born
To get inspiration for the implementation of a package that could put these concepts into practice, we looked around at other programming languages to see what’s already out there and came across the `NodeJS` `i18n` package (link: https://github.com/nodejs/i18n). This gave us some ideas towards the general implementation, we decided to enable translations in our package using _a dictionary with common data science terms_ for easy keyword translations, and using `.yaml` files to enable custom translations of words and phrases not included in the dictionary, or to overwrite existing translations.

Based on these ideas `shi18ny` was born. Let’s have a look at how you can use `shi18ny` to translate your own Shiny app.

**But before we continue**, we won’t leave you hanging any longer… you have probably been asking yourself since the beginning of this post - what on earth is the ‘18’ doing in `shi18ny`? As it turns out, there are 18 characters between the **i** and the **n** in the word **internationalization**. As simple as that.

Don’t believe me? Here’s a tiny program to prove our point:
(put in the code example that shows there are 18 characters between the i and n)

How to use `shi18ny`
Get started
To get started you need to install `shi18ny` in R. The easiest way to do this is to use the `remotes::install_github()` function. Note that the `remotes` package needs to be installed before you can run this function.

```{r install-github}
# install.packages("remotes")
remotes::install_github("datasketch/shi18ny")
```
If you are looking to install the package in order to contribute, you can go to the package documentation and follow the steps in the Getting Started (link) guide.

Basic examples

Before we start thinking about our Shiny app, let’s have a look at the base translation function that `shi18ny` uses for all translations. With the `i_` function, you can translate key words in the shape of strings, vectors and lists in the console. The following examples all use the default dictionary, as we haven’t defined any custom translations yet.

```{r basic-example}
# 1. translate a string
i_("hello", lang = "de")

# 2. translate a vector
i_(c("hello", "world"), lang = "de")

# 3. translate a list - use the ‘keys’ parameter to define one or more keys that should be translated
i_(list(id = "hello", translate = "world"), lang = "es", keys = "translate")
```
But what about words that aren’t in the dictionary or that you want to translate in a way that differs from the standard translation in the dictionary? For those we create a `yaml` file with custom translations. 

Let’s say, for example, that we want to be a bit more enthusiastic when we translate the English word ‘hello’ into German. Instead of ‘Hallo’, we want the translation to  be ‘Hallöchen!’. We also want to add a translation for the expression ‘how_are_you’ which is currently not in the dictionary (as this only includes keywords). We create a `de.yaml` file for these custom translations.

```{yaml yaml-custom-translations}
# de.yaml
myslang:
  how_are_you: Wie geht's?
hello: Hallöchen!
```


Once that’s done, let’s take a look at the most important functions of the package, and how you need to include them in your `app.R` code. 

Translate your app with `shi18ny`


