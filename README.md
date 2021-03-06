# Welcome to DocBot
Ruby Standard library Slack documentation bot.

![hello](https://cloud.githubusercontent.com/assets/57065/14222235/771916d8-f86e-11e5-80d7-022cd95ee3d1.gif)

---
# Requirements
* Ruby `> 2.3.0`

# Getting Started

Clone the repo and cd into the directory

```
$ git clone https://github.com/RadekMolenda/DocBot.git
$ cd DocBot
$ scrip/setup
```

### MAC OSX requirements
Make sure you have [Homebrew](http://brew.sh/) installed before running the setup script. The setup script will:

1. call `brew update`
2. install [rbenv](https://github.com/rbenv/rbenv) if not installed
3. install ruby 2.3.0 using rbenv if not installed
4. run `bundle install` to install the gems to `vendor/gems` directory

### Linux
Make sure you have [rbenv](https://github.com/rbenv/rbenv) with [ruby build plugin](https://github.com/rbenv/ruby-build) installed and activated in your shell. The setup script will:

1. install ruby 2.3.0 using rbenv if not installed
2. run `bundle install` to install the gems to `vendor/gems` directory

# Usage

### Start the app
Set `SLACK_API_TOKEN` environment variable and run [`script/server`](https://github.com/RadekMolenda/DocBot/blob/master/script/server) to start the app.

```
$ SLACK_API_TOKEN="xxxx-00000000000-AAAAAAAAAAAAAAAAAAAAAAAA" script/server
```

[Create a new bot user](https://my.slack.com/services/new/bot) to generate a new API Token if you need one.

### Go To Slack
**The bot only replies to direct messages** it won't reply on public channels or on @-mentions.

# Testing
Run [`script/test`](https://github.com/RadekMolenda/DocBot/blob/master/script/test)


# Code Status
[![Code Climate](https://codeclimate.com/github/RadekMolenda/DocBot/badges/gpa.svg)](https://codeclimate.com/github/RadekMolenda/DocBot) [![Build Status](https://travis-ci.org/RadekMolenda/DocBot.svg?branch=master)](https://travis-ci.org/RadekMolenda/DocBot)

# Explanation
The app uses [slack-ruby-client](https://github.com/dblock/slack-ruby-client) which seems to be well maintained and clearly written. It also supports concurrency - this is why I had to used `celluloid-io` gem as well. Writing client from scratch seemed to be pointless when there is existing and well documented gem that can be used. [Slack official documentation](https://api.slack.com/community) is also recommending using this gem. I wanted to write this app in Object Oriented manner. I also wanted to make it easy to add another types of responses without changing the code much this is why I introduced Responder class and Responders module.

Personally I'd like to rewrite this app in Elixir in the future as Elixir's out of the box support for multiprocessing and concurrency seems like a perfect tool for real time documentation generation. Can't wait to see the app spawning hundreds of processes with different code documentation generators and picking the best matches.

# Troubleshooting
If you are not getting any meaningful documentation from the bot please check if Ruby the app is using is configured and compiled with ri documentation. Removing ruby 2.3.0 and running `script/setup` should fix this issue.

# License
DocBot is released under the [MIT License](http://www.opensource.org/licenses/MIT).
