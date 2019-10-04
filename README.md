# MOOC Accessibility website

Source code for the [MOOC Accessibility website](https://mooc-accessibility.inria.fr).

## Why

Because manually managing configurations is a hassle. If we need to update all the configurations at once, this should be easy to do.

## How

This website is generated using [Hugo](https://gohugo.io) `v0.57`. [Installing Hugo](https://gohugo.io/getting-started/installing) is required to build the static files.

## What

This website hosts:

1. HTML files to consume the Accessibilité Numérique MOOC in a standalone fashion
2. HTML files to be embed for 3rd party platforms such as [FUN](https://www.fun-mooc.fr).

## Managing content

### Generating a new course content

```sh
hugo new course/<course_identifier>/index.md
```
