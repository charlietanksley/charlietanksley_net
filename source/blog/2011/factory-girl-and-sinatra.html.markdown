---
title: Factory Girl, Sinatra, and Associations
date: 2011/09/02
tags: sinatra, testing
---

I just spent more time than I'd care to admit trying to sort out getting 
Sinatra and Factory Girl to work together for testing purposes, so I 
thought I'd share what I learned here with the hopes that it might make 
life easier for someone else (or me in the future...).

## Basic setup

The setup is straightforward enough.  I should note that I'm using Rspec 
here.  The only thing that was tricky for me was that I needed to 
explicitly require my factories file (you don't have to do this in 
Rails; my guess is that the `factory_girl_rails` plugin takes care of 
this:

    # Gemfile
    gem 'factory_girl', '~> 2.0.0'

    # spec/factories.rb
    ## Factories go here. More on that in a moment

    # spec/spec_helper
    require 'factory_girl'
    require 'factories'
    RSpec.configure do |config|
      # if you want to build(:user) instead of Factory.build(:user)
      config.include Factory::Syntax::Methods
    end

I was used to the behavior in Rails, so it took me longer than I 
would've liked to realize you need to require the factories file.  So 
that is that: setup is pretty easy.

One more thing to note: if you are building a modular Sinatra 
application (that is, if your application inherits from Sinatra::Base), 
then you'll know that your models always referenced at 
AppName::ModelName.  You do this in your factories, too:

    Factory.define :group, :class => MoxieApp::Group do |t|

## Associations

The really tricky part for me was sorting out associations.  Here are my 
basic models, using DataMapper:

    class User
      include DataMapper::Resource

      property :id,         Serial
      property :email,      String
      property :group_id,   Integer

      belongs_to :group
    end

    class Group
      include DataMapper::Resource

      property :id,         Serial
      property :name,       String

      has n, :users
    end

The name of the group a user belongs to is pretty important to my 
application (it determines when some resources are visible).  So for any 
user I'm testing, the group_id needs to match up to an actual group.  So 
it seems important that the User factory I test with belongs to an 
existing group.

If you look around on the googles you'll find a handful of ways to do 
this.  The ThoughtBots people have [a blog post](http://robots.thoughtbot.com/post/254496652/aint-no-calla-back-girl) 
detailing how to do some really complicated has_many associations using 
callbacks.  I played around with this but couldn't figure it out.  Even 
if I could have gotten it to work, it seems way more complicated than I 
  needed.  At various places [in the documentation](https://github.com/thoughtbot/factory_girl/wiki/Usage) 
  you can find this simple example for creating associations:

    FactoryGirl.define :post do
      factory :user do
        name 'User name'
      end

      factory :post do
        name "Post name"
        association :user
      end
    end

The problem with this is that while there is clearly a user associated 
with a post, you aren't using that information in any way.  In my 
experiments, the `user_id` wasn't set via this `association` call.  It 
isn't entirely clear to me what this does.

But there is something here.  I found an old blog post on 
[has_many_through associations and Factory Girl](http://www.snowblink.co.uk/archives/2009/04/24/factory-girl-and-has-many-through) that recommended using the `association` call within a block.  Here's 
what it looks like in practice in my factories:

    Factory.define :group, :class => MoxieApp::Group do |t|
      t.name 'Group'
    end

    Factory.define :user, :class => MoxieApp::User do |t|
      t.sequence(:email) { |n| "email#{n}@factory.com" }
      t.group_id { |a| a.association(:group).id }
    end

Whenever a User is created, a Group is created and its id is used as the 
group_id for my User.  Problem solved.
