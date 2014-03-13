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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
