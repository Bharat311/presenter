# Presenter

A simple and minimalist implementation for Presenter pattern.

[![GitHub version](https://badge.fury.io/gh/Bharat311%2Fpresenter.png)](http://badge.fury.io/gh/Bharat311%2Fpresenter)

[![Code Climate](https://codeclimate.com/github/Bharat311/presenter.png)](https://codeclimate.com/github/Bharat311/presenter)

## Installation

Add this line to your application's Gemfile:

    gem 'presenter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install presenter

## Usage

If you have a class named User.

```
  class User
    attr_accessor :first_name, :last_name, :age

    def initialize(options = {})
      @first_name = options[:first_name)
      @last_name  = options[:last_name]
      @age        = options[:age]
    end
  end
```

Then you can create a presenter for that class:

```
  class UserPresenter < Presenter::BasePresenter
    presents :user

    delegates :first_name, :last_name # or short :all.

    def full_name
      "#{last_name}, #{first_name}"
    end
  end
```

Now, we have:

```
  user = User.new(first_name: 'Bharat', last_name: 'Gupta', age: 24)

  user.presenter.first_name   #=> Bharat
  user.presenter.last_name    #=> Gupta
  user.presenter.full_name    #=> Gupta, Bharat
  user.presenter.age          #=> Undefined method 'age' for #<UserPresenter:>
  user.presenter.user         #=> returns the user object #<User:>
```

or,

```
  user = User.new(first_name: 'Bharat', last_name: 'Gupta', age: 24)
  user_presenter = UserPresenter.new(user)

  user_presenter.first_name   #=> Bharat
  user_presenter.last_name    #=> Gupta
  user_presenter.full_name    #=> Gupta, Bharat
  user_presenter.age          #=> Undefined method 'age' for #<UserPresenter:>
  user_presenter.user         #=> returns the user object #<User:>
```

## Working With Rails

When working with Rails, simply put all your model presenters in **app/presenters** and inherit them from the **Presenter::BasePresenter** class. Next, you can use them in your views as above.

Also, when using with Rails, Including the 'Presenter::ViewsHelper' module in your presenter class provides you with:

* `helper` method (aliased as 'h')
* `translate` method (aliased as 't')
* `localize` method (aliased as 'l')
* `routes` method (aliased as 'r')

```
  class UserPresenter < Presenter::BasePresenter
    include Presenter::ViewsHelper

    presents :user

    delegates :first_name, :last_name # or short :all.

    def full_name
      "#{t('salutation')} #{last_name}, #{first_name}"         # Using I18n Translation
    end

    def avatar
      h.image_tag(avatar.url)                                  # Using View Helper
    end

    def brief_bio
      h.truncate(biography, length: 50)
      h.link_to t('Read More..'), r.user_path(user)
    end

  end
```

## Multiple Presenters

In cases of defining multiple presenters for a same class, we can specify the presenter we would like to use by passing 'as' along with the presenter name.


say User class has two presenters - AdminPresenter and UserPresenter (:default)

```
  user = User.new(first_name: 'Bharat', last_name: 'Gupta', age: 24)

  user.presenter               #=> #<UserPresenter:>
  user.presenter(as: :admin)   #=> #<AdminPresenter:>
```

**Note** : In case of multiple presenters per class, the presenter that gets loaded last becomes the default presenter.

##Todo

* Support for collection objects.
* Support for STI.
* Generators for scaffold, etc.
* Rspec Coverage.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
