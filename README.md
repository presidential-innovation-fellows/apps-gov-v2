# Apps-gov-v2
[![Code Climate](https://codeclimate.com/repos/56fedfb4c45607195d0008b8/badges/3e61dcdacc78bf33e91c/gpa.svg)](https://codeclimate.com/repos/56fedfb4c45607195d0008b8/feed)
[![Dependency Status](https://gemnasium.com/badges/github.com/presidential-innovation-fellows/apps-gov-v2.svg)](https://gemnasium.com/github.com/presidential-innovation-fellows/apps-gov-v2)
[![security](https://hakiri.io/github/presidential-innovation-fellows/apps-gov-v2/master.svg)](https://hakiri.io/github/presidential-innovation-fellows/apps-gov-v2/master)
[![Circle CI](https://circleci.com/gh/presidential-innovation-fellows/apps-gov-v2.svg?style=svg)](https://circleci.com/gh/presidential-innovation-fellows/apps-gov-v2)

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
