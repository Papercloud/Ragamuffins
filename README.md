Ragamuffins
============

### A simple gem for returning a list of Objects that might be orphaned on a corresponding iOS or Android app.

Ragamuffins takes an array of object ids, and returns a list of the ones that no longer exist in the database.

It was created after we made an iOS app that was having trouble with figuring out wheat existed on the backend and what no longer did. It sounds pretty simple, but when you add pagination to the mix things can get a little tricky. So this aims to solve that.

It has been tested with Ruby `2.0.0`, `2.1.0` and `2.1.1`. Has only made for Rails 4 and up.

Getting Started
===============

Add to your gemfile

`gem 'ragamuffins'`

and then run the ol' `bundle install`

And that's it. That's all the setup you have to do!

Usage
=====

The gem gives you a new class method called `show_deleted_ids` which takes an array of ids as an argument. It will do a quick scan of the model, and let you know what is know longer in the database.

For example:

```
visible_ids = ["1", "3", 5, 63]

YourModel.show_deleted_ids(visible_ids)

=> [1, 63]
```

This makes it easy for your iOS to go through and hide them so they don't give you grief.

Contributing
============

This is still a work in progress. So there is plenty left to do. If you want to contribute, open a pull request and make sure your code is tested.


To Do
=====

* Allow a visibility parameter for objects that might have a visibility boolean attribute.


