#### Intro to Rspec Testing

In this tutorial, we will be exploring the basics of RSpec and TDD with the pry gem.

While getting these tests to pass, please make sure you try to do the absolute minimum to get the error or failure to pass. Once that error/failure is passing, move onto the next error/failure until all errors/failures are fixed and all the tests are passing.

#### Instructions.

1. Install Rspec.

  ```Bash
  gem install rspec
  ```

2. git clone this repo by typing this into terminal (assuming you have git commands setup):

  ```Bash
  git clone git@github.com:andela/rspec_testing_tutorial.git
  ```

3. cd into the directory that was cloned.
4. In your terminal, run your spec (test) file by typing:

  ```Bash
  rspec numbers_spec.rb
  ```

5. In terminal, you'll see some errors. Fix failing or erroring out tests. Let's start with the first one.

  We should see this error message:

  ```bash
  require_relative: cannot load such file
  ```

  Let's fix that error by creating the file that the test file is trying to require.

  In the same directory level as numbers_spec.rb, create a file called "numbers.rb" because that is what the line:

  ```Bash
  require_relative "numbers"  
  ```

  requires.

6. Once we create that file, rerun the tests with command:

  ```Bash
  rspec numbers_spec.rb
  ```

  We should see this error:

  ```Bash
  uninitialized constant Numbers (NameError)
  ```

  Let's fix this error by creating a class (which is a constant) called Numbers in the numbers.rb file.

  ```ruby
  class Numbers

  end
  ```

7. Rerun tests and you should see a new error.

  ```Bash
  1) Numbers#new returns back an instance of the Numbers class
     Failure/Error: @numbers = Numbers.new([1,2,3,4,6])
     ArgumentError:
       wrong number of arguments (1 for 0)
     # ./numbers_spec.rb:6:in `initialize'
     # ./numbers_spec.rb:6:in `new'
     # ./numbers_spec.rb:6:in `block (2 levels) in <top (required)>'

  2) Numbers#numbers returns back the array of numbers it was initialized with
     Failure/Error: @numbers = Numbers.new([1,2,3,4,6])
     ArgumentError:
       wrong number of arguments (1 for 0)
     # ./numbers_spec.rb:6:in `initialize'
     # ./numbers_spec.rb:6:in `new'
     # ./numbers_spec.rb:6:in `block (2 levels) in <top (required)>'

  3) Numbers#numbers will sum up the array of numbers
     Failure/Error: @numbers = Numbers.new([1,2,3,4,6])
     ArgumentError:
       wrong number of arguments (1 for 0)
     # ./numbers_spec.rb:6:in `initialize'
     # ./numbers_spec.rb:6:in `new'
     # ./numbers_spec.rb:6:in `block (2 levels) in <top (required)>'
  ```

  Let's look at the first error which is an Argument Error. The top line of the error is where the error actually occurs. It occurs in the initialize method which is called when the new method is called.

  [Initialize method](http://www.google.com/url?q=http%3A%2F%2Fphrogz.net%2Fprogrammingruby%2Ftut_classes.html&sa=D&sntz=1&usg=AFQjCNGXU_h6GCYi_8kPcoga7eaQ8nYl7g)

  So right now, the initialize method is falling because it doesn't take an argument. We're providing it one argument, but it accepts 0. The initialize method is implied right now in the object so let's overwrite it. In our Numbers class, let's type:

  ```ruby
  class Numbers
    def initialize(numbers_array)

    end
  end
  ```

8. Rerun your tests and you should now try to tackle this error:

  ```Bash
  undefined method `numbers' for #<Numbers:0x007fa39d4c9dc8>  
  ```

  So let's create a method called numbers.

  ```ruby
  def numbers

  end  
  ```

9. Rerun your tests and you should now see this error:

  ```Bash
  Failure/Error: expect(@numbers.numbers).to eql([1,2,3,4,6])

       expected: [1, 2, 3, 4, 6]
            got: nil

       (compared using eql?)
  ```

  We have a failure this time, no an error. We expect the array [1,2,3,4,6] that we defined in our test but we actually got back nil. So what do we do?

  We need the method "numbers" to return back the array that we passed into the initialize method. We **cannot** just type in this:

  ```ruby
  def numbers
    numbers_array
  end
  ```

  because if we do and rerun our tests, we'll get this error:

  ```Bash
  Failure/Error: expect(@numbers.numbers).to eql([1,2,3,4,6])
     NameError:
       undefined local variable or method `numbers_array' for #<Numbers:0x007fe4e4253728>
  ```

  Why does this error out? Well, numbers_array inside the numbers method is simply a local variable and it isn't defined inside the method "numbers" anywhere. So to solve this problem, perhaps we could use instance variables.

  [Instance vs local variables](https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/110-instance-variables)

  So, I think we could implement this code instead:

  ```ruby
  class Numbers
    def initialize(numbers_array)
      @numbers_array = numbers_array
    end

    def numbers
      @numbers_array
    end
  end
  ```

  Rerun your tests and you should have only 1 more failing test. Fix it on your own!
