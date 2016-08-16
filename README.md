# Apps.gov v2
[![Code Climate](https://codeclimate.com/repos/56fedfb4c45607195d0008b8/badges/3e61dcdacc78bf33e91c/gpa.svg)](https://codeclimate.com/repos/56fedfb4c45607195d0008b8/feed)
[![Test Coverage](https://codeclimate.com/repos/56fedfb4c45607195d0008b8/badges/3e61dcdacc78bf33e91c/coverage.svg)](https://codeclimate.com/repos/56fedfb4c45607195d0008b8/coverage)
[![Dependency Status](https://gemnasium.com/badges/github.com/presidential-innovation-fellows/apps-gov-v2.svg)](https://gemnasium.com/github.com/presidential-innovation-fellows/apps-gov-v2)
[![security](https://hakiri.io/github/presidential-innovation-fellows/apps-gov-v2/master.svg)](https://hakiri.io/github/presidential-innovation-fellows/apps-gov-v2/master)
[![Build Status](https://travis-ci.org/presidential-innovation-fellows/apps-gov-v2.svg?branch=master)](https://travis-ci.org/presidential-innovation-fellows/apps-gov-v2)

This is the public repo for apps.gov v2, which is an active marketplace that helps gov employees evaluate and compare cloud-based products. Information on product's description, certifications, and contract vehicles are listed. Additionally, resources for tech companies to list their products and how to get started selling to the federal government can be found.

This repo is open source, maintained by the [Presidential Innovation Fellows](pif.gov). If you have any questions regarding this repo or the content listed, please contact [apps-gov@gsa.gov](mailto:apps-gov@gsa.gov).

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
