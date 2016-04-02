# DocBot [![Code Climate](https://codeclimate.com/github/RadekMolenda/DocBot/badges/gpa.svg)](https://codeclimate.com/github/RadekMolenda/DocBot) [![Build Status](https://travis-ci.org/RadekMolenda/DocBot.svg?branch=master)](https://travis-ci.org/RadekMolenda/DocBot)

Ruby Standard library Slack documenation bot

![hello](https://cloud.githubusercontent.com/assets/57065/14222235/771916d8-f86e-11e5-80d7-022cd95ee3d1.gif)

---
# Installation

Clone the repo and cd into the directory

```
$ git clone https://github.com/RadekMolenda/DocBot.git
$ cd DocBot
```

### MAC OSX
If you are lucky enough to own Mac - the installation should be as simple as running [script/setup](https://github.com/RadekMolenda/DocBot/blob/master/script/setup). The only requirement is to have [Homebrew](http://brew.sh/) installed before running the setup script. The setup script will:

1. call `brew update`
2. install [rbenv](https://github.com/rbenv/rbenv) if not installed
3. install ruby 2.3.0 using rbenv if not installed
4. run `bundle install` to install the gems to `vendor/gems` directory

### Linux
If you are lucky enough to own machine with Linux system - the installation should be as simple as running [script/setup](https://github.com/RadekMolenda/DocBot/blob/master/script/setup). The only requirement is to have [rbenv](https://github.com/rbenv/rbenv) with [ruby build pluing](https://github.com/rbenv/ruby-build) installed and activated in your shell. The setup script will:

1. install ruby 2.3.0 using rbenv if not installed
2. run `bundle install` to install the gems to `vendor/gems` directory

# Usage

### Start the app
Run [`script/server`](https://github.com/RadekMolenda/DocBot/blob/master/script/server) to start the app. The app expects `SLACK_API_TOKEN` environment variable to exist and will use it for authentication. Example:

```
$ SLACK_API_TOKEN="xxxx-00000000000-AAAAAAAAAAAAAAAAAAAAAAAA" script/server
```

### Go To Slack
Your bot should be ready for conversation now. **The bot only replies to direct messages** it won't reply on public channels or on @-mentions.
# Testing
Run [`script/test`](https://github.com/RadekMolenda/DocBot/blob/master/script/test) to run test suite

Both `script/test` or `script/server` would setup the app if it has not been setup
# Troubleshooting
If you are not getting any meaningful documentation from the bot please check if Ruby the app is using is configured and compiled with ri documentation. Removing ruby 2.3.0 and running `script/setup` should fix this issue.
