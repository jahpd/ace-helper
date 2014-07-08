# Ace::Helper

Ace helper add a ace-editor, as well properly javascript to your
webpage
(Well, since this is 0.0.1 version, it have some dirty things...)

## Installation

Add this line to your application's Gemfile:

    gem 'ace-helper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ace-helper

## Usage

in your helper.rb file use:

    $ require 'ace/helper'

and use in your own functions:

    include Ace::Helper::Builder
    
    def create_ace(src, opt)
      js = ace(src)
      content_tag(:div, js, :id => opt[:id])
    end

in your view files add ace, your mode and theme, as well the code

    <%= javascript_include_tags "ace", "mode-coffee","worker-coffee","theme-monokai" %>
    <%= create_ace "console.log('Hello World!')", :id => "coffee_editor" %>

in your css files add these parameters:

    #coffee_editor{
      position: absolute;
      top: 0%;
      bottom: 0%;
      right: 0%;
      left: 0%;
    }

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ace-helper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
