# Autobutler Mechanics API Documentation

## Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.2.5 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

## Getting Set Up

1. Clone this repository to your hard drive with `git clone https://github.com/autobutler/mechanics_api_docs.git`
2. `cd mechanics_api_docs`
3. Initialize and start Slate.

```shell
# either run this to run locally
bundle install
bundle exec middleman server
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/lord/slate/wiki/Deploying-Slate).

## Docker alternative

### Prerequisites

- docker
- docker-compose

### Startup
```shell
docker-compose up
```
