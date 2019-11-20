# Inria MOOC Digital Accessibility Website

Inria MOOC Digital Accessibility website is the standalone version of the MOOC
that was hosted by [FUN](https://www.fun-mooc.fr/).  
It also contains web pages to be embed for 3rd party platforms such as
[FUN](https://www.fun-mooc.fr).

This website contains all the course resources (such as media, slides, or
subtitles). However, note that users will not be prompted with any survey nor
quiz.

It is available at the following url: <https://mooc-accessibility.inria.fr/>

## Requirements

This website is generated using [Hugo](https://gohugo.io) `>v0.58.3`.
[Installing Hugo](https://gohugo.io/getting-started/installing) is required in
order to build the static HTML files.

## Development

The only software requirement is Hugo, but if you want to test website locally
you will need to download the
[MOOC player](https://github.com/dashdashzako/aiana-player) assets:

1. Download Aiana player release zip archive; it should be the same as the one
   specified in `PLAYER_VERSION` key in `.travis.yml` file.  
   Releases are listed on the
   [repository releases page](https://github.com/dashdashzako/aiana-player/releases).

2. Unzip the archive.

3. Move the `release/manifest.yml` file to `data/manifest.yml`.

4. Move the player JavaScript files to `static/js/`.

5. Move the `release/locales` folder to `static/`. These files are included in
   the player release archive since `v2.2.1`. If you target an earlier version,
   the files can be copy pasted from the player repository depending on
   targetted player version. For example, if you intend to use `v2.2.0`, you
   should download all files from
   [`v2.2.0` tree](https://github.com/dashdashzako/aiana-player/tree/v2.2.0/public/locales).

6. Just run `hugo`, or if you specify a specific serving URL,
   `hugo --baseUrl https://<hostname>.<ext>/`.

7. Go to `http://localhost:1313`.

## Analytics

Two kinds of analytics will be measured as a user browses pages and uses the
MOOC player. Both are optional but may help understanding usages and improve the
website, the MOOC content, and the player.

### Audience Analytics

Audience analytics helps understanding global usage of the website and gives
insights about users browsing context: screen resolution, browser, operating
system…

Inria recommends using [Matomo](https://matomo.org/) (formerly Piwiki) to
collect the analytics, and this website uses the
[Inria on-premise instance](https://piwik.inria.fr/).

The Matomo `script` tag will be integrated on each page if a `data/matomo.yml`
file exists and has a `site_id` key.

For a local development environment, content of the file will be:

```yaml
site_id: '101'
```

The Matomo identifiers are:

- `100` for production
- `101` for staging

To require access to the website analytics, please contact any of the
administrators:

- [Pascal Guitton](pascal.guitton@inria.fr)
- [Julien Lelaurain](julien.lelaurain@inria.fr)

### Web Player Events

Player events help understand how users are interacting with the MOOC content.
They provide extensive details about the player state, but none about the user
triggering them.

The events will be pushed to a remote server only if its url is provided. The
logging endpoint can be specified within a `data/logger.yml` file containing a
`url` key.

For example, the `data/logger.yml` file could be:

```yaml
url: 'https://domain.com/path/to/write/logs'
```

## Managing Content

The ["Content Management"](https://gohugo.io/content-management/) section on of
the Hugo documentation explains extensively how to manage content, please refer
to it.

## Create a Release

[Travis CI](https://travis-ci.com) is used as continuous integration platform.

Whenever a Git tag is pushed, Travis will perform all steps mentioned above and
build an archive containing the files for both staging and production
environments.

Releases can be found on
[the project release page](https://github.com/dashdashzako/mooc-accessibility-static/releases).

Note that there is a
[static link to the latest release](https://github.com/dashdashzako/mooc-accessibility-static/releases/latest)
which is used for website deployment.

### Release Commit

1. Create the release tag using [semantic versioning](https://semver.org/):

   `git tag vX.X.X`

2. Push tags to the repository:

   `git push origin --tags`

3. Update `CHANGELOG.md` by moving the "Unreleased" section content to a new
   section containing the release tag.

4. Commit `CHANGELOG.md` updates.

### Manually Create a Release

If no continuous environment is provided, creating a release is still possible.
The `script` section of the `.travis.yml` file describes how to achieve this.

The following example will create a `./build` directory containing the files for
the production environment:

```sh
# example assumes `hugo` executable is available.
#
# target player tag is v2.2.3.

# download player archive
curl -LO https://github.com/dashdashzako/aiana-player/releases/download/v2.2.3/release.zip

# extract player files
unzip release.zip

# remove existing locales folder
rm -rf static/locales

# move player release locales to website assets
mv release/locales static/

# move player release manifest file to website data
mv release/manifest.yml data/manifest.yml

# move player release JavaScript files to website assets
mv release/*.js static/js/

echo "url: /api/logs" > data/logger.yml
echo "site_id: 100" > data/matomo.yml

hugo --destination build --gc --baseUrl https://mooc-accessibility.inria.fr/

echo "env: prod" > build/prod/version.html
echo "tag: $(git describe --tags)" >> build/prod/version.html
echo "player: v2.2.3" >> build/prod/version.html
```

## Code Status

[![Build Status](https://travis-ci.com/dashdashzako/mooc-accessibility-static.svg?branch=master)](https://travis-ci.com/dashdashzako/mooc-accessibility-static)
