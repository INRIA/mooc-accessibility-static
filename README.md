# MOOC Accessibility website

Source code for the [MOOC Accessibility website](https://mooc-accessibility.inria.fr).

## What

The built version of this static website will host:

1. HTML files to consume the Accessibilité Numérique MOOC in a standalone fashion.
2. HTML files to be embed for 3rd party platforms such as [FUN](https://www.fun-mooc.fr).

## Why

Because manually managing configurations is a hassle. If we need to update every courses configurations at once, this should be easy to do.

## How

This website is generated using [Hugo](https://gohugo.io) `v0.57`. [Installing Hugo](https://gohugo.io/getting-started/installing) is required to build the static HTML files.

No other dependencies are required, but you need to download the player assets if you want to test website locally:

1. Download Aiana player release ZIP archive; it should be the same as the one specified in `PLAYER_VERSION` key in `.travis.yml` file.  
  Releases are listed on the [repository releases page](https://github.com/dashdashzako/aiana-player/releases).
2. Unzip the archive.
3. Move the `release/manifest.yml` file to `data/manifest.yml`.
4. Move the player JavaScript files to `static/js/`.
5. Run `hugo`.

If you need to log player events, you will also have to create the `data/logger.yml` file and add some content to it.

```yaml
url: "<custom logger url>"
```

All of this is completely automated by the CI provider ([Travis CI](https://travis-ci.com)) and will run every time the `master` branch is pushed.

## Managing content

### Generating a new course content

```sh
hugo new course/<course_identifier>/index.md
```
