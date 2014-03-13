# Presenter

A simple and minimalist implementation for Presenter pattern.

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
  user.presenter.age          #=> Undefined method 'age' for <UserPresenter#>
```

or,

```
  user = User.new(first_name: 'Bharat', last_name: 'Gupta', age: 24)
  user_presenter = UserPresenter.new(user)

  user_presenter.first_name   #=> Bharat
  user_presenter.last_name    #=> Gupta
  user_presenter.full_name    #=> Gupta, Bharat
  user_presenter.age          #=> Undefined method 'age' for <UserPresenter#>
```

When working with Rails, simply put all the presenters in **app/presenters** and inherit them from the **Presenter::BasePresenter** and you are all setup to use them in your app.

##Todo
* Support for multiple Presenters per class.
* Support for collection objects.
* Support for STI.
* View helpers in presenters.
* Generators for scaffold, etc.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
