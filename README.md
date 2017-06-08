# pano

This Rails engine encapsulates the Javascript, CSS, and Ruby helpers shared across SurveyMonkey Business Solutions applications.

![pano image](https://cloud.githubusercontent.com/assets/5140/23720921/0a679a30-03f5-11e7-86df-4826c02ffcd6.jpg)

## Lay of the Land

This is a Rails engine, initialized by Rails 5.0.2. If you are unfamiliar with engines, you'll notice the layout is very similar to a standard Rails applications. The main difference is that most of the code directories are one level deeper in an `pano` folder. This is how the `Pano` namespace is maintained.

One key difference between a standard Rails application is the `pano.gemspec` file. Rather than use the `Gemfile` to enumerate dependencies, gems must be listed in the gemspec.

## The dummy

Because an Engine is not designed to be run on its own, there is a special 'dummy' application that lives inside the `spec/` directory. This test application loads the engine.

For local development, you'll actually want to mount the test application via pow, rather than the engine. The command would be something like `ln -s /Users/username/dev/pano/spec/test_app/ /Users/username/.pow/pano`. That will load the application at http://pano.dev. Remember! You must run `bundle install` from WITHIN the dummy application.

## Mount Up!

To use this engine, require it as a dependency in another Rails application's [Gemfile](https://github.com/techvalidate/engage/blob/master/Gemfile). When you run `bundle install` within the host application, the Ruby helpers will be locked and the `app/assets` directory in Pano will become part of the lookup chain for Sprockets.

The root of Pano is mounted in the routes file, like so:

```
Rails.application.routes.draw do
  mount Pano::Engine => 'style-guide'
end
```

And the helpers are imported into ApplicationHelper like this:

```
module ApplicationHelper
  include Pano::Engine.helpers
end
```

You are now off to the races. You can reference any helper as you would expect. Assets are in the pipeline (just remember to prepend `pano/`), and modules are referenced like `Pano::Menu`.

## Local development

In the host application, you'll likely want to refer to a local copy of the Engine, rather than the one on GitHub. To do this, instruct Bundler to look on your file system:

```
bundle config local.pano ~/dev/pano
```

You will need to run `bundle update` and `rails restart` (or `rails update`) in the host application to pick up changes. Updating bundle will also set the `Gemfile.lock` to that commit hash, so remember to push up any changes to Pano before deploying the host application.

## Design Assets

https://www.dropbox.com/sh/esapsev12igl95f/AAAtknkC-FekF90KK5Dl2W8ya?dl=0

### TODO: Maintaining versions, what goes in the engine, and the magic of the style guide
