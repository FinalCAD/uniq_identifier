# UniqIdentifier

[![Code Climate](https://codeclimate.com/github/joel/uniq_identifier.png)](https://codeclimate.com/github/joel/uniq_identifier)

[![Dependency Status](https://gemnasium.com/joel/uniq_identifier.png)](https://gemnasium.com/joel/uniq_identifier)

[![Build Status](https://travis-ci.org/joel/uniq_identifier.png?branch=master)](https://travis-ci.org/joel/uniq_identifier) (Travis CI)

[![Coverage Status](https://coveralls.io/repos/joel/uniq_identifier/badge.png)](https://coveralls.io/r/joel/uniq_identifier)

Add an uniq identifier on your models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uniq_identifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uniq_identifier

## Usage

add uuid in your model like that:

  class Foo < ActiveRecord::Base
    uniq_identifier
  end

  foo = Foo.new
  foo.id   # => nil
  foo.uuid # => "0c6bbc03-a269-44e2-8075-f442e1aac0c8"

  foo.create!
  foo.id # => 1

  my_foo = Foo.where(uuid: "0c6bbc03-a269-44e2-8075-f442e1aac0c8")
  my_foo.id # => 1

## Configuration

add app/config/initializers/uniq_identifier.rb

  UniqIdentifier.configuration do |conf|
    conf.generator = SecureRandom
  end

you can use the generator

  rails g uniq_identifier:install
  rails g uniq_identifier:add <model>

for mongoid use

  rails g uniq_identifier:add <model> --orm=mongoid

## Contributing

1. Fork it ( https://github.com/[my-github-username]/uniq_identifier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
