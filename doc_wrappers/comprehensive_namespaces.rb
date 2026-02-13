# Auto-generated comprehensive namespace file
# This file contains all Ruby code organized in proper namespaces for documentation

# DesignPatterns module for organizing designpatterns implementations
module DesignPatterns

  # Behavioral module
  #
  # == Table of Contents
  # - Interpreter
  # - Iterator
  # - Mediator
  # - Memento
  # - NullObject
  # - Observer
  # - State
  # - Strategy
  # - Template
  # - Visitor
  #
  module Behavioral

    # Interpreter - Individual Topic
    # Source: design_patterns/behavioral/interpreter.rb
    # The Interpreter design pattern is a behavioral design pattern that allows you to define a grammar for a simple language, and use it to interpret
    # sentences in that language. It does this by defining a set of syntax rules for the language, and providing an interpreter that can parse and execute
    # the commands in a given sentence.
    #
    # Imagine that you are building a system for a simple calculator that allows users to perform basic mathematical operations. The system has a set
    # of classes that represent the various operations that can be performed (e.g. addition, subtraction, multiplication, and division), and a set of
    # classes that represent the syntax of the language used to perform these operations (e.g. numbers, parentheses, and operators).
    #
    # To implement this scenario using the Interpreter design pattern, you could define an Expression class that represents an expression in the language,
    # and a Context class that holds the context in which the expression is being interpreted. The Expression class has an evaluate method that takes a
    # Context object as an argument and returns the result of the expression.
    #
    # The Expression class represents an expression in the language. It has an
    # evaluate method that takes a Context object as an argument and returns the
    # result of the expression.
    #
    # == Related Topics
    # - Iterator
    # - Mediator
    # - Memento
    # - NullObject
    # - Observer
    # - State
    # - Strategy
    # - Template
    # - Visitor
    #
    class Interpreter

      # === Content from design_patterns/behavioral/interpreter.rb ===

      # The Interpreter design pattern is a behavioral design pattern that allows you to define a grammar for a simple language, and use it to interpret
      # sentences in that language. It does this by defining a set of syntax rules for the language, and providing an interpreter that can parse and execute
      # the commands in a given sentence.
      #
      # Imagine that you are building a system for a simple calculator that allows users to perform basic mathematical operations. The system has a set
      # of classes that represent the various operations that can be performed (e.g. addition, subtraction, multiplication, and division), and a set of
      # classes that represent the syntax of the language used to perform these operations (e.g. numbers, parentheses, and operators).
      #
      # To implement this scenario using the Interpreter design pattern, you could define an Expression class that represents an expression in the language,
      # and a Context class that holds the context in which the expression is being interpreted. The Expression class has an evaluate method that takes a
      # Context object as an argument and returns the result of the expression.

      # The Expression class represents an expression in the language. It has an
      # evaluate method that takes a Context object as an argument and returns the
      # result of the expression.
      class Expression
        def evaluate(context)
          raise NotImplementedError
        end
      end

      # The Number class represents a number in the language. It has an evaluate
      # method that returns the value of the number.
      class Number < Expression
        def initialize(value)
          @value = value
        end

        def evaluate(context)
          @value
        end
      end

      # The Add class represents the addition operation in the language. It has an
      # evaluate method that returns the sum of the values of the left and right
      # expressions.
      class Add < Expression
        def initialize(left, right)
          @left = left
          @right = right
        end

        def evaluate(context)
          @left.evaluate(context) + @right.evaluate(context)
        end
      end

      # The Subtract class represents the subtraction operation in the language. It
      # has an evaluate method that returns the difference between the values of the
      # left and right expressions.
      class Subtract < Expression
        def initialize(left, right)
          @left = left
          @right = right
        end

        def evaluate(context)
          @left.evaluate(context) - @right.evaluate(context)
        end
      end

      # The Multiply class represents the multiplication operation in the language.
      # It has an evaluate method that returns the product of the values of the left
      # and right expressions.
      class Multiply < Expression
        def initialize(left, right)
          @left = left
          @right = right
        end

        def evaluate(context)
          @left.evaluate(context) * @right.evaluate(context)
        end
      end

      # The Divide class represents the division operation in the language. It has an
      # evaluate method that returns the quotient of the values of the left and right
      # expressions.
      class Divide < Expression
        def initialize(left, right)
          @left = left
          @right = right
        end

        def evaluate(context)
          @left.evaluate(context) / @right.evaluate(context)
        end
      end

      # The Context class holds the context in which the expression is being
      # interpreted. It has a stack that stores the values of the expressions as they
      # are evaluated.
      class Context
        def initialize
          @stack = []
        end

        def push(value)
          @stack.push(value)
        end

        def pop
          @stack.pop
        end
      end

      # The client code can create and interpret expressions in the language.
      context = Context.new

      expression = Add.new(Number.new(1), Number.new(2))
      result = expression.evaluate(context)
      puts result # => 3

      expression = Subtract.new(Number.new(5), Number.new(3))
      result = expression.evaluate(context)
      puts result # => 2

      expression = Multiply.new(Number.new(4), Number.new(6))
      result = expression.evaluate(context)
      puts result # => 24

      expression = Divide.new(Number.new(9), Number.new(3))
      result = expression.evaluate(context)
      puts result # => 3

      # In this example, the Expression class represents an expression in the language, and the Context class holds the context in which
      # the expression is being interpreted. The Expression class has an evaluate method that takes a Context object as an argument and
      # returns the result of the expression.
      #
      # The Number, Add, Subtract, Multiply, and Divide classes represent the various elements of the language (e.g. numbers, operators, and parentheses),
      # and have evaluate methods that return the appropriate result for the element.
      #
      # The Context class has a stack that stores the values of the expressions as they are evaluated. This allows the Context class to keep track of the
      # state of the evaluation process, and makes it easier for the client code to work with the system.

    end

    # Iterator - Individual Topic
    # Source: design_patterns/behavioral/iterator.rb
    # The Iterator design pattern is a behavioral design pattern that allows you to access the elements of a collection sequentially without exposing
    # the underlying representation of the collection. It does this by providing an iterator that implements a common interface for traversing the collection,
    # and allowing the client code to use the iterator to access the elements of the collection.
    #
    # Imagine that you are building a system for a library that allows users to browse and check out books. The system has a Library class that represents
    # the library, and a Book class that represents the books in the library. The Library class has a books attribute that stores the books in the
    # library, and a check_out method that allows a user to check out a book.
    #
    # To implement this scenario using the Iterator design pattern, you could define an Iterator class that represents an iterator for the library, and a
    # LibraryIterator class that implements the Iterator interface for the Library class. The LibraryIterator class has a current method that returns
    # the current book in the iteration, a next method that advances the iteration to the next book, and a done method that returns true if the iteration
    # is complete and false if it is not.
    #
    #
    #
    # The Iterator class represents an iterator for a collection. It has a current
    # method that returns the current element in the iteration, a next method that
    # advances the iteration to the next element, and a done method that returns
    # true if the iteration is complete and false if it is not.
    #
    # == Related Topics
    # - Interpreter
    # - Mediator
    # - Memento
    # - NullObject
    # - Observer
    # - State
    # - Strategy
    # - Template
    # - Visitor
    #
    class Iterator

      # === Content from design_patterns/behavioral/iterator.rb ===

      # The Iterator design pattern is a behavioral design pattern that allows you to access the elements of a collection sequentially without exposing
      # the underlying representation of the collection. It does this by providing an iterator that implements a common interface for traversing the collection,
      # and allowing the client code to use the iterator to access the elements of the collection.
      #
      # Imagine that you are building a system for a library that allows users to browse and check out books. The system has a Library class that represents
      # the library, and a Book class that represents the books in the library. The Library class has a books attribute that stores the books in the
      # library, and a check_out method that allows a user to check out a book.
      #
      # To implement this scenario using the Iterator design pattern, you could define an Iterator class that represents an iterator for the library, and a
      # LibraryIterator class that implements the Iterator interface for the Library class. The LibraryIterator class has a current method that returns
      # the current book in the iteration, a next method that advances the iteration to the next book, and a done method that returns true if the iteration
      # is complete and false if it is not.
      #


      # The Iterator class represents an iterator for a collection. It has a current
      # method that returns the current element in the iteration, a next method that
      # advances the iteration to the next element, and a done method that returns
      # true if the iteration is complete and false if it is not.
      class Iterator
        def current
          raise NotImplementedError
        end

        def next
          raise NotImplementedError
        end

        def done
          raise NotImplementedError
        end
      end

      # The LibraryIterator class implements the Iterator interface for the Library
      # class. It has a current method that returns the current book in the iteration,
      # a next method that advances the iteration to the next book, and a done method
      # that returns true if the iteration is complete and false if it is not.
      class LibraryIterator < Iterator
        def initialize(library)
          @library = library
          @index = 0
        end

        def current
          @library.books[@index]
        end

        def next
          @index += 1
        end

        def done
          @index >= @library.books.length
        end
      end

      # The Library class represents a library. It has a books attribute that stores
      # the books in the library, and a check_out method that allows a user to check
      # out a book.
      class Library
        attr_accessor :books

        def initialize
          @books = []
        end

        def check_out(book)
          @books.delete(book)
        end
      end

      # The client code can use the LibraryIterator to browse and check out books in
      # the library.
      library = Library.new
      library.books = [
        'The Alchemist',
        'The Power of Now',
        'The Four Agreements'
      ]

      iterator = LibraryIterator.new(library)
      while !iterator.done
        book = iterator.current
        puts "Checking out book: #{book}"
        library.check_out(book)
        iterator.next
      end

      # Output:
      # Checking out book: The Alchemist
      # Checking out book: The Power of Now
      # Checking out book: The Four Agreements

      # In this example, the Iterator class represents an iterator for a collection, and the LibraryIterator class implements the Iterator interface for
      # the Library class. The LibraryIterator class has a current method that returns the current book in the iteration, a next method that advances the
      # iteration to the next book, and a done method that returns true if the iteration is complete and false if it is not.
      #
      # The Library class represents a library, and has a books attribute that stores the books in the library, and a check_out method that allows a user
      # to check out a book.
      #
      # The client code can use the LibraryIterator to browse and check out books in the library by creating a new LibraryIterator object and passing it
      # the library object, and then using a while loop to iterate through the books in the library. Inside the loop, the client code can use the current
      # method to get the current book in the iteration, and the check_out method to check out the book. The next method is called at the end of the loop
      # to advance the iteration to the next book. The loop terminates when the done method returns true.

    end

    # Mediator - Individual Topic
    # Source: design_patterns/behavioral/mediator.rb
    # The Mediator design pattern is a behavioral design pattern that allows you to define an object that encapsulates how a set of objects
    # interact. It does this by providing a mediator object that coordinates communication between the objects, and allowing the client code to work
    # with the mediator rather than the objects themselves.
    #
    # Imagine that you are building a chat system that allows users to send messages to each other. The system has a User class that represents a user,
    # and a Chatroom class that represents a chat room. The User class has a send_message method that allows a user to send a message to another user,
    # and a receive_message method that allows a user to receive a message from another user.
    #
    # To implement this scenario using the Mediator design pattern, you could define a Mediator class that represents a mediator for the chat system,
    # and a ChatroomMediator class that implements the Mediator interface for the Chatroom class. The ChatroomMediator class has a send_message method
    # that allows a user to send a message to another user, and a receive_message method that allows a user to receive a message from another user.
    #
    # The Mediator class represents a mediator for a set of objects. It has a
    # send_message method that allows an object to send a message to another object,
    # and a receive_message method that allows an object to receive a message from
    # another object.
    #
    # == Related Topics
    # - Interpreter
    # - Iterator
    # - Memento
    # - NullObject
    # - Observer
    # - State
    # - Strategy
    # - Template
    # - Visitor
    #
    class Mediator

      # === Content from design_patterns/behavioral/mediator.rb ===

      # The Mediator design pattern is a behavioral design pattern that allows you to define an object that encapsulates how a set of objects
      # interact. It does this by providing a mediator object that coordinates communication between the objects, and allowing the client code to work
      # with the mediator rather than the objects themselves.
      #
      # Imagine that you are building a chat system that allows users to send messages to each other. The system has a User class that represents a user,
      # and a Chatroom class that represents a chat room. The User class has a send_message method that allows a user to send a message to another user,
      # and a receive_message method that allows a user to receive a message from another user.
      #
      # To implement this scenario using the Mediator design pattern, you could define a Mediator class that represents a mediator for the chat system,
      # and a ChatroomMediator class that implements the Mediator interface for the Chatroom class. The ChatroomMediator class has a send_message method
      # that allows a user to send a message to another user, and a receive_message method that allows a user to receive a message from another user.

      # The Mediator class represents a mediator for a set of objects. It has a
      # send_message method that allows an object to send a message to another object,
      # and a receive_message method that allows an object to receive a message from
      # another object.
      class Mediator
        def send_message(sender, receiver, message)
          raise NotImplementedError
        end

        def receive_message(sender, receiver, message)
          raise NotImplementedError
        end
      end

      # The ChatroomMediator class implements the Mediator interface for the Chatroom
      # class. It has a send_message method that allows a user to send a message to
      # another user, and a receive_message method that allows a user to receive a
      # message from another user.
      class ChatroomMediator < Mediator
        def send_message(sender, receiver, message)
          puts "#{sender.name} sends a message to #{receiver.name}: #{message}"
          receiver.receive_message(sender, receiver, message)
        end

        def receive_message(sender, receiver, message)
          puts "#{receiver.name} receives a message from #{sender.name}: #{message}"
        end
      end

      # The User class represents a user. It has a name attribute that stores the
      # user's name, a send_message method that allows the user to send a message to
      # another user, and a receive_message method that allows the user to receive a
      # message from another user.
      class User
        attr_accessor :name

        def initialize(name)
          @name = name
        end

        def send_message(receiver, message)
          @mediator.send_message(self, receiver, message)
        end

        def receive_message(sender, message)
          puts "#{@name} receives a message from #{sender.name}: #{message}"
        end
      end

      # The Chatroom class represents a chat room. It has a mediator attribute that
      # stores the chat room's mediator, and a users attribute that stores the users
      # in the chat room.
      class Chatroom
        attr_accessor :mediator, :users

        def initialize
          @users = []
        end

        def join(user)
          puts "#{user.name} joins the chat room"
          user.mediator = @mediator
          @users << user
        end
      end

      # The client code can use the Chatroom and User classes to send messages to
      # each other through the ChatroomMediator.
      chatroom = Chatroom.new
      chatroom.mediator = ChatroomMediator.new

      alice = User.new('Alice')
      bob = User.new('Bob')
      charlie = User.new('Charlie')

      chatroom.join(alice)
      chatroom.join(bob)
      chatroom.join(charlie)

      alice.send_message(bob, 'Hello, Bob!')
      bob.send_message(charlie, 'Hey, Charlie!')
      charlie.send_message(alice, 'Hi, Alice!')

      # Output:
      # Alice joins the chat room
      # Bob joins the chat room
      # Charlie joins the chat room
      # Alice sends a message to Bob: Hello, Bob!
      # Bob receives a message from Alice: Hello, Bob!
      # Bob sends a message to Charlie: Hey, Charlie!
      # Charlie receives a message from Bob: Hey, Charlie!
      # Charlie sends a message to Alice: Hi, Alice!
      # Alice receives a message from Charlie: Hi, Alice!

      # In this example, the Mediator class represents a mediator for a set of objects, and the ChatroomMediator class implements the Mediator
      # interface for the Chatroom class. The ChatroomMediator class has a send_message method that allows a user to send a message to another user,
      # and a receive_message method that allows a user to receive a message from another user.
      #
      # The User class represents a user, and has a name attribute that stores the user's name, a send_message method that allows the user to send
      # a message to another user, and a receive_message method that allows the user to receive a message from another user.
      #
      # The Chatroom class represents a chat room, and has a mediator attribute that stores the chat room's mediator, and a users attribute that
      # stores the users in the chat room. It has a join method that allows a user to join the chat room, and sets the user's mediator attribute
      # to the chat room's mediator.

      # In this example, the Mediator design pattern allows us to define an object (the ChatroomMediator) that encapsulates how a set of objects
      # (the User objects) interact. It does this by providing a mediator object that coordinates communication between the objects, and allowing
      # the client code to work with the mediator rather than the objects themselves.
      #
      #   The ChatroomMediator class has a send_message method that allows a user to send a message to another user, and a receive_message method
      # that allows a user to receive a message from another user. These methods are called by the send_message and receive_message methods of the
      # User class, respectively. This allows the User objects to communicate with each other through the ChatroomMediator, rather than directly with
      # each other.
      #
      #     The Mediator design pattern is useful when you want to decouple a set of objects from each other, and allow them to interact in a loosely
      # coupled way. It can help to reduce the complexity of the client code, and make it easier to maintain and extend.

    end

    # Memento - Individual Topic
    # Source: design_patterns/behavioral/memento.rb
    # The Memento design pattern is a behavioral design pattern that allows you to save and restore the state of an object without violating its
    # encapsulation. It is often used to implement undo and redo functionality in applications.
    #
    #   Here's a summary of the Memento pattern:
    #
    # The Memento pattern allows you to save and restore the state of an object without violating its encapsulation.
    # It is often used to implement undo and redo functionality in applications.
    # The Memento pattern consists of three types of objects: the originator, the memento, and the caretaker.
    # The originator is the object whose state needs to be saved and restored. It creates a memento object that contains a snapshot of its current state, and provides methods to set and get the state from the memento.
    # The memento is an object that stores the state of the originator. It is an immutable object that stores the state of the originator in a manner that the originator can restore its previous state, but cannot modify the memento.
    # The caretaker is an object that is responsible for managing the mementos. It stores the mementos and provides methods to create and retrieve them.
    #
    # Imagine you are using a text editor to write a report for work. As you work on the report, you make changes to the text and save them. However,
    # you later realize that you made a mistake and want to go back to a previous version of the report.
    #
    # To do this, you could use the Memento design pattern to save the text of the report at different points in time, and then restore the text to
    # a previous version if needed.
    #
    #
    # The TextEditor class represents a text editor. It has a text attribute that
    # stores the current text, and a save and restore method that allow the text
    # to be saved and restored.
    #
    # == Related Topics
    # - Interpreter
    # - Iterator
    # - Mediator
    # - NullObject
    # - Observer
    # - State
    # - Strategy
    # - Template
    # - Visitor
    #
    class Memento

      # === Content from design_patterns/behavioral/memento.rb ===

      # The Memento design pattern is a behavioral design pattern that allows you to save and restore the state of an object without violating its
      # encapsulation. It is often used to implement undo and redo functionality in applications.
      #
      #   Here's a summary of the Memento pattern:
      #
      # The Memento pattern allows you to save and restore the state of an object without violating its encapsulation.
      # It is often used to implement undo and redo functionality in applications.
      # The Memento pattern consists of three types of objects: the originator, the memento, and the caretaker.
      # The originator is the object whose state needs to be saved and restored. It creates a memento object that contains a snapshot of its current state, and provides methods to set and get the state from the memento.
      # The memento is an object that stores the state of the originator. It is an immutable object that stores the state of the originator in a manner that the originator can restore its previous state, but cannot modify the memento.
      # The caretaker is an object that is responsible for managing the mementos. It stores the mementos and provides methods to create and retrieve them.

      # Imagine you are using a text editor to write a report for work. As you work on the report, you make changes to the text and save them. However,
      # you later realize that you made a mistake and want to go back to a previous version of the report.
      #
      # To do this, you could use the Memento design pattern to save the text of the report at different points in time, and then restore the text to
      # a previous version if needed.
      #

      # The TextEditor class represents a text editor. It has a text attribute that
      # stores the current text, and a save and restore method that allow the text
      # to be saved and restored.
      class TextEditor
        attr_accessor :text

        def initialize
          @text = ''
        end

        def save
          TextEditorMemento.new(@text)
        end

        def restore(memento)
          @text = memento.text
        end
      end

      # The TextEditorMemento class represents a memento for the TextEditor class. It
      # has a text attribute that stores the text.
      class TextEditorMemento
        attr_reader :text

        def initialize(text)
          @text = text
        end
      end

      # The client code can use the TextEditor and TextEditorMemento classes to save
      # and restore the text in the text editor.
      text_editor = TextEditor.new
      text_editor.text = 'Hello, world!'

      memento = text_editor.save

      text_editor.text = 'Goodbye, world!'

      text_editor.restore(memento)
      puts text_editor.text

      # Output:
      # Hello, world!

      # In this example, the TextEditor class represents a text editor, and has a text attribute that stores the current text, and a save method that
      # creates and returns a new TextEditorMemento object with the current text, and a restore method that restores the text from a given
      # TextEditorMemento object.
      #
      # The TextEditorMemento class represents a memento for the TextEditor class, and has a text attribute that stores the text.
      #
      # The client code can use the TextEditor and TextEditorMemento classes to save and restore the text in the text editor by creating a new
      # TextEditor object and setting its text attribute to a string, creating a memento using the save method, changing the text attribute, and then
      # restoring the text using the restore method with the memento.

      # In this example, the Memento design pattern allows us to create a snapshot of the text editor's state, and restore the text editor to a previous
      # state by using the memento. This can be useful when we want to allow the user to undo and redo actions in the text editor, or to provide a way to
      # roll back to a previous state if an error occurs.

    end

    # NullObject - Individual Topic
    # Source: design_patterns/behavioral/null_object.rb
    # The Null Object design pattern is a behavioral design pattern that allows you to provide a default object as a substitute for a missing object.
    # It is often used to handle null values in applications, and can help to reduce conditional statements and improve code readability.
    #
    # Here's a summary of the Null Object pattern:
    #
    # The Null Object pattern allows you to provide a default object as a substitute for a missing object.
    # It is often used to handle null values in applications, and can help to reduce conditional statements and improve code readability.
    # The Null Object pattern consists of a base class and one or more derived classes.
    # The base class defines the interface for the object, and the derived classes implement the interface with different behavior.
    # The base class also includes a null object class that provides a default implementation of the interface.
    # Here's an example of the Null Object design pattern in Ruby for a customer service scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building a customer service application that allows customers to request assistance from a customer service representative.
    # The application allows customers to choose a specific representative to help them, or to choose a default representative if no specific
    # representative is available.
    #
    # To implement this functionality, you could use the Null Object design pattern to provide a default customer service representative as a substitute
    # for a missing representative.
    # The CustomerServiceRepresentative class represents a customer service
    # representative. It has a name attribute that stores the name of the
    # representative, and a help method that provides assistance to the customer.
    #
    # == Related Topics
    # - Interpreter
    # - Iterator
    # - Mediator
    # - Memento
    # - Observer
    # - State
    # - Strategy
    # - Template
    # - Visitor
    #
    class NullObject

      # === Content from design_patterns/behavioral/null_object.rb ===

      # The Null Object design pattern is a behavioral design pattern that allows you to provide a default object as a substitute for a missing object.
      # It is often used to handle null values in applications, and can help to reduce conditional statements and improve code readability.
      #
      # Here's a summary of the Null Object pattern:
      #
      # The Null Object pattern allows you to provide a default object as a substitute for a missing object.
      # It is often used to handle null values in applications, and can help to reduce conditional statements and improve code readability.
      # The Null Object pattern consists of a base class and one or more derived classes.
      # The base class defines the interface for the object, and the derived classes implement the interface with different behavior.
      # The base class also includes a null object class that provides a default implementation of the interface.
      # Here's an example of the Null Object design pattern in Ruby for a customer service scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building a customer service application that allows customers to request assistance from a customer service representative.
      # The application allows customers to choose a specific representative to help them, or to choose a default representative if no specific
      # representative is available.
      #
      # To implement this functionality, you could use the Null Object design pattern to provide a default customer service representative as a substitute
      # for a missing representative.
      # The CustomerServiceRepresentative class represents a customer service
      # representative. It has a name attribute that stores the name of the
      # representative, and a help method that provides assistance to the customer.
      class CustomerServiceRepresentative
        attr_reader :name

        def initialize(name)
          @name = name
        end

        def help
          puts "Hello, my name is #{name} and I am here to help you."
        end
      end

      # The NullCustomerServiceRepresentative class represents a null customer service
      # representative. It has a name attribute that stores the name of the
      # representative, and a help method that does nothing.
      class NullCustomerServiceRepresentative < CustomerServiceRepresentative
        def help
        end
      end

      # The CustomerService class represents a customer service. It has a
      # representative attribute that stores the customer service representative, and a
      # request_assistance method that allows the customer to request assistance from
      # the representative.
      class CustomerService
        attr_accessor :representative

        def request_assistance
          representative.help
        end
      end

      # The client code can use the CustomerService, CustomerServiceRepresentative, and
      # NullCustomerServiceRepresentative classes to request assistance from a customer
      # service representative.
      customer_service = CustomerService.new

      customer_service.representative = CustomerServiceRepresentative.new('Alice')
      customer_service.request_assistance

      # Output:
      # Hello, my name is Alice and I am here to help you.

      customer_service.representative = NullCustomerServiceRepresentative.new('Bob')
      customer_service.request_assistance

      # Output:
      # (nothing)


      # the CustomerServiceRepresentative class represents a customer service representative, and has a name attribute that stores the name of the
      # representative, and a help method that provides assistance
      #
      # the NullCustomerServiceRepresentative class represents a null customer service representative, and has a name attribute that stores the name of
      # the representative, and a help method that does nothing. This allows the CustomerService class to use the NullCustomerServiceRepresentative as a
      # default object when no specific representative is available, without having to use conditional statements to check for a missing representative.
      #
      # The Null Object design pattern is a useful pattern for handling null values in applications, and can help to reduce conditional statements and
      # improve code readability. It is particularly useful when working with objects that may not always be present, such as optional dependencies or
      # external resources.

    end

    # Observer - Individual Topic
    # Source: design_patterns/behavioral/observer.rb
    # The Observer design pattern is a behavioral design pattern that allows objects to subscribe to and receive notifications from other objects.
    # It is often used to implement event-driven systems, where objects can publish events and other objects can subscribe to and receive notifications
    # of those events.
    #
    #   Here's a summary of the Observer pattern:
    #
    # The Observer pattern allows objects to subscribe to and receive notifications from other objects.
    # It is often used to implement event-driven systems, where objects can publish events and other objects can subscribe to and receive notifications
    # of those events.
    # The Observer pattern consists of a subject class and observer classes.
    # The subject class maintains a list of observer objects, and provides methods to subscribe and unsubscribe observers.
    # The observer classes implement a notification method that is called by the subject when an event occurs.
    #
    # Here's an example of the Observer design pattern in Ruby for a social media scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building a social media application where users can follow other users, and receive notifications when the users they are
    # following post new updates.
    #
    # To implement this feature, you could use the Observer design pattern to allow users to subscribe to and receive notifications from other users.
    #
    # The User class represents a user in the social media application. It has a
    # name attribute that stores the user's name, and a posts attribute that stores
    # the user's posts. It has a post method that allows the user to create a new
    # post, and a notify_followers method that notifies the user's followers of the
    # new post.
    # The User class represents a user in the social media application. It has a
    # name attribute that stores the user's name, and a posts attribute that stores
    # the user's posts. It has a post method that allows the user to create a new
    # post, and a notify_followers method that notifies the user's followers of the
    # new post.
    #
    # == Related Topics
    # - Interpreter
    # - Iterator
    # - Mediator
    # - Memento
    # - NullObject
    # - State
    # - Strategy
    # - Template
    # - Visitor
    #
    class Observer

      # === Content from design_patterns/behavioral/observer.rb ===

      # The Observer design pattern is a behavioral design pattern that allows objects to subscribe to and receive notifications from other objects.
      # It is often used to implement event-driven systems, where objects can publish events and other objects can subscribe to and receive notifications
      # of those events.
      #
      #   Here's a summary of the Observer pattern:
      #
      # The Observer pattern allows objects to subscribe to and receive notifications from other objects.
      # It is often used to implement event-driven systems, where objects can publish events and other objects can subscribe to and receive notifications
      # of those events.
      # The Observer pattern consists of a subject class and observer classes.
      # The subject class maintains a list of observer objects, and provides methods to subscribe and unsubscribe observers.
      # The observer classes implement a notification method that is called by the subject when an event occurs.
      #
      # Here's an example of the Observer design pattern in Ruby for a social media scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building a social media application where users can follow other users, and receive notifications when the users they are
      # following post new updates.
      #
      # To implement this feature, you could use the Observer design pattern to allow users to subscribe to and receive notifications from other users.
      #
      # The User class represents a user in the social media application. It has a
      # name attribute that stores the user's name, and a posts attribute that stores
      # the user's posts. It has a post method that allows the user to create a new
      # post, and a notify_followers method that notifies the user's followers of the
      # new post.
      # The User class represents a user in the social media application. It has a
      # name attribute that stores the user's name, and a posts attribute that stores
      # the user's posts. It has a post method that allows the user to create a new
      # post, and a notify_followers method that notifies the user's followers of the
      # new post.
      class User
        attr_reader :name, :posts
        attr_accessor :observers

        def initialize(name)
          @name = name
          @posts = []
          @observers = []
        end

        def post(post)
          @posts << post
          notify_followers
        end

        def subscribe(observer)
          @observers << observer
        end

        def unsubscribe(observer)
          @observers.delete(observer)
        end

        def notify_followers
          @observers.each do |observer|
            observer.update(self, @posts.last)
          end
        end
      end

      # The UserObserver class represents an observer of a user. It has an update
      # method that is called by the user when an event occurs.
      class UserObserver
        def update(user, post)
          puts "Received update from #{user.name}: #{post}"
        end
      end

      # The client code can use the User and UserObserver classes to subscribe
      # observers to users, and receive updates from those users.
      user1 = User.new('Alice')
      user2 = User.new('Bob')

      observer = UserObserver.new

      user1.subscribe(observer)

      user1.post('Hello, world!')
      # Output:
      # Received update from Alice: Hello, world!

      user1.unsubscribe(observer)

      user1.post('Hi, how are you?')

      user2.subscribe(observer)

      user2.post('Hey, what"s up?')
      # Output:
      # Received update from Bob: Hey, what's up?

      user2.unsubscribe(observer)

      user2.post('Nothing much, just hanging out.')

      user1.subscribe(observer)

      user1.post('I am fine, thank you.')
      # Output:
      # Received update from Alice: I am fine, thank you.


      #
      # In this example, the User class represents a user in the social media application, and the UserObserver class represents an observer of a user.
      # The User class has a subscribe and unsubscribe method that allows observers to subscribe and unsubscribe from the user, and a notify_followers
      # method that notifies the user's followers of new posts. The UserObserver class has an update method that is called by the user when a new post
      # is made.
      #
      # Using the Observer design pattern in this way allows the social media application to notify subscribers of new posts made by the users they are
      # following. This can improve the user experience of the application by allowing users to receive updates in real-time, rather than having to
      # constantly refresh the page to check for new content.

    end

    # State - Individual Topic
    # Source: design_patterns/behavioral/state.rb
    # The State design pattern is a behavioral design pattern that allows objects to change their behavior based on their internal state.
    # It is often used to encapsulate complex state-dependent behavior, and to provide a clean interface to that behavior.
    #
    #   Here's a summary of the State pattern:
    #
    # The State design pattern allows objects to change their behavior based on their internal state.
    # It is often used to encapsulate complex state-dependent behavior, and to provide a clean interface to that behavior.
    # The State pattern consists of a state interface and concrete state classes that implement the behavior for each state.
    # The state interface defines the behavior that can be performed in each state, and the concrete state classes implement that behavior.
    # The context class holds a reference to the current state and delegates behavior to the current state.
    # The context class can change its state by setting a new current state.
    #
    # Here's an example of the State design pattern in Ruby for an order processing scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building an e-commerce application that processes orders. An order can be in one of several states: pending, processing, shipped,
    # or delivered. The behavior of an order changes depending on its state, for example, a pending order can be cancelled, but a delivered order
    # cannot.
    #
    # To implement this feature, you could use the State design pattern to create an Order class with an internal state that determines its behavior.
    # The Order class has an update_state method that changes its state, and several methods that perform different actions depending on the current
    # state of the order.
    # The OrderState interface defines the behavior that can be performed in each
    # state of an Order.
    #
    #
    # The OrderState interface defines the behavior that can be performed in each
    # state of an Order.
    #
    # == Related Topics
    # - Interpreter
    # - Iterator
    # - Mediator
    # - Memento
    # - NullObject
    # - Observer
    # - Strategy
    # - Template
    # - Visitor
    #
    class State

      # === Content from design_patterns/behavioral/state.rb ===

      # The State design pattern is a behavioral design pattern that allows objects to change their behavior based on their internal state.
      # It is often used to encapsulate complex state-dependent behavior, and to provide a clean interface to that behavior.
      #
      #   Here's a summary of the State pattern:
      #
      # The State design pattern allows objects to change their behavior based on their internal state.
      # It is often used to encapsulate complex state-dependent behavior, and to provide a clean interface to that behavior.
      # The State pattern consists of a state interface and concrete state classes that implement the behavior for each state.
      # The state interface defines the behavior that can be performed in each state, and the concrete state classes implement that behavior.
      # The context class holds a reference to the current state and delegates behavior to the current state.
      # The context class can change its state by setting a new current state.
      #
      # Here's an example of the State design pattern in Ruby for an order processing scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building an e-commerce application that processes orders. An order can be in one of several states: pending, processing, shipped,
      # or delivered. The behavior of an order changes depending on its state, for example, a pending order can be cancelled, but a delivered order
      # cannot.
      #
      # To implement this feature, you could use the State design pattern to create an Order class with an internal state that determines its behavior.
      # The Order class has an update_state method that changes its state, and several methods that perform different actions depending on the current
      # state of the order.
      # The OrderState interface defines the behavior that can be performed in each
      # state of an Order.


      # The OrderState interface defines the behavior that can be performed in each
      # state of an Order.
      class OrderState
        def cancel
          raise NotImplementedError
        end

        def process
          raise NotImplementedError
        end

        def ship
          raise NotImplementedError
        end

        def deliver
          raise NotImplementedError
        end
      end

      # The PendingOrderState class represents the pending state of an Order.
      # It implements the behavior for a pending order.
      class PendingOrderState < OrderState
        def cancel
          puts 'Cancelling order'
        end

        def process
          puts 'Processing order'
        end
      end

      # The ProcessingOrderState class represents the processing state of an Order.
      # It implements the behavior for a processing order.
      class ProcessingOrderState < OrderState
        def ship
          puts 'Shipping order'
        end
      end

      # The ShippedOrderState class represents the shipped state of an Order.
      # It implements the behavior for a shipped order.
      class ShippedOrderState < OrderState
        def deliver
          puts 'Delivering order'
        end
      end

      # The DeliveredOrderState class represents the delivered state of an Order.
      # It implements the behavior for a delivered order.
      class DeliveredOrderState < OrderState
        def cancel
          puts 'Cannot cancel delivered order'
        end

        def process
          puts 'Cannot process delivered order'
        end

        def ship
          puts 'Cannot ship delivered order'
        end
      end

      # The Order class holds a reference to the current state of the order, and
      # delegates behavior to the current state.
      class Order
        attr_reader :state

        def initialize
          @state = PendingOrderState.new
        end

        def update_state(state)
          @state = state
        end

        def cancel
          @state.cancel
        end

        def process
          @state.process
        end

        def ship
          @state.ship
        end

        def deliver
          @state.deliver
        end
      end

      # The client code can use the Order class to process orders, and the order's
      # behavior will change depending on its state.
      order = Order.new

      order.cancel
      # Output: Cancelling order

      order.process
      # Output: Processing order

      order.ship
      # Output: Shipping order

      order.deliver
      # Output: Delivering order

      order.update_state(DeliveredOrderState.new)

      order.cancel
      # Output: Cannot cancel delivered order

      order.cancel
      # Output: Cancelling order

      order.process
      # Output: Processing order

      order.ship
      # Output: Shipping order

      order.deliver
      # Output: Delivering order


      # In this example, the Order class has an internal state that determines its behavior. The Order class has an update_state method that changes its
      # state, and several methods that perform different actions depending on the current state of the order. The Order class holds a reference to the
      # current state of the order, and delegates behavior to the current state.
      #
      #   The client code can use the Order class to process orders, and the order's behavior will change depending on its state. For example, an order
      # in the pending state can be cancelled and processed, but an order in the delivered state cannot.

    end

    # Strategy - Individual Topic
    # Source: design_patterns/behavioral/strategy.rb
    # The Strategy design pattern is a behavioral design pattern that allows objects to change their behavior at runtime by changing their strategy.
    # It is often used to encapsulate a family of algorithms, and to provide a clean interface to those algorithms.
    #
    #   Here's a summary of the Strategy pattern:
    #
    # The Strategy design pattern allows objects to change their behavior at runtime by changing their strategy.
    # It is often used to encapsulate a family of algorithms, and to provide a clean interface to those algorithms.
    # The Strategy pattern consists of a strategy interface and concrete strategy classes that implement the behavior for each strategy.
    # The strategy interface defines the behavior that can be performed by each strategy, and the concrete strategy classes implement that behavior.
    # The context class holds a reference to the current strategy and delegates behavior to the current strategy.
    # The context class can change its strategy by setting a new current strategy.
    # Here's an example of the Strategy design pattern in Ruby for a simple sorting scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building a simple application that can sort a list of numbers. There are several ways to sort a list of numbers, such as
    # bubble sort, quick sort, and merge sort. You want to allow the user to choose the sorting algorithm they want to use.
    #
    # To implement this feature, you could use the Strategy design pattern to create a Sorter class with an internal strategy that determines its
    # behavior. The Sorter class has a sort method that performs the sorting algorithm specified by the current strategy.
    #
    #
    # The SortingStrategy interface defines the behavior that can be performed by
    # each sorting strategy.
    #
    # == Related Topics
    # - Interpreter
    # - Iterator
    # - Mediator
    # - Memento
    # - NullObject
    # - Observer
    # - State
    # - Template
    # - Visitor
    #
    class Strategy

      # === Content from design_patterns/behavioral/strategy.rb ===

      # The Strategy design pattern is a behavioral design pattern that allows objects to change their behavior at runtime by changing their strategy.
      # It is often used to encapsulate a family of algorithms, and to provide a clean interface to those algorithms.
      #
      #   Here's a summary of the Strategy pattern:
      #
      # The Strategy design pattern allows objects to change their behavior at runtime by changing their strategy.
      # It is often used to encapsulate a family of algorithms, and to provide a clean interface to those algorithms.
      # The Strategy pattern consists of a strategy interface and concrete strategy classes that implement the behavior for each strategy.
      # The strategy interface defines the behavior that can be performed by each strategy, and the concrete strategy classes implement that behavior.
      # The context class holds a reference to the current strategy and delegates behavior to the current strategy.
      # The context class can change its strategy by setting a new current strategy.
      # Here's an example of the Strategy design pattern in Ruby for a simple sorting scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building a simple application that can sort a list of numbers. There are several ways to sort a list of numbers, such as
      # bubble sort, quick sort, and merge sort. You want to allow the user to choose the sorting algorithm they want to use.
      #
      # To implement this feature, you could use the Strategy design pattern to create a Sorter class with an internal strategy that determines its
      # behavior. The Sorter class has a sort method that performs the sorting algorithm specified by the current strategy.
      #

      # The SortingStrategy interface defines the behavior that can be performed by
      # each sorting strategy.
      class SortingStrategy
        def sort(numbers)
          raise NotImplementedError
        end
      end

      # The BubbleSortStrategy class represents the bubble sort strategy.
      # It implements the behavior for bubble sort.
      class BubbleSortStrategy < SortingStrategy
        def sort(numbers)
          puts 'Sorting using bubble sort'
        end
      end

      # The QuickSortStrategy class represents the quick sort strategy.
      # It implements the behavior for quick sort.
      class QuickSortStrategy < SortingStrategy
        def sort(numbers)
          puts 'Sorting using quick sort'
        end
      end

      # The MergeSortStrategy class represents the merge sort strategy.
      # It implements the behavior for merge sort.
      class MergeSortStrategy < SortingStrategy
        def sort(numbers)
          puts 'Sorting using merge sort'
        end
      end

      # The Sorter class holds a reference to the current sorting strategy, and
      # delegates sorting to the current strategy.
      class Sorter
        attr_reader :strategy

        def initialize(strategy)
          @strategy = strategy
        end

        def sort(numbers)
          @strategy.sort(numbers)
        end
      end

      # The client code can use the Sorter class to sort lists of numbers, and the
      # sorter's behavior will change depending on its strategy.
      sorter = Sorter.new(BubbleSortStrategy.new)
      sorter.sort([5, 3, 8, 1, 2, 4, 7, 6])
      # Output: Sorting using bubble sort

      sorter.strategy = QuickSortStrategy.new
      sorter.sort([5, 3, 8, 1, 2, 4, 7, 6])
      # Output: Sorting using quick sort

      sorter.strategy = MergeSortStrategy.new
      sorter.sort([5, 3, 8, 1, 2, 4, 7, 6])
      # Output: Sorting using merge sort

      # In this example, the Sorter class has an internal strategy that determines its behavior. The Sorter class has a sort method that performs
      # the sorting algorithm specified by the current strategy.
      #
      # The client code can use the Sorter class to sort lists of numbers, and the sorter's behavior will change depending on its strategy. The client
      # code can change the sorter's strategy by setting a new current strategy.

    end

    # Template - Individual Topic
    # Source: design_patterns/behavioral/template.rb
    # The Template design pattern is a behavioral design pattern that defines the skeleton of an algorithm in an operation, but lets
    # subclasses override specific steps of the algorithm without changing its structure. It is often used to implement a standard interface for
    # a group of related algorithms, and to allow users to select the appropriate algorithm at runtime.
    #
    # Here's a summary of the Template pattern:
    #
    # The Template pattern consists of an abstract base class that defines the structure of the algorithm, and concrete subclasses that override
    # specific steps of the algorithm.
    # The abstract base class defines the template_method which represents the skeleton of the algorithm, and the concrete subclasses override
    # specific steps of the algorithm defined in the template_method.
    #
    # Here's an example of the Template design pattern in Ruby for a simple coffee brewing scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building a simple coffee brewing application that can brew different types of coffee, such as espresso, cappuccino,
    # and latte. The process of brewing coffee is similar for each type of coffee, but there are some specific steps that are different
    # for each type of coffee.
    #
    # To implement this feature, you could use the Template design pattern to create an AbstractCoffeeBrewer class with a brew_coffee method
    # that defines the skeleton of the coffee brewing algorithm. The AbstractCoffeeBrewer class also has abstract methods that represent specific
    # steps of the coffee brewing algorithm that can be overridden by concrete subclasses.
    #
    # The AbstractCoffeeBrewer class defines the structure of the coffee brewing
    # algorithm, and provides abstract methods that represent specific steps of the
    # algorithm that can be overridden by concrete subclasses.
    #
    # == Related Topics
    # - Interpreter
    # - Iterator
    # - Mediator
    # - Memento
    # - NullObject
    # - Observer
    # - State
    # - Strategy
    # - Visitor
    #
    class Template

      # === Content from design_patterns/behavioral/template.rb ===

      # The Template design pattern is a behavioral design pattern that defines the skeleton of an algorithm in an operation, but lets
      # subclasses override specific steps of the algorithm without changing its structure. It is often used to implement a standard interface for
      # a group of related algorithms, and to allow users to select the appropriate algorithm at runtime.
      #
      # Here's a summary of the Template pattern:
      #
      # The Template pattern consists of an abstract base class that defines the structure of the algorithm, and concrete subclasses that override
      # specific steps of the algorithm.
      # The abstract base class defines the template_method which represents the skeleton of the algorithm, and the concrete subclasses override
      # specific steps of the algorithm defined in the template_method.
      #
      # Here's an example of the Template design pattern in Ruby for a simple coffee brewing scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building a simple coffee brewing application that can brew different types of coffee, such as espresso, cappuccino,
      # and latte. The process of brewing coffee is similar for each type of coffee, but there are some specific steps that are different
      # for each type of coffee.
      #
      # To implement this feature, you could use the Template design pattern to create an AbstractCoffeeBrewer class with a brew_coffee method
      # that defines the skeleton of the coffee brewing algorithm. The AbstractCoffeeBrewer class also has abstract methods that represent specific
      # steps of the coffee brewing algorithm that can be overridden by concrete subclasses.

      # The AbstractCoffeeBrewer class defines the structure of the coffee brewing
      # algorithm, and provides abstract methods that represent specific steps of the
      # algorithm that can be overridden by concrete subclasses.
      class AbstractCoffeeBrewer
        def brew_coffee
          grind_coffee_beans
          heat_water
          pour_water
          add_coffee_to_cup
          add_milk_and_sugar
        end

        def grind_coffee_beans
          raise NotImplementedError
        end

        def heat_water
          raise NotImplementedError
        end

        def pour_water
          raise NotImplementedError
        end

        def add_coffee_to_cup
          raise NotImplementedError
        end

        def add_milk_and_sugar
          raise NotImplementedError
        end
      end

      # The EspressoCoffeeBrewer class represents the espresso coffee brewer, and
      # overrides specific steps of the coffee brewing algorithm defined in the
      # AbstractCoffeeBrewer class.
      class EspressoCoffeeBrewer < AbstractCoffeeBrewer
        def grind_coffee_beans
          puts "Grinding espresso beans"
        end

        def heat_water
          puts "Heating water for espresso"
        end

        def pour_water
          puts "Pouring hot water over espresso beans"
        end

        def add_coffee_to_cup
          puts "Adding espresso to cup"
        end

        def add_milk_and_sugar
          puts "No milk or sugar needed for espresso"
        end
      end

      # The CappuccinoCoffeeBrewer class represents the cappuccino coffee brewer, and
      # overrides specific steps of the coffee brewing algorithm defined in the
      # AbstractCoffeeBrewer class.
      class CappuccinoCoffeeBrewer < AbstractCoffeeBrewer
        def grind_coffee_beans
          puts "Grinding cappuccino beans"
        end

        def heat_water
          puts "Heating water for cappuccino"
        end

        def pour_water
          puts "Pouring hot water over cappuccino beans"
        end

        def add_coffee_to_cup
          puts "Adding cappuccino to cup"
        end

        def add_milk_and_sugar
          puts "Adding milk and sugar to cappuccino"
        end
      end

      # The LatteCoffeeBrewer class represents the latte coffee brewer, and overrides
      # specific steps of the coffee brewing algorithm defined in the
      # AbstractCoffeeBrewer class.
      class LatteCoffeeBrewer < AbstractCoffeeBrewer
        def grind_coffee_beans
          puts "Grinding latte beans"
        end

        def heat_water
          puts "Heating water for latte"
        end

        def pour_water
          puts "Pouring hot water over latte beans"
        end

        def add_coffee_to_cup
          puts "Adding latte to cup"
        end

        def add_milk_and_sugar
          puts "Adding milk and sugar to latte"
        end
      end

      # The client code can use the AbstractCoffeeBrewer class to brew different
      # types of coffee, and the coffee brewer's behavior will change depending on
      # its concrete subclass.
      coffee_brewer = EspressoCoffeeBrewer.new
      coffee_brewer.brew_coffee
      # Output:
      # Grinding espresso beans
      # Heating water for espresso
      # Pouring hot water over espresso beans
      # Adding espresso to cup
      # No milk or sugar needed for espresso

      coffee_brewer = CappuccinoCoffeeBrewer.new
      coffee_brewer.brew_coffee
      # Output:
      # Grinding cappuccino beans
      # Heating water for cappuccino
      # Pouring hot water over cappuccino beans
      # Adding cappuccino to cup
      # Adding milk and sugar to cappuccino

      coffee_brewer = Latte
      coffee_brewer = LatteCoffeeBrewer.new
      coffee_brewer.brew_coffee
      # Output:
      # Grinding latte beans
      # Heating water for latte
      # Pouring hot water over latte beans
      # Adding latte to cup
      # Adding milk and sugar to latte

      # In this example, the AbstractCoffeeBrewer class defines the structure of the coffee brewing algorithm in the brew_coffee method,
      # and provides abstract methods that represent specific steps of the algorithm that can be overridden by concrete subclasses. The
      # EspressoCoffeeBrewer, CappuccinoCoffeeBrewer, and LatteCoffeeBrewer classes are concrete subclasses of the AbstractCoffeeBrewer class
      # that override specific steps of the coffee brewing algorithm defined in the AbstractCoffeeBrewer class.
      #
      # The client code can use the AbstractCoffeeBrewer class to brew different types of coffee, and the coffee brewer's behavior will change
      # depending on its concrete subclass. When the client code calls the brew_coffee method on an instance of the EspressoCoffeeBrewer class,
      # it will execute the coffee brewing algorithm defined in the brew_coffee method, but with the specific steps of the algorithm defined in the
      # EspressoCoffeeBrewer class.
      #
      # In summary, the Template design pattern defines the skeleton of an algorithm in an operation, but lets subclasses override specific steps
      # of the algorithm without changing its structure. It is often used to implement a standard interface for a group of related algorithms,
      # and to allow users to select the appropriate algorithm at runtime.

    end

    # Visitor - Individual Topic
    # Source: design_patterns/behavioral/visitor.rb
    # The Visitor design pattern allows you to define a new operation on an object structure without changing the classes of the objects in the structure.
    # It separates the algorithm that operates on the elements of an object structure from the object structure itself.
    #
    # The elements in the object structure are called "concrete elements", and they define an accept operation that takes a visitor as an argument.
    # The visitor is an object that defines a set of visiting methods, each of which corresponds to a concrete element class. The accept operation
    # directs a call to the appropriate visiting method in the visitor object.
    #
    # The object structure is a composite of concrete elements, and it iterates over its elements and calls their accept operations with the visitor object.
    # Real-world example:
    #
    # Imagine you are a customer at a grocery store and you have a shopping list with you. You go to different aisles and pick up items from your
    # list one by one. Once you are done shopping, you go to the cashier and the cashier adds up the price of all the items and gives you the total
    # amount to pay.
    #
    # In this example, you are the visitor, the shopping list is the element, and the grocery store is the object structure. The aisles represent
    # the concrete elements, and the cashier represents the concrete visitor.
    #
    # The Element interface declares accept method, which should take a visitor as
    # an argument.
    #
    # == Related Topics
    # - Interpreter
    # - Iterator
    # - Mediator
    # - Memento
    # - NullObject
    # - Observer
    # - State
    # - Strategy
    # - Template
    #
    class Visitor

      # === Content from design_patterns/behavioral/visitor.rb ===

      # The Visitor design pattern allows you to define a new operation on an object structure without changing the classes of the objects in the structure.
      # It separates the algorithm that operates on the elements of an object structure from the object structure itself.
      #
      # The elements in the object structure are called "concrete elements", and they define an accept operation that takes a visitor as an argument.
      # The visitor is an object that defines a set of visiting methods, each of which corresponds to a concrete element class. The accept operation
      # directs a call to the appropriate visiting method in the visitor object.
      #
      # The object structure is a composite of concrete elements, and it iterates over its elements and calls their accept operations with the visitor object.
      # Real-world example:
      #
      # Imagine you are a customer at a grocery store and you have a shopping list with you. You go to different aisles and pick up items from your
      # list one by one. Once you are done shopping, you go to the cashier and the cashier adds up the price of all the items and gives you the total
      # amount to pay.
      #
      # In this example, you are the visitor, the shopping list is the element, and the grocery store is the object structure. The aisles represent
      # the concrete elements, and the cashier represents the concrete visitor.
      #
      # The Element interface declares accept method, which should take a visitor as
      # an argument.
      class Element
        def accept(_visitor)
          raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
        end
      end

      # Concrete Elements implement accept method in such a way that it calls the
      # visitor's visit method and passes itself as an argument.
      class ConcreteElementA < Element
        # @param [Visitor] visitor
        def accept(visitor)
          visitor.visit_concrete_element_a(self)
        end

        # ConcreteElementA-specific method
        def operation_a
          puts "ConcreteElementA.operation_a"
        end
      end

      class ConcreteElementB < Element
        # @param [Visitor] visitor
        def accept(visitor)
          visitor.visit_concrete_element_b(self)
        end

        # ConcreteElementB-specific method
        def operation_b
          puts "ConcreteElementB.operation_b"
        end
      end

      # The Visitor interface declares a set of visiting methods that correspond to
      # component classes. The signature of a visiting method allows the visitor to
      # identify the exact class of the component that it's dealing with.
      class Visitor
        def visit_concrete_element_a(_element)
          raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
        end

        def visit_concrete_element_b(_element)
          raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
        end
      end

      # Concrete Visitors implement several versions of the same algorithm, which can
      # work with all concrete component classes.
      #
      # You can experience the biggest benefit of the Visitor pattern when using it
      # with a complex object structure, such as an object
      # The client code can run visitor operations over any set of elements without
      # figuring out their concrete classes. The accept operation directs a call to
      # the appropriate operation in the visitor object.
      def client_code(elements, visitor)
        elements.each { |e| e.accept(visitor) }
      end

      # Object structure can enumerate its elements, and "accept" each of them.
      def object_structure
        [ConcreteElementA.new, ConcreteElementB.new]
      end

      # The client code can create a visitor and pass it to the object structure,
      # which will call back the visitor's visit methods as it enumerates its elements.
      # Depending on the visitor's type, the right version of visit operation will be
      # called.
      visitor1 = ConcreteVisitor1.new
      visitor2 = ConcreteVisitor2.new

      client_code(object_structure, visitor1)
      client_code(object_structure, visitor2)

      # Output:
      # ConcreteVisitor1.visit_concrete_element_a
      # ConcreteElementA.operation_a
      # ConcreteVisitor1.visit_concrete_element_b
      # ConcreteElementB.operation_b
      # ConcreteVisitor2.visit_concrete_element_a
      # ConcreteElementA.operation_a
      # ConcreteVisitor2.visit_concrete_element_b
      # ConcreteElementB.operation_b

      # In this example, the object structure is a composite of concrete elements, and it iterates over its elements and calls their accept
      # operations with the visitor objects. The concrete elements define the accept operation in such a way that it calls the visitor's visit
      # method and passes itself as an argument. The visitor is an object that defines a set of visiting methods, each of which corresponds to
      # a concrete element class.
      #
      # The client code can run visitor operations over any set of elements without figuring out their concrete classes. The accept operation
      # directs a call to the appropriate operation in the visitor object. Depending on the visitor's type, the right version of the visit operation
      # will be called.
      #
      # In this example, the client code creates two visitor objects and passes them to the object structure, which will call back the visitor's
      # visit methods as it enumerates its elements.
      #
      # The Visitor design pattern is useful when you need to perform an operation on the elements of an object structure, but the elements have
      # different types and you don't want to clutter their code with operations that are specific to the visitor. It's also useful when you need
      # to perform operations on the elements of an object structure, but you don't want to change the elements' classes.

    end

  end

  # Creational module
  #
  # == Table of Contents
  # - AbstractFactory
  # - Builder
  # - ChainOfResponsibility
  # - Command
  # - FactoryMethod
  # - ObjectPool
  # - PrivateClassData
  # - Singleton
  # - Structure
  #
  module Creational

    # AbstractFactory - Individual Topic
    # Source: design_patterns/creational/abstract_factory.rb
    # The Abstract Factory design pattern is a creational design pattern that provides an interface for
    # creating families of related or dependent objects without specifying their concrete classes. The Abstract
    # Factory design pattern is often used to implement the Factory Method design pattern, which allows you to
    # create objects without specifying their concrete classes.
    #
    # Imagine that you are building a system for a car factory that produces different models of cars
    # (e.g. hatchbacks, sedans, and SUVs). The car factory has a set of machines for assembling the different parts of
    # the cars, and you want to be able to add support for new models of cars without changing the existing machines.
    #
    # To implement this scenario using the Abstract Factory design pattern, you could define an Assembler interface that
    # declares an assemble method, and concrete implementations of the Assembler interface for each type of car
    # (e.g. HatchbackAssembler, SedanAssembler, and SUVAssembler). You could also define an AbstractCarFactory class that
    # has an assemble method that takes an Assembler object and returns a car.
    #
    # The AbstractCarFactory class would have a reference to an Assembler object, and its assemble method would delegate
    # to the assemble method on the Assembler object. This allows you to add support for new models of cars by creating a
    # new concrete implementation of the Assembler interface, without changing the existing machines in the AbstractCarFactory class.
    # The Assembler interface declares the assemble method.
    #
    # == Related Topics
    # - Builder
    # - ChainOfResponsibility
    # - Command
    # - FactoryMethod
    # - ObjectPool
    # - PrivateClassData
    # - Singleton
    # - Structure
    #
    class AbstractFactory

      # === Content from design_patterns/creational/abstract_factory.rb ===

      # The Abstract Factory design pattern is a creational design pattern that provides an interface for
      # creating families of related or dependent objects without specifying their concrete classes. The Abstract
      # Factory design pattern is often used to implement the Factory Method design pattern, which allows you to
      # create objects without specifying their concrete classes.
      #
      # Imagine that you are building a system for a car factory that produces different models of cars
      # (e.g. hatchbacks, sedans, and SUVs). The car factory has a set of machines for assembling the different parts of
      # the cars, and you want to be able to add support for new models of cars without changing the existing machines.
      #
      # To implement this scenario using the Abstract Factory design pattern, you could define an Assembler interface that
      # declares an assemble method, and concrete implementations of the Assembler interface for each type of car
      # (e.g. HatchbackAssembler, SedanAssembler, and SUVAssembler). You could also define an AbstractCarFactory class that
      # has an assemble method that takes an Assembler object and returns a car.
      #
      # The AbstractCarFactory class would have a reference to an Assembler object, and its assemble method would delegate
      # to the assemble method on the Assembler object. This allows you to add support for new models of cars by creating a
      # new concrete implementation of the Assembler interface, without changing the existing machines in the AbstractCarFactory class.
      # The Assembler interface declares the assemble method.
      class Assembler
        def assemble
          raise NotImplementedError, "You must implement #{self.class}##{__method__}"
        end
      end

      # Concrete implementations of the Assembler interface assemble a specific
      # type of car.
      class HatchbackAssembler < Assembler
        def assemble
          puts 'Assembling hatchback'
        end
      end

      class SedanAssembler < Assembler
        def assemble
          puts 'Assembling sedan'
        end
      end

      class SUVAssembler < Assembler
        def assemble
          puts 'Assembling SUV'
        end
      end

      # The AbstractCarFactory class has an assemble method that takes an
      # Assembler object and returns a car. It has a reference to an Assembler
      # object and its assemble method delegates to the assemble method on the
      # Assembler object.
      class AbstractCarFactory
        def initialize(assembler)
          @assembler = assembler
        end

        def assemble
          @assembler.assemble
        end
      end

      # The client code can work with any concrete implementation of the
      # AbstractCarFactory class and any concrete implementation of the Assembler
      # interface, allowing it to assemble different types of cars without having
      # to know the details of how each type of car is assembled.
      hatchback_assembler = HatchbackAssembler.new
      hatchback_factory = AbstractCarFactory.new(hatchback_assembler)
      hatchback_factory.assemble

      sedan_assembler = SedanAssembler.new
      sedan_factory = AbstractCarFactory.new(sedan_assembler)
      sedan_factory.assemble

      suv_assembler = SUVAssembler.new
      suv_factory = AbstractCarFactory.new(suv_assembler)
      suv_factory.assemble

      # In this example, the Assembler interface declares the assemble method, and the HatchbackAssembler, SedanAssembler, and
      # SUVAssembler classes are concrete implementations of the Assembler interface that assemble a specific type of car.
      #
      #   The AbstractCarFactory class has an assemble method that takes an Assembler object and returns a car. It has a
      # reference to an Assembler object and its assemble method delegates to the assemble method on the Assembler object.
      # This allows you to add support for new models of cars by creating a new concrete implementation of the Assembler interface,
      # without changing the existing machines in the AbstractCarFactory class.
      #
      #     This allows the client code to work with any concrete implementation of the AbstractCarFactory class and any
      # concrete implementation of the Assembler interface, allowing it to assemble different types of cars without having
      # to know the details of how each type of car is assembled.
      #
      #       This example demonstrates how the Abstract Factory design pattern can provide an interface for creating families of
      # related or dependent objects without specifying their concrete classes, and how it can be used to implement the Factory
      # Method design pattern, which allows you to create objects without specifying their concrete classes.

    end

    # Builder - Individual Topic
    # Source: design_patterns/creational/builder.rb
    # The Builder design pattern is a creational design pattern that allows you to create complex objects step by step.
    # It separates the construction of an object from its representation, so that the same construction process can create different representations.
    #
    # This pattern is used by fast food restaurants to construct children's
    # meals. Children's meals typically consist of a main item, a side item, a
    # drink, and a toy (e.g., a hamburger, fries, Coke, and toy dinosaur). Note
    # that there can be variation in the content of the children's meal, but the
    # construction process is the same.
    #
    # Whether a customer orders a hamburger, cheeseburger, or chicken,
    # the process is the same. The employee at the counter directs the crew to
    # assemble a main item, side item, and toy. These items are then placed in
    # a bag. The drink is placed in a cup and remains outside of the bag. This
    # same process is used at competing restaurants.
    #
    # Customer = Client
    # Cashier = Director
    # Restaurant Crew = Builder
    # Product = Order kid's meal
    # Get meal = start the step
    #
    # The Product class represents the complex object that is being built.
    #
    # == Related Topics
    # - AbstractFactory
    # - ChainOfResponsibility
    # - Command
    # - FactoryMethod
    # - ObjectPool
    # - PrivateClassData
    # - Singleton
    # - Structure
    #
    class Builder

      # === Content from design_patterns/creational/builder.rb ===

      # The Builder design pattern is a creational design pattern that allows you to create complex objects step by step.
      # It separates the construction of an object from its representation, so that the same construction process can create different representations.

      # This pattern is used by fast food restaurants to construct children's
      # meals. Children's meals typically consist of a main item, a side item, a
      # drink, and a toy (e.g., a hamburger, fries, Coke, and toy dinosaur). Note
      # that there can be variation in the content of the children's meal, but the
      # construction process is the same.
      #
      # Whether a customer orders a hamburger, cheeseburger, or chicken,
      # the process is the same. The employee at the counter directs the crew to
      # assemble a main item, side item, and toy. These items are then placed in
      # a bag. The drink is placed in a cup and remains outside of the bag. This
      # same process is used at competing restaurants.

      # Customer = Client
      # Cashier = Director
      # Restaurant Crew = Builder
      # Product = Order kid's meal
      # Get meal = start the step

      # The Product class represents the complex object that is being built.
      class Product
        attr_accessor :parts

        def initialize
          @parts = []
        end

        def add_part(part)
          @parts << part
        end
      end

      # The Builder interface specifies methods for creating the different parts of
      # the Product objects.
      class Builder
        def produce_part_a
          raise NotImplementedError, 'Builder#produce_part_a() must be defined'
        end

        def produce_part_b
          raise NotImplementedError, 'Builder#produce_part_b() must be defined'
        end

        def produce_part_c
          raise NotImplementedError, 'Builder#produce_part_c() must be defined'
        end
      end

      # The Concrete Builders provide different implementations of the Builder
      # interface.
      class ConcreteBuilder1 < Builder
        def initialize
          reset
        end

        def reset
          @product = Product.new
        end

        # Concrete Builders are supposed to provide their own methods for
        # retrieving results. That's because various types of builders may
        # create entirely different products that don't follow the same
        # interface. Therefore, such methods cannot be declared in the base
        # Builder interface (at least in a statically typed programming
        # language).
        #
        # Usually, after returning the end result to the client, a builder
        # instance is expected to be ready to start producing another product.
        # That's why it's a usual practice to call the reset method at the end
        # of the `getProduct` method body. However, this behavior is not
        # mandatory, and you can make your builders wait for an explicit reset
        # call from the client code before disposing of the previous result.
        def get_product
          product = @product
          reset
          product
        end

        def produce_part_a
          @product.add_part('PartA1')
        end

        def produce_part_b
          @product.add_part('PartB1')
        end

        def produce_part_c
          @product.add_part('PartC1')
        end
      end

      class ConcreteBuilder2 < Builder
        def initialize
          reset
        end

        def reset
          @product = Product.new
        end

        def get_product
          product = @product
          reset
          product
        end

        def produce_part_a
          @product.add_part('PartA2')
        end

        def produce_part_b
          @product.add_part('PartB2')
        end

        def produce_part_c
          @product.add_part('PartC2')
        end
      end

      # The Director is only responsible for executing the building steps in a
      # particular sequence. It is helpful when producing products according to a
      # specific order or configuration. Strictly speaking, the Director class is
      # optional, since the client can control builders directly.
      class Director
        attr_accessor :builder

        def build_minimal_viable_product
          @builder.produce_part_a
        end

        def build_full_featured_product
          @builder.produce_part_a
          @builder.produce_part_b
          @builder.produce_part_c
        end
      end

      # The client code creates the director object, configures it with the desired
      # builder object, and then runs the build process. The end result is
      # retrieved from the builder object.
      director = Director.new
      director.builder = ConcreteBuilder1.new
      puts 'Standard basic product: '
      director.build_minimal_viable_product
      builder = director.builder
      product = builder.get_product
      puts product.parts
      puts "\n"

      director.builder = ConcreteBuilder2.new
      puts 'Standard full featured product: '
      director.build_full_featured_product
      builder = director.builder
      product = builder.get_product
      puts product.parts
      puts "\n"

      director.builder = ConcreteBuilder1.new
      puts 'Custom product: '
      director.build_minimal_viable_product
      director.builder.produce_part_b
      director.builder.produce_part_c
      builder = director.builder
      product = builder.get_product
      puts product.parts

      # In this example, the Product class represents the complex object that is being built, and the Builder interface specifies methods for creating the different parts of the Product objects. The ConcreteBuilder1 and ConcreteBuilder2 classes provide different implementations of the Builder interface.

      # The Director class is responsible for executing the building steps in a particular sequence, and is helpful when producing products according to a specific order or configuration. The client code creates the Director object, configures it with the desired Builder object, and then runs the build process. The end result is retrieved from the Builder object.

    end

    # ChainOfResponsibility - Individual Topic
    # Source: design_patterns/creational/chain_of_responsibility.rb
    # Imagine that a customer service center has a chain of employees that handle customer complaints.
    # The chain starts with front-line customer service representatives, who handle simple complaints and issues.
    # If a customer service representative is unable to resolve a complaint or issue, they can escalate it to a team leader.
    # If the team leader is unable to resolve the complaint or issue, they can escalate it to a manager.
    # If the manager is unable to resolve the complaint or issue, they can escalate it to a director.
    #
    #To implement this scenario using the Chain of Responsibility design pattern, the customer service center could define a
    # ComplaintHandler class that represents a handler in the chain, and concrete implementations of the ComplaintHandler class
    # for each level in the chain (e.g. CustomerServiceRepresentative, TeamLeader, Manager, Director).
    # Each handler would have the ability to handle complaints and issues that they are responsible for,
    # and to escalate complaints and issues to their successor if they are unable to handle them.
    #
    # The customer service center could then create a chain of ComplaintHandler objects, starting with a front-line
    # customer service representative and ending with a director. When a customer submits a complaint or issue,
    # it would be passed down the chain of handlers until it is handled by one of the handlers or reach the end of the chain
    # if it is not handled.
    # The base ComplaintHandler class declares an interface for handling complaints
    # and includes a set of default behavior for forwarding complaints to its
    # successor.
    #
    # == Related Topics
    # - AbstractFactory
    # - Builder
    # - Command
    # - FactoryMethod
    # - ObjectPool
    # - PrivateClassData
    # - Singleton
    # - Structure
    #
    class ChainOfResponsibility

      # === Content from design_patterns/creational/chain_of_responsibility.rb ===

      # Imagine that a customer service center has a chain of employees that handle customer complaints.
      # The chain starts with front-line customer service representatives, who handle simple complaints and issues.
      # If a customer service representative is unable to resolve a complaint or issue, they can escalate it to a team leader.
      # If the team leader is unable to resolve the complaint or issue, they can escalate it to a manager.
      # If the manager is unable to resolve the complaint or issue, they can escalate it to a director.
      #
      #To implement this scenario using the Chain of Responsibility design pattern, the customer service center could define a
      # ComplaintHandler class that represents a handler in the chain, and concrete implementations of the ComplaintHandler class
      # for each level in the chain (e.g. CustomerServiceRepresentative, TeamLeader, Manager, Director).
      # Each handler would have the ability to handle complaints and issues that they are responsible for,
      # and to escalate complaints and issues to their successor if they are unable to handle them.
      #
      # The customer service center could then create a chain of ComplaintHandler objects, starting with a front-line
      # customer service representative and ending with a director. When a customer submits a complaint or issue,
      # it would be passed down the chain of handlers until it is handled by one of the handlers or reach the end of the chain
      # if it is not handled.
      # The base ComplaintHandler class declares an interface for handling complaints
      # and includes a set of default behavior for forwarding complaints to its
      # successor.
      class ComplaintHandler
        attr_reader :successor

        def initialize(successor = nil)
          @successor = successor
        end

        def handle_complaint(complaint)
          if successor
            successor.handle_complaint(complaint)
          else
            puts 'End of chain reached. Complaint not handled.'
          end
        end
      end

      # Concrete ComplaintHandlers handle complaints they are responsible for.
      class CustomerServiceRepresentative < ComplaintHandler
        def handle_complaint(complaint)
          if complaint == 'simple'
            puts 'Customer service representative can handle this complaint'
          else
            super(complaint)
          end
        end
      end

      class TeamLeader < ComplaintHandler
        def handle_complaint(complaint)
          if complaint == 'intermediate'
            puts 'Team leader can handle this complaint'
          else
            super(complaint)
          end
        end
      end

      class Manager < ComplaintHandler
        def handle_complaint(complaint)
          if complaint == 'complex'
            puts 'Manager can handle this complaint'
          else
            super(complaint)
          end
        end
      end

      class Director < ComplaintHandler
        def handle_complaint(complaint)
          if complaint == 'critical'
            puts 'Director can handle this complaint'
          else
            super(complaint)
          end
        end
      end

      # The customer service center creates a chain of complaint handlers, starting
      # with a front-line customer service representative and ending with a director.
      csr = CustomerServiceRepresentative.new
      tl = TeamLeader.new(csr)
      manager = Manager.new(tl)
      director = Director.new(manager)

      # When a customer submits a complaint, it is passed down the chain of handlers
      # until it is handled by one of the handlers or reach the end of the chain if
      # it is not handled.
      director.handle_complaint('simple')
      director.handle_complaint('intermediate')
      director.handle_complaint('complex')
      director.handle_complaint('critical')
      director.handle_complaint('unhandled')


      # In this example, the ComplaintHandler class declares an interface for handling complaints and includes default behavior for forwarding complaints to its successor. The CustomerServiceRepresentative, TeamLeader, Manager, and Director classes are concrete implementations of the ComplaintHandler class that handle complaints they are responsible for.
      #
      #   The customer service center creates a chain of ComplaintHandler objects, starting with a front-line customer service representative and ending with a director. When a customer submits a complaint, it is passed down the chain of handlers until it is handled by one of the handlers or reach the end of the chain if it is not handled.

    end

    # Command - Individual Topic
    # Source: design_patterns/creational/command.rb
    # Imagine that you are building a system for a remote-controlled toy car. The toy car has a set of commands that it
    # can understand, such as "move forward," "move backward," "turn left," and "turn right." To control the toy car,
    # you can send it a command from a remote control.
    #
    #   To implement this scenario using the Command design pattern, you could define a Command class that represents a
    # command that the toy car can understand, and concrete implementations of the Command class for each type of
    # command (e.g. MoveForwardCommand, MoveBackwardCommand, TurnLeftCommand, TurnRightCommand). Each command would have a
    # method for executing the corresponding action on the toy car.
    #
    #   You could also define a RemoteControl class that represents the remote control and has a method for sending a
    # command to the toy car. The RemoteControl class would have a send_command method that accepts a Command object and calls
    # its execute method.
    #
    # The base Command class declares an interface for executing a command.
    #
    # == Related Topics
    # - AbstractFactory
    # - Builder
    # - ChainOfResponsibility
    # - FactoryMethod
    # - ObjectPool
    # - PrivateClassData
    # - Singleton
    # - Structure
    #
    class Command

      # === Content from design_patterns/creational/command.rb ===

      # Imagine that you are building a system for a remote-controlled toy car. The toy car has a set of commands that it
      # can understand, such as "move forward," "move backward," "turn left," and "turn right." To control the toy car,
      # you can send it a command from a remote control.
      #
      #   To implement this scenario using the Command design pattern, you could define a Command class that represents a
      # command that the toy car can understand, and concrete implementations of the Command class for each type of
      # command (e.g. MoveForwardCommand, MoveBackwardCommand, TurnLeftCommand, TurnRightCommand). Each command would have a
      # method for executing the corresponding action on the toy car.
      #
      #   You could also define a RemoteControl class that represents the remote control and has a method for sending a
      # command to the toy car. The RemoteControl class would have a send_command method that accepts a Command object and calls
      # its execute method.

      # The base Command class declares an interface for executing a command.
      class Command
        def execute
          raise NotImplementedError, "You must implement #{self.class}##{__method__}"
        end
      end

      # Concrete Commands implement the execute method by calling the corresponding
      # method on the Receiver.
      class MoveForwardCommand < Command
        def initialize(receiver)
          @receiver = receiver
        end

        def execute
          @receiver.move_forward
        end
      end

      class MoveBackwardCommand < Command
        def initialize(receiver)
          @receiver = receiver
        end

        def execute
          @receiver.move_backward
        end
      end

      class TurnLeftCommand < Command
        def initialize(receiver)
          @receiver = receiver
        end

        def execute
          @receiver.turn_left
        end
      end

      class TurnRightCommand < Command
        def initialize(receiver)
          @receiver = receiver
        end

        def execute
          @receiver.turn_right
        end
      end

      # The Receiver class knows how to perform the operations associated with
      # carrying out a request. It has methods for each type of command.
      class ToyCar
        def move_forward
          puts 'Toy car: Moving forward'
        end

        def move_backward
          puts 'Toy car: Moving backward'
        end

        def turn_left
          puts 'Toy car: Turning left'
        end

        def turn_right
          puts 'Toy car: Turning right'
        end
      end

      # The RemoteControl class asks the command to carry out the request.
      class RemoteControl
        def send_command(command)
          command.execute
        end
      end

      # The client code creates a Receiver, creates Command objects, and sets their
      # Receiver.
      toy_car = ToyCar.new
      move_forward_command = MoveForwardCommand.new(toy_car)
      move_backward_command = MoveBackwardCommand.new(toy_car)
      turn_left_command = TurnLeftCommand.new(toy_car)
      turn_right_command = TurnRightCommand.new(toy_car)

      # The client code creates a RemoteControl, sets a Command, and asks the
      # RemoteControl to execute the command.
      remote_control = RemoteControl.new
      remote_control.send_command(move_forward_command)
      remote_control.send_command(turn_left_command)
      remote_control.send_command(move_backward_command)
      remote_control.send_command(turn_right_command)

      # In this example, the Command class declares an interface for executing a command, and the MoveForwardCommand,
      # MoveBackwardCommand, TurnLeftCommand, and TurnRightCommand classes are concrete implementations of the Command class
      # that execute the corresponding action on the ToyCar receiver. The ToyCar class knows how to perform the operations
      # associated with carrying out a request, and has methods for each type of command. The RemoteControl class asks the
      # command to carry out the request by calling its execute method.
      #
      # The client code creates a ToyCar object, creates Command objects and sets their receiver to the ToyCar object,
      # creates a RemoteControl object, sets a Command object, and asks the RemoteControl to execute the command. When
      # the send_command method is called on the RemoteControl object, it passes the request to the Command object, which
      # then calls the corresponding method on the ToyCar receiver.



    end

    # FactoryMethod - Individual Topic
    # Source: design_patterns/creational/factory_method.rb
    # The Factory Method design pattern is a creational design pattern that defines an interface for creating an object,
    # but allows subclasses to alter the type of objects that will be created. The Factory Method design pattern is
    # often used to create objects in a super class, but allow subclasses to alter the type of objects that will be created.
    #
    # Imagine that you are building a system for a pet store that allows customers to purchase different types of pets.
    # The system has a set of classes that represent the various types of pets that are available (e.g. dogs, cats, and birds),
    # and a set of classes that represent the various ways that pets can be purchased (e.g. in-person, online, and via phone).
    #
    # To implement this scenario using the Factory Method design pattern, you could define an Animal class that represents a pet,
    # and a PetStore class that represents the store. The Animal class has an abstract speak method, and the PetStore class has
    # an abstract purchase_pet method, which is the factory method. The PetStore class also has concrete implementations for the
    # in-person, online, and phone purchase methods, which use the purchase_pet factory method to create the appropriate Animal object.
    #
    # The Animal class represents a pet. It has an abstract speak method.
    #
    # == Related Topics
    # - AbstractFactory
    # - Builder
    # - ChainOfResponsibility
    # - Command
    # - ObjectPool
    # - PrivateClassData
    # - Singleton
    # - Structure
    #
    class FactoryMethod

      # === Content from design_patterns/creational/factory_method.rb ===

      # The Factory Method design pattern is a creational design pattern that defines an interface for creating an object,
      # but allows subclasses to alter the type of objects that will be created. The Factory Method design pattern is
      # often used to create objects in a super class, but allow subclasses to alter the type of objects that will be created.
      #
      # Imagine that you are building a system for a pet store that allows customers to purchase different types of pets.
      # The system has a set of classes that represent the various types of pets that are available (e.g. dogs, cats, and birds),
      # and a set of classes that represent the various ways that pets can be purchased (e.g. in-person, online, and via phone).
      #
      # To implement this scenario using the Factory Method design pattern, you could define an Animal class that represents a pet,
      # and a PetStore class that represents the store. The Animal class has an abstract speak method, and the PetStore class has
      # an abstract purchase_pet method, which is the factory method. The PetStore class also has concrete implementations for the
      # in-person, online, and phone purchase methods, which use the purchase_pet factory method to create the appropriate Animal object.

      # The Animal class represents a pet. It has an abstract speak method.
      class Animal
        def speak
          raise NotImplementedError
        end
      end

      # The Dog class represents a dog. It has a speak method that returns a
      # string indicating that the dog is barking.
      class Dog < Animal
        def speak
          'Bark!'
        end
      end

      # The Cat class represents a cat. It has a speak method that returns a
      # string indicating that the cat is meowing.
      class Cat < Animal
        def speak
          'Meow!'
        end
      end

      # The Bird class represents a bird. It has a speak method that returns a
      # string indicating that the bird is tweeting.
      class Bird < Animal
        def speak
          'Tweet!'
        end
      end

      # The PetStore class represents the store. It has an abstract purchase_pet
      # method, which is the factory method, and concrete implementations for the
      # in-person, online, and phone purchase methods, which use the purchase_pet
      # factory method to create the appropriate Animal object.
      class PetStore
        def self.purchase_pet(type)
          raise NotImplementedError
        end

        def self.purchase_in_person(type)
          purchase_pet(type)
        end

        def self.purchase_online(type)
          purchase_pet(type)
        end

        def self.purchase_phone(type)
          purchase_pet(type)
        end
      end

      # The DogStore class represents a store that sells dogs. It has a purchase_pet
      # method that creates a new Dog object.
      class DogStore < PetStore
        def self.purchase_pet(type)
          Dog.new
        end
      end

      # The CatStore class represents a store that sells cats. It has a purchase_pet
      # method that creates a new Cat object.
      class CatStore < PetStore
        def self.purchase_pet(type)
          Dog.new
        end
      end

      # The Fish class represents a fish. It has a speak method that returns a
      # string indicating that the fish is silent.
      class Fish < Animal
        def speak
          '...'
        end
      end

      # The FishStore class represents a store that sells fish. It has a purchase_pet
      # method that creates a new Fish object.
      class FishStore < PetStore
        def self.purchase_pet(type)
          Fish.new
        end
      end

      # The client code can work with the PetStore class, allowing it to purchase
      # pets without having to worry about the complexity of the system.
      dog_store = DogStore.new
      cat_store = CatStore.new
      bird_store = BirdStore.new
      fish_store = FishStore.new

      dog = dog_store.purchase_in_person('dog')
      cat = cat_store.purchase_online('cat')
      bird = bird_store.purchase_phone('bird')
      fish = fish_store.purchase_in_person('fish')

      puts dog.speak
      puts cat.speak
      puts bird.speak
      puts fish.speak

      # In this example, the Animal class represents a pet, and the PetStore class represents the store. The Animal class has
      # an abstract speak method, and the PetStore class has an abstract purchase_pet method, which is the factory method. The
      # PetStore class also has concrete implementations for the in-person, online, and phone purchase methods, which use the
      # purchase_pet factory method to create the appropriate Animal object.
      #
      #   The DogStore class represents a store that sells dogs, and the CatStore class represents a store that sells cats.
      # The DogStore class has a purchase_pet method that creates a new Dog object, and the CatStore class has a purchase_pet
      # method that creates a new Cat object.
      #
      #   The BirdStore class represents a store that sells birds, and the FishStore class represents a store that sells fish.
      # The BirdStore class has a purchase_pet method that creates a new Bird object, and the FishStore class has a purchase_pet
      # method that creates a new Fish object.
      #
      #   This allows the client code to work with the PetStore class, allowing it to purchase pets without having to worry about
      # the complexity of the system. The client code can use the appropriate PetStore subclass to purchase the desired type of pet,
      # and the PetStore subclass will use the purchase_pet factory method to create the appropriate Animal object.
      #
      #   In this example, the PetStore class acts as a factory, and the purchase_pet method acts as the factory method, allowing
      # subclasses to alter the type of objects that will be created. This makes it easier for the client code to work with the system,
      # and reduces the dependency of the client code on the implementation details of the system.

      # In this example, the Fish class represents a fish, and the FishStore class represents a store that sells fish.
      # The Fish class has a speak method that returns a string indicating that the fish is silent, and the FishStore
      # class has a purchase_pet method that creates a new Fish object.
      #
      #   The client code can work with the PetStore class, allowing it to purchase pets without having to worry about
      # the complexity of the system. The client code can use the appropriate PetStore subclass to purchase the desired
      # type of pet, and the PetStore subclass will use the purchase_pet factory method to create the appropriate Animal object.

    end

    # ObjectPool - Individual Topic
    # Source: design_patterns/creational/object_pool.rb
    # The Object Pool design pattern is a creational design pattern that allows you to reuse objects from a pool of objects, rather than creating
    # new objects each time they are needed. It is often used to improve the performance of applications by reducing the overhead of creating and
    # destroying objects, and can help to reduce memory usage and improve resource utilization.
    #
    # Here's a summary of the Object Pool pattern:
    #
    # The Object Pool pattern allows you to reuse objects from a pool of objects, rather than creating new objects each time they are needed.
    # It is often used to improve the performance of applications by reducing the overhead of creating and destroying objects, and can help to reduce
    # memory usage and improve resource utilization.
    # The Object Pool pattern consists of a pool class and an object class.
    # The pool class stores a collection of objects, and provides methods to check out and return objects from the pool.
    # The object class represents the objects in the pool, and may include additional behavior or state.
    #
    # Here's an example of the Object Pool design pattern in Ruby for a database connection scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building a web application that connects to a database to retrieve data. The application needs to create a new database
    # connection each time it needs to retrieve data, which can be time-consuming and resource-intensive.
    #
    # To improve the performance of the application, you could use the Object Pool design pattern to create a pool of database connections,
    # and reuse connections from the pool rather than creating new connections each time they are needed.
    #
    # The DatabaseConnection class represents a database connection. It has a
    # connection_string attribute that stores the connection string, and a
    # connect and disconnect method that allow the connection to be established and
    # closed.
    #
    # == Related Topics
    # - AbstractFactory
    # - Builder
    # - ChainOfResponsibility
    # - Command
    # - FactoryMethod
    # - PrivateClassData
    # - Singleton
    # - Structure
    #
    class ObjectPool

      # === Content from design_patterns/creational/object_pool.rb ===

      # The Object Pool design pattern is a creational design pattern that allows you to reuse objects from a pool of objects, rather than creating
      # new objects each time they are needed. It is often used to improve the performance of applications by reducing the overhead of creating and
      # destroying objects, and can help to reduce memory usage and improve resource utilization.
      #
      # Here's a summary of the Object Pool pattern:
      #
      # The Object Pool pattern allows you to reuse objects from a pool of objects, rather than creating new objects each time they are needed.
      # It is often used to improve the performance of applications by reducing the overhead of creating and destroying objects, and can help to reduce
      # memory usage and improve resource utilization.
      # The Object Pool pattern consists of a pool class and an object class.
      # The pool class stores a collection of objects, and provides methods to check out and return objects from the pool.
      # The object class represents the objects in the pool, and may include additional behavior or state.
      #
      # Here's an example of the Object Pool design pattern in Ruby for a database connection scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building a web application that connects to a database to retrieve data. The application needs to create a new database
      # connection each time it needs to retrieve data, which can be time-consuming and resource-intensive.
      #
      # To improve the performance of the application, you could use the Object Pool design pattern to create a pool of database connections,
      # and reuse connections from the pool rather than creating new connections each time they are needed.

      # The DatabaseConnection class represents a database connection. It has a
      # connection_string attribute that stores the connection string, and a
      # connect and disconnect method that allow the connection to be established and
      # closed.
      class DatabaseConnection
        attr_reader :connection_string

        def initialize(connection_string)
          @connection_string = connection_string
        end

        def connect
          puts "Connecting to the database with connection string: #{connection_string}"
        end

        def disconnect
          puts "Disconnecting from the database"
        end
      end

      # The DatabaseConnectionPool class represents a pool of database connections. It
      # has a connections attribute that stores the connections in the pool, and
      # provides a check_out and check_in method that allow connections to be checked
      # out and returned to the pool.
      class DatabaseConnectionPool
        attr_reader :connections

        def initialize
          @connections = []
        end

        def check_out
          connection = connections.pop
          puts "Checking out connection: #{connection.object_id}"
          connection
        end

        def check_in(connection)
          puts "Checking in connection: #{connection.object_id}"
          connections << connection
        end
      end

      # The client code can use the DatabaseConnection and DatabaseConnectionPool
      # classes to retrieve database connections from the pool.
      connection_pool = DatabaseConnectionPool.new

      5.times do
        connection = DatabaseConnection.new('connection string')
        connection_pool.check_in(connection)
      end

      10.times do
        connection = connection_pool.check_out
        connection.connect
        connection.disconnect
        connection_pool.check_in(connection)
      end

      # Output:
      # Checking in connection: 70362053569400
      # Checking in connection: 70362053569380
      # Checking in connection: 70362053569360
      # Checking in connection: 70362053569340
      # Checking in connection: 70362053569320
      # Checking out connection: 70362053569320
      # Connecting to the database with connection string: connection string
      # Disconnecting from the database
      # Checking in connection: 70362053569320
      # Checking out connection: 70362053569400
      # Connecting to the database with connection string: connection string
      # Disconnecting from the database
      # Checking in connection: 70362053569400
      # Checking out connection: 70362053569380
      # Connecting to the database with connection string: connection string
      # Disconnecting from the database
      # Checking in connection: 70362053569380
      # Checking out connection: 70362053569360
      # Connecting to the database with connection string: connection string
      # Disconnecting from the database
      # ...

      # In this example, the DatabaseConnection class represents a database connection, and has a connection_string attribute that stores the
      # connection string, and a connect and disconnect method that allow the connection to be established and closed.
      #
      # The DatabaseConnectionPool class represents a pool of database connections, and has a connections attribute that stores the connections
      # in the pool. It provides a check_out and check_in method that allow connections to be checked out and returned to the pool.
      #
      # The client code creates a new DatabaseConnectionPool and adds 5 DatabaseConnection objects to the pool. It then checks out 10 connections
      # from the pool, uses them to connect and disconnect from the database, and returns them to the pool.
      #
      # Using the Object Pool design pattern in this way allows the application to reuse database connections from the pool, rather than creating
      # new connections each time they are needed. This can improve the performance of the application by reducing the overhead of creating and
      # destroying connections, and can help to reduce memory usage and improve resource utilization.

    end

    # PrivateClassData - Individual Topic
    # Source: design_patterns/creational/private_class_data.rb
    # The Private Class Data design pattern is a creational design pattern that allows objects to have private data that can only be
    # accessed through public methods. It is often used to encapsulate data within an object, and to ensure that the data is only accessed
    # in a controlled and predictable way.
    #
    #   Here's a summary of the Private Class Data pattern:
    #
    # The Private Class Data pattern allows objects to have private data that can only be accessed through public methods.
    # It is often used to encapsulate data within an object, and to ensure that the data is only accessed in a controlled and predictable way.
    # The Private Class Data pattern consists of a class with private data attributes and public accessor methods.
    # The accessor methods are used to get and set the values of the private data attributes.
    #
    # Here's an example of the Private Class Data design pattern in Ruby for a bank account scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building a bank account application that allows users to open and manage bank accounts. Each bank account has a balance,
    # and users can deposit and withdraw money from their accounts.
    #
    # To implement this feature, you could use the Private Class Data design pattern to encapsulate the balance data within the BankAccount class,
    # and provide public methods to allow users to access and modify the balance in a controlled and predictable way.
    #
    #
    # == Related Topics
    # - AbstractFactory
    # - Builder
    # - ChainOfResponsibility
    # - Command
    # - FactoryMethod
    # - ObjectPool
    # - Singleton
    # - Structure
    #
    class PrivateClassData

      # === Content from design_patterns/creational/private_class_data.rb ===

      # The Private Class Data design pattern is a creational design pattern that allows objects to have private data that can only be
      # accessed through public methods. It is often used to encapsulate data within an object, and to ensure that the data is only accessed
      # in a controlled and predictable way.
      #
      #   Here's a summary of the Private Class Data pattern:
      #
      # The Private Class Data pattern allows objects to have private data that can only be accessed through public methods.
      # It is often used to encapsulate data within an object, and to ensure that the data is only accessed in a controlled and predictable way.
      # The Private Class Data pattern consists of a class with private data attributes and public accessor methods.
      # The accessor methods are used to get and set the values of the private data attributes.
      #
      # Here's an example of the Private Class Data design pattern in Ruby for a bank account scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building a bank account application that allows users to open and manage bank accounts. Each bank account has a balance,
      # and users can deposit and withdraw money from their accounts.
      #
      # To implement this feature, you could use the Private Class Data design pattern to encapsulate the balance data within the BankAccount class,
      # and provide public methods to allow users to access and modify the balance in a controlled and predictable way.
      #
      class BankAccount
        def initialize(balance)
          @balance = balance
        end

        def deposit(amount)
          @balance += amount
        end

        def withdraw(amount)
          @balance -= amount
        end

        def balance
          @balance
        end
      end

      # The client code can use the BankAccount class to create and manage bank
      # accounts.
      account = BankAccount.new(100)

      puts account.balance
      # Output: 100

      account.deposit(50)

      puts account.balance
      # Output: 150

      account.withdraw(25)

      puts account.balance
      # Output: 125

    end

    # Singleton - Individual Topic
    # Source: design_patterns/creational/singleton.rb
    # The Singleton design pattern is a creational design pattern that allows objects to have a single instance, and provides a global point of
    # access to that instance. It is often used to ensure that there is only one instance of a class that is responsible for a certain task, and
    # to provide a global point of access to that instance.
    #
    #   Here's a summary of the Singleton pattern:
    #
    # The Singleton design pattern allows objects to have a single instance, and provides a global point of access to that instance.
    # It is often used to ensure that there is only one instance of a class that is responsible for a certain task, and to provide a global point of access to that instance.
    # The Singleton pattern consists of a class with a private constructor and a static method that returns the single instance of the class.
    # The single instance of the class is created when the static method is first called, and subsequent calls to the static method return the same instance.
    #
    # Here's an example of the Singleton design pattern in Ruby for a database connection scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building a web application that accesses a database. The database connection is a resource that is expensive to create and
    # maintain, and it is important to ensure that there is only one connection to the database at a time.
    #
    # To implement this feature, you could use the Singleton design pattern to create a DatabaseConnection class that has a single instance, and
    # provides a global point of access to that instance. The DatabaseConnection class has a private constructor and a static instance method that
    # returns the single instance of the class.
    #
    #
    # == Related Topics
    # - AbstractFactory
    # - Builder
    # - ChainOfResponsibility
    # - Command
    # - FactoryMethod
    # - ObjectPool
    # - PrivateClassData
    # - Structure
    #
    class Singleton

      # === Content from design_patterns/creational/singleton.rb ===

      # The Singleton design pattern is a creational design pattern that allows objects to have a single instance, and provides a global point of
      # access to that instance. It is often used to ensure that there is only one instance of a class that is responsible for a certain task, and
      # to provide a global point of access to that instance.
      #
      #   Here's a summary of the Singleton pattern:
      #
      # The Singleton design pattern allows objects to have a single instance, and provides a global point of access to that instance.
      # It is often used to ensure that there is only one instance of a class that is responsible for a certain task, and to provide a global point of access to that instance.
      # The Singleton pattern consists of a class with a private constructor and a static method that returns the single instance of the class.
      # The single instance of the class is created when the static method is first called, and subsequent calls to the static method return the same instance.
      #
      # Here's an example of the Singleton design pattern in Ruby for a database connection scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building a web application that accesses a database. The database connection is a resource that is expensive to create and
      # maintain, and it is important to ensure that there is only one connection to the database at a time.
      #
      # To implement this feature, you could use the Singleton design pattern to create a DatabaseConnection class that has a single instance, and
      # provides a global point of access to that instance. The DatabaseConnection class has a private constructor and a static instance method that
      # returns the single instance of the class.

      class DatabaseConnection
        @@instance = nil

        private_class_method :new

        def self.instance
          @@instance ||= new
        end

        def execute_query(query)
          # Execute the given query on the database
        end
      end

      # The client code can use the DatabaseConnection class to access and manage the
      # database connection, with the guarantee that there will only be one connection
      # at a time.
      connection = DatabaseConnection.instance

      connection.execute_query('SELECT * FROM users')
      # Output: Executing query on the database: SELECT * FROM users

      connection = DatabaseConnection.instance

      connection.execute_query('SELECT * FROM orders')
      # Output: Executing query on the database: SELECT * FROM orders

      # In this example, the DatabaseConnection class has a single instance that is created when the instance method is first called, and
      # subsequent calls to the instance method return the same instance. The client code can use the DatabaseConnection class to access and manage
      # the database connection, with the guarantee that there will only be one connection at a time.

    end

    # Structure - Individual Topic
    # Source: design_patterns/creational/structure.rb
    # The Structure design pattern is a creational design pattern that allows you to compose objects into tree structures
    # to represent part-whole hierarchies. The Structure design pattern is commonly used to implement the Composite design pattern,
    # which allows you to treat individual objects and compositions of objects uniformly.
    #
    #   Here's a real-world example of how the Structure design pattern could be used, along with an explanation of
    # how it could be implemented in Ruby code:
    #
    # Imagine that you are building a system for a company's organizational chart. The organizational chart has a hierarchy of
    # employees, with each employee having a manager and a team of direct reports. An employee can either be a manager or a
    # regular employee.
    #
    #   To implement this scenario using the Structure design pattern, you could define an Employee class that represents an
    # employee in the organizational chart. The Employee class would have a name and a list of direct reports
    # (if the employee is a manager), and would have methods for adding and removing direct reports, as well as for printing
    # the employee's information (including the names of their direct reports).
    #
    # The Employee class represents an employee in the organizational chart. It
    # has a name and a list of direct reports (if the employee is a manager). It
    # has methods for adding and removing direct reports, and for printing the
    # employee's information (including the names of their direct reports).
    #
    # == Related Topics
    # - AbstractFactory
    # - Builder
    # - ChainOfResponsibility
    # - Command
    # - FactoryMethod
    # - ObjectPool
    # - PrivateClassData
    # - Singleton
    #
    class Structure

      # === Content from design_patterns/creational/structure.rb ===

      # The Structure design pattern is a creational design pattern that allows you to compose objects into tree structures
      # to represent part-whole hierarchies. The Structure design pattern is commonly used to implement the Composite design pattern,
      # which allows you to treat individual objects and compositions of objects uniformly.
      #
      #   Here's a real-world example of how the Structure design pattern could be used, along with an explanation of
      # how it could be implemented in Ruby code:
      #
      # Imagine that you are building a system for a company's organizational chart. The organizational chart has a hierarchy of
      # employees, with each employee having a manager and a team of direct reports. An employee can either be a manager or a
      # regular employee.
      #
      #   To implement this scenario using the Structure design pattern, you could define an Employee class that represents an
      # employee in the organizational chart. The Employee class would have a name and a list of direct reports
      # (if the employee is a manager), and would have methods for adding and removing direct reports, as well as for printing
      # the employee's information (including the names of their direct reports).

      # The Employee class represents an employee in the organizational chart. It
      # has a name and a list of direct reports (if the employee is a manager). It
      # has methods for adding and removing direct reports, and for printing the
      # employee's information (including the names of their direct reports).
      class Employee
        attr_reader :name, :direct_reports

        def initialize(name)
          @name = name
          @direct_reports = []
        end

        def add_direct_report(employee)
          @direct_reports << employee
        end

        def remove_direct_report(employee)
          @direct_reports.delete(employee)
        end

        def print_information
          puts "Employee: #{@name}"
          puts "Direct reports: #{@direct_reports.map(&:name).join(', ')}"
        end
      end

      # The client code creates employees and builds the organizational chart.
      ceo = Employee.new('CEO')
      cto = Employee.new('CTO')
      cfo = Employee.new('CFO')
      vp_engineering = Employee.new('VP of Engineering')
      vp_marketing = Employee.new('VP of Marketing')
      vp_sales = Employee.new('VP of Sales')

      ceo.add_direct_report(cto)
      ceo.add_direct_report(cfo)
      cto.add_direct_report(vp_engineering)
      vp_engineering.add_direct_report(Employee.new('Software Engineer'))
      vp_engineering.add_direct_report(Employee.new('Software Engineer'))
      vp_engineering.add_direct_report(Employee.new('Software Engineer'))
      cto.add_direct_report(vp_marketing)
      vp_marketing.add_direct_report(Employee.new('Marketing Manager'))
      vp_marketing.add_direct_report(Employee.new('Marketing Manager'))
      cfo.add_direct_report(vp_sales)
      vp_sales.add_direct_report(Employee.new('Sales Representative'))
      vp_sales.add_direct_report(Employee.new('Sales Representative'))
      vp_sales.add_direct_report(Employee.new('Sales Representative'))

      # The client code can work with the entire organizational chart or with
      # individual employees.
      ceo.print_information
      vp_engineering.print_information
      vp_sales.print_information

      # In this example, the Employee class represents an employee in the organizational chart and has a name and a
      # list of direct reports (if the employee is a manager). It has methods for adding and removing direct reports,
      # as well as for printing the employee's information (including the names of their direct reports).
      #
      # The client code creates Employee objects and builds the organizational chart by adding direct reports to managers.
      # The client code can then work with the entire organizational chart or with individual employees by calling the
      # print_information method on the Employee objects.
      #
      # This example demonstrates how the Structure design pattern can be used to represent part-whole hierarchies
      # and implement the Composite design pattern, allowing you to treat individual objects and compositions of objects uniformly.

    end

  end

  # Structural module
  #
  # == Table of Contents
  # - Adapter
  # - Bridge
  # - Composite
  # - Decorator
  # - Facade
  # - Flyweight
  # - Proxy
  #
  module Structural

    # Adapter - Individual Topic
    # Source: design_patterns/structural/adapter.rb
    # The Adapter design pattern is a structural design pattern that allows you to adapt one interface to another,
    # allowing classes to work together that couldn't otherwise because of incompatible interfaces.
    # he Adapter design pattern allows you to adapt the interface of a class to another interface that clients expect.
    # It's used to integrate classes that couldn't be integrated due to incompatible interfaces.
    #
    # Imagine you are traveling to a foreign country and you need to charge your phone. You bring your phone charger with you, but the
    # outlet in the hotel room has a different shape than the one you are used to. In order to charge your phone, you need to use an adapter
    # that converts the shape of the outlet to the shape of your charger.
    #
    # In this example, the adapter is the object that converts the interface of the outlet to the interface of the charger. The outlet is the
    # adaptee, and the charger is the target interface.
    #
    # The Target defines the domain-specific interface used by the client code.
    #
    # == Related Topics
    # - Bridge
    # - Composite
    # - Decorator
    # - Facade
    # - Flyweight
    # - Proxy
    #
    class Adapter

      # === Content from design_patterns/structural/adapter.rb ===

      # The Adapter design pattern is a structural design pattern that allows you to adapt one interface to another,
      # allowing classes to work together that couldn't otherwise because of incompatible interfaces.
      # he Adapter design pattern allows you to adapt the interface of a class to another interface that clients expect.
      # It's used to integrate classes that couldn't be integrated due to incompatible interfaces.
      #
      # Imagine you are traveling to a foreign country and you need to charge your phone. You bring your phone charger with you, but the
      # outlet in the hotel room has a different shape than the one you are used to. In order to charge your phone, you need to use an adapter
      # that converts the shape of the outlet to the shape of your charger.
      #
      # In this example, the adapter is the object that converts the interface of the outlet to the interface of the charger. The outlet is the
      # adaptee, and the charger is the target interface.

      # The Target defines the domain-specific interface used by the client code.
      class Target
        # @abstract
        def request
          raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
        end
      end

      # The Adaptee contains some useful behavior, but its interface is incompatible
      # with the existing client code. The Adaptee needs some adaptation before the
      # client code can use it.
      class Adaptee
        def specific_request
          puts 'Adaptee.specific_request'
        end
      end

      # The Adapter makes the Adaptee's interface compatible with the Target's
      # interface.
      class Adapter < Target
        # @param [Adaptee] adaptee
        def initialize(adaptee)
          @adaptee = adaptee
        end

        def request
          puts 'Adapter.request'
          @adaptee.specific_request
        end
      end

      # The client code supports all classes that follow the Target interface.
      def client_code(target)
        target.request
      end

      # The client code can work with all concrete classes that follow the Target
      # interface.
      puts 'Client code: I can work with the Target objects:'
      target = Target.new
      client_code(target)

      adaptee = Adaptee.new
      puts "\nClient code: The Adaptee class has a weird interface. See, I don't understand it:"
      client_code(adaptee)

      puts "\nClient code: But I can work with it via the Adapter:"
      adapter = Adapter.new(adaptee)
      client_code(adapter)

      # Output:
      # Client code: I can work with the Target objects:
      # NotImplementedError (Target has not implemented method 'request')
      #
      # Client code: The Adaptee class has a weird interface. See, I don't understand it:
      # NoMethodError (undefined method `request' for #<Adaptee:0x00007fa1ce808580>)
      #
      # Client code: But I can work with it via the Adapter:
      # Adapter.request
      # Adaptee.specific_request

      # In this example, the client code is trying to use the Adaptee class, but it has a different interface than the client expects.
      # To make the Adaptee class compatible with the client code, the Adapter class is introduced. The Adapter class has the same interface as
      # the Target class and delegates requests to the Adaptee class.
      #
      # The client code can work with all concrete classes that follow the Target interface, and it can use the Adapter class to work with the
      # Adaptee class as well.




    end

    # Bridge - Individual Topic
    # Source: design_patterns/structural/bridge.rb
    # The Bridge design pattern is a structural design pattern that decouples an abstraction from its implementation,
    # allowing the two to vary independently. The Bridge design pattern is often used to implement the Adapter design pattern,
    # which allows you to adapt one interface to another.
    #
    #   Here's a real-world example of how the Bridge design pattern could be used, along with an explanation of how
    # it could be implemented in Ruby code:
    #
    # Imagine that you are building a system for a music player that can play different types of audio files
    # (e.g. MP3, WAV, and AIFF). The music player has a set of controls for playing, pausing, and stopping the audio,
    # and you want to be able to add support for new audio file types without changing the existing controls.
    #
    # To implement this scenario using the Bridge design pattern, you could define an AudioPlayer class that represents
    # the music player and has a play, pause, and stop method for controlling the audio. You could also define an AudioFile
    # interface that declares an play method, and concrete implementations of the AudioFile interface for each type of
    # audio file (e.g. MP3AudioFile, WAVAudioFile, and AIFFAudioFile).
    #
    # The AudioPlayer class would have a reference to an AudioFile object, and its play, pause, and stop methods would
    # delegate to the corresponding method on the AudioFile object. This allows you to add support for new audio file
    # types by creating a new concrete implementation of the AudioFile interface, without changing the existing controls
    # in the AudioPlayer class.
    #
    # The AudioFile interface declares the play method.
    #
    # == Related Topics
    # - Adapter
    # - Composite
    # - Decorator
    # - Facade
    # - Flyweight
    # - Proxy
    #
    class Bridge

      # === Content from design_patterns/structural/bridge.rb ===

      # The Bridge design pattern is a structural design pattern that decouples an abstraction from its implementation,
      # allowing the two to vary independently. The Bridge design pattern is often used to implement the Adapter design pattern,
      # which allows you to adapt one interface to another.
      #
      #   Here's a real-world example of how the Bridge design pattern could be used, along with an explanation of how
      # it could be implemented in Ruby code:
      #
      # Imagine that you are building a system for a music player that can play different types of audio files
      # (e.g. MP3, WAV, and AIFF). The music player has a set of controls for playing, pausing, and stopping the audio,
      # and you want to be able to add support for new audio file types without changing the existing controls.
      #
      # To implement this scenario using the Bridge design pattern, you could define an AudioPlayer class that represents
      # the music player and has a play, pause, and stop method for controlling the audio. You could also define an AudioFile
      # interface that declares an play method, and concrete implementations of the AudioFile interface for each type of
      # audio file (e.g. MP3AudioFile, WAVAudioFile, and AIFFAudioFile).
      #
      # The AudioPlayer class would have a reference to an AudioFile object, and its play, pause, and stop methods would
      # delegate to the corresponding method on the AudioFile object. This allows you to add support for new audio file
      # types by creating a new concrete implementation of the AudioFile interface, without changing the existing controls
      # in the AudioPlayer class.

      # The AudioFile interface declares the play method.
      class AudioFile
        def play
          raise NotImplementedError, "You must implement #{self.class}##{__method__}"
        end
      end

      # Concrete implementations of the AudioFile interface play a specific audio
      # file format.
      class MP3AudioFile < AudioFile
        def initialize(file_path)
          @file_path = file_path
        end

        def play
          puts "Playing MP3 file: #{@file_path}"
        end
      end

      class WAVAudioFile < AudioFile
        def initialize(file_path)
          @file_path = file_path
        end

        def play
          puts "Playing WAV file: #{@file_path}"
        end
      end

      class AIFFAudioFile < AudioFile
        def initialize(file_path)
          @file_path = file_path
        end

        def play
          puts "Playing AIFF file: #{@file_path}"
        end
      end

      # The AudioPlayer class has a reference to an AudioFile object and delegates
      # the play, pause, and stop methods to the AudioFile object.
      class AudioPlayer
        def initialize(audio_file)
          @audio_file = audio_file
        end

        def play
          @audio_file.play
        end

        def pause
          puts 'Pausing audio'
        end

        def stop
          puts 'Stopping audio'
        end
      end

      # The client code can work with the AudioPlayer and any concrete
      # implementation of the AudioFile interface.
      mp3_file = MP3AudioFile.new('song.mp3')
      audio_player = AudioPlayer.new(mp3_file)
      audio_player.play
      audio_player.pause
      audio_player.stop

      wav_file = WAVAudioFile.new('song.wav')
      audio_player = AudioPlayer.new(wav_file)
      audio_player.play
      audio_player.pause
      audio_player.stop

      aiff_file = AIFFAudioFile.new('song.aiff')
      audio_player = AudioPlayer.new(aiff_file)
      audio_player.play
      audio_player.pause

      # In this example, the AudioFile interface declares the play method, and the MP3AudioFile, WAVAudioFile, and
      # AIFFAudioFile classes are concrete implementations of the AudioFile interface that play a specific audio file format.
      #
      #   The AudioPlayer class has a reference to an AudioFile object and delegates the play, pause, and stop
      # methods to the AudioFile object. This allows you to add support for new audio file types by creating a
      # new concrete implementation of the AudioFile interface, without changing the existing controls in the AudioPlayer class.
      #
      #     The client code can work with the AudioPlayer and any concrete implementation of the AudioFile interface,
      # allowing it to play different types of audio files without having to know the details of how each type of audio file is played.
      #
      #     This example demonstrates how the Bridge design pattern can decouple an abstraction from its
      # implementation, allowing the two to vary independently and allowing you to implement the Adapter
      # design pattern, which allows you to adapt one interface to another.
      #



    end

    # Composite - Individual Topic
    # Source: design_patterns/structural/composite.rb
    # The Composite design pattern is a structural design pattern that allows you to compose objects into tree structures,
    # and treat individual objects and compositions of objects uniformly. The Composite design pattern is often used to
    # represent part-whole hierarchies, and to allow clients to treat individual objects and compositions of objects uniformly.
    #
    # Imagine that you are building a system for a company that has a hierarchy of employees, with managers and workers at
    # different levels. The company has a set of policies for setting the salaries of employees, and you want to be able
    # to apply the policies to individual employees and groups of employees uniformly.
    #
    #   To implement this scenario using the Composite design pattern, you could define an Employee class that represents an
    # employee, and an EmployeeGroup class that represents a group of employees. The Employee class has a salary attribute, and the EmployeeGroup class has a salaries method that returns the sum of the salaries of its employees.
    #
    #   You could also define a SalaryPolicy class that has a apply method that takes an Employee or EmployeeGroup object
    # and applies the policy to it. The SalaryPolicy class would have a reference to an Employee or EmployeeGroup object,
    # and its apply method would call the salaries method on the EmployeeGroup object or return the salary attribute of the Employee object.
    #
    #
    # The Employee class represents an employee. It has a salary attribute.
    #
    # == Related Topics
    # - Adapter
    # - Bridge
    # - Decorator
    # - Facade
    # - Flyweight
    # - Proxy
    #
    class Composite

      # === Content from design_patterns/structural/composite.rb ===

      # The Composite design pattern is a structural design pattern that allows you to compose objects into tree structures,
      # and treat individual objects and compositions of objects uniformly. The Composite design pattern is often used to
      # represent part-whole hierarchies, and to allow clients to treat individual objects and compositions of objects uniformly.
      #
      # Imagine that you are building a system for a company that has a hierarchy of employees, with managers and workers at
      # different levels. The company has a set of policies for setting the salaries of employees, and you want to be able
      # to apply the policies to individual employees and groups of employees uniformly.
      #
      #   To implement this scenario using the Composite design pattern, you could define an Employee class that represents an
      # employee, and an EmployeeGroup class that represents a group of employees. The Employee class has a salary attribute, and the EmployeeGroup class has a salaries method that returns the sum of the salaries of its employees.
      #
      #   You could also define a SalaryPolicy class that has a apply method that takes an Employee or EmployeeGroup object
      # and applies the policy to it. The SalaryPolicy class would have a reference to an Employee or EmployeeGroup object,
      # and its apply method would call the salaries method on the EmployeeGroup object or return the salary attribute of the Employee object.


      # The Employee class represents an employee. It has a salary attribute.
      class Employee
        attr_reader :salary

        def initialize(salary)
          @salary = salary
        end
      end

      # The EmployeeGroup class represents a group of employees. It has a
      # salaries method that returns the sum of the salaries of its employees.
      class EmployeeGroup
        def initialize
          @employees = []
        end

        def add_employee(employee)
          @employees << employee
        end

        def salaries
          @employees.map(&:salary).inject(:+)
        end
      end

      # The SalaryPolicy class has an apply method that takes an Employee or
      # EmployeeGroup object and applies the policy to it. It has a reference to
      # an Employee or EmployeeGroup object, and its apply method calls the
      # salaries method on the EmployeeGroup object or returns the salary
      # attribute of the Employee object.
      class SalaryPolicy
        def initialize(employee)
          @employee = employee
        end

        def apply
          if @employee.is_a?(Employee)
            @employee.salary *= 1.1
          elsif @employee.is_a?(EmployeeGroup)
            @employee.salaries *= 1.1
          end
        end
      end

      # The client code can work with any object that implements the Employee or
      # EmployeeGroup interface, allowing it to apply policies to individual
      # employees and groups of employees uniformly.
      manager = Employee.new(100_000)
      team = EmployeeGroup.new
      team.add_employee(Employee.new(70_000))
      team.add_employee(Employee.new(50_000))

      SalaryPolicy.new(manager).apply
      SalaryPolicy.new(team).apply

      puts manager.salary
      puts team.salaries

      # In this example, the Employee class represents an employee, and the EmployeeGroup class represents a group of employees.
      # The Employee class has a salary attribute, and the EmployeeGroup class has a salaries method that returns the sum of the
      # salaries of its employees.
      #
      #   The SalaryPolicy class has an apply method that takes an Employee or EmployeeGroup object and applies the policy to it.
      # The SalaryPolicy class has a reference to an Employee or EmployeeGroup object, and its apply method calls the salaries method
      # on the EmployeeGroup object or returns the salary attribute of the Employee object.
      #
      #     This allows the client code to work with any object that implements the Employee or EmployeeGroup interface,
      # allowing it to apply policies to individual employees and groups of employees uniformly.
      #
      #     This example demonstrates how the Composite design pattern allows you to compose objects into tree structures,
      # and treat individual objects and compositions of objects uniformly, and how it can be used to represent part-whole
      # hierarchies and allow clients to treat individual objects and compositions of objects uniformly.

    end

    # Decorator - Individual Topic
    # Source: design_patterns/structural/decorator.rb
    # The Decorator design pattern is a structural design pattern that allows you to add new behavior to an existing object
    # dynamically, by wrapping the object in a decorator object that has the new behavior. The Decorator design pattern is
    # often used to extend the functionality of an object without changing its implementation, and to allow multiple levels
    # of decoration to be added to an object.
    #
    # Imagine that you are building a system for a coffee shop that serves different types of coffee drinks (e.g. espresso,
    # cappuccino, and latte). The coffee shop has a set of ingredients that can be added to the coffee drinks (e.g. milk,
    # sugar, and chocolate), and you want to be able to add ingredients to the coffee drinks dynamically, without changing
    # the existing coffee drinks.
    #
    # To implement this scenario using the Decorator design pattern, you could define a Coffee class that represents a coffee
    # drink, and a CoffeeDecorator class that represents an ingredient that can be added to a coffee drink. The Coffee class
    # has a description and a cost method, and the CoffeeDecorator class has a description and a cost method that delegates to
    # the description and cost methods of the decorated Coffee object.
    #
    # You could also define concrete implementations of the CoffeeDecorator class for each type of ingredient (e.g. MilkDecorator,
    # SugarDecorator, and ChocolateDecorator). Each concrete implementation of the CoffeeDecorator class would have a description
    # and a cost method that adds the description and cost of the ingredient to the decorated Coffee object.
    #
    # The Coffee class represents a coffee drink. It has a description and a
    # cost method.
    #
    # == Related Topics
    # - Adapter
    # - Bridge
    # - Composite
    # - Facade
    # - Flyweight
    # - Proxy
    #
    class Decorator

      # === Content from design_patterns/structural/decorator.rb ===

      # The Decorator design pattern is a structural design pattern that allows you to add new behavior to an existing object
      # dynamically, by wrapping the object in a decorator object that has the new behavior. The Decorator design pattern is
      # often used to extend the functionality of an object without changing its implementation, and to allow multiple levels
      # of decoration to be added to an object.
      #
      # Imagine that you are building a system for a coffee shop that serves different types of coffee drinks (e.g. espresso,
      # cappuccino, and latte). The coffee shop has a set of ingredients that can be added to the coffee drinks (e.g. milk,
      # sugar, and chocolate), and you want to be able to add ingredients to the coffee drinks dynamically, without changing
      # the existing coffee drinks.
      #
      # To implement this scenario using the Decorator design pattern, you could define a Coffee class that represents a coffee
      # drink, and a CoffeeDecorator class that represents an ingredient that can be added to a coffee drink. The Coffee class
      # has a description and a cost method, and the CoffeeDecorator class has a description and a cost method that delegates to
      # the description and cost methods of the decorated Coffee object.
      #
      # You could also define concrete implementations of the CoffeeDecorator class for each type of ingredient (e.g. MilkDecorator,
      # SugarDecorator, and ChocolateDecorator). Each concrete implementation of the CoffeeDecorator class would have a description
      # and a cost method that adds the description and cost of the ingredient to the decorated Coffee object.

      # The Coffee class represents a coffee drink. It has a description and a
      # cost method.
      class Coffee
        def description
          'Coffee'
        end

        def cost
          2
        end
      end

      # The CoffeeDecorator class represents an ingredient that can be added to a
      # coffee drink. It has a description and a cost method that delegates to the
      # description and cost methods of the decorated Coffee object.
      class CoffeeDecorator
        attr_reader :decorated_coffee

        def initialize(decorated_coffee)
          @decorated_coffee = decorated_coffee
        end

        def description
          "#{decorated_coffee.description}, #{ingredient_description}"
        end

        def cost
          decorated_coffee.cost + ingredient_cost
        end

        def ingredient_description
          raise NotImplementedError
        end

        def ingredient_cost
          raise NotImplementedError
        end
      end

      # The MilkDecorator class is a concrete implementation of the CoffeeDecorator
      # class that represents milk as an ingredient. It has a description and a
      # cost method that adds the description and cost of milk to the decorated
      # Coffee object.
      class MilkDecorator < CoffeeDecorator
        def ingredient_description
          'Milk'
        end

        def ingredient_cost
          0.5
        end
      end

      # The SugarDecorator class is a concrete implementation of the CoffeeDecorator
      # class that represents sugar as an ingredient. It has a description and a
      # cost method that adds the description and cost of sugar to the decorated
      # Coffee object.
      class SugarDecorator < CoffeeDecorator
        def ingredient_description
          'Sugar'
        end

        def ingredient_cost
          0.25
        end
      end

      # The ChocolateDecorator class is a concrete implementation of the
      # CoffeeDecorator class that represents chocolate as an ingredient. It has a
      # description and a cost method that adds the description and cost of
      # chocolate to the decorated Coffee object.
      class ChocolateDecorator < CoffeeDecorator
        def ingredient_description
          'Chocolate'
        end

        def ingredient_cost
          0.75
        end
      end

      # The client code can work with any object that implements the Coffee or
      # CoffeeDecorator interface, allowing it to add ingredients to coffee drinks
      # dynamically, without changing the existing coffee drinks.
      coffee = Coffee.new
      coffee = MilkDecorator.new(coffee)
      coffee = SugarDecorator.new(coffee)
      coffee = ChocolateDecorator.new(coffee)

      puts coffee.description
      puts coffee.cost



      # In this example, the Coffee class represents a coffee drink, and the CoffeeDecorator class represents an
      # ingredient that can be added to a coffee drink. The Coffee class has a description and a cost method, and
      # the CoffeeDecorator class has a description and a cost method that delegates to the description and cost
      # methods of the decorated Coffee object.
      #
      # The CoffeeDecorator class also has ingredient_description and ingredient_cost methods that are meant to be
      # overridden in concrete implementations of the CoffeeDecorator class. The MilkDecorator, SugarDecorator, and
      # ChocolateDecorator classes are concrete implementations of the CoffeeDecorator class that represent milk, sugar,
      # and chocolate as ingredients, respectively. Each of these classes has a description and a cost method that adds the description and cost of the ingredient to the decorated Coffee object.
      #
      #   This allows the client code to work with any object that implements the Coffee or CoffeeDecorator interface,
      # allowing it to add ingredients to coffee drinks dynamically, without changing the existing coffee drinks.
      #
      #   This example demonstrates how the Decorator design pattern allows you to add new behavior to an existing object
      # dynamically, by wrapping the object in a decorator object that has the new behavior, and how it can be used to
      # extend the functionality of an object without changing its implementation, and to allow multiple levels of decoration
      # to be added to an object.


    end

    # Facade - Individual Topic
    # Source: design_patterns/structural/facade.rb
    # The Facade design pattern is a structural design pattern that provides a simplified interface to a complex
    # system, hiding the complexity of the system and making it easier to use. The Facade design pattern is often used
    # to provide a high-level interface to a large body of code, allowing client code to work with the system more easily,
    # and to reduce the dependency of the client code on the implementation details of the system.
    #
    # Imagine that you are building a system for a restaurant that allows customers to place orders for food and drinks.
    # The system has a set of classes that represent the various items on the menu (e.g. burgers, pizzas, and drinks),
    # and a set of classes that represent the various ways that orders can be placed (e.g. in-person, online, and via phone).
    #
    # To implement this scenario using the Facade design pattern, you could define a Menu class that represents the menu,
    # and a OrderFacade class that represents the simplified interface to the system. The Menu class has methods for
    # retrieving the various items on the menu, and the OrderFacade class has methods for placing orders in-person,
    # online, and via phone, which delegate to the appropriate classes in the system.
    # The Menu class represents the menu. It has methods for retrieving the
    # various items on the menu.
    #
    # == Related Topics
    # - Adapter
    # - Bridge
    # - Composite
    # - Decorator
    # - Flyweight
    # - Proxy
    #
    class Facade

      # === Content from design_patterns/structural/facade.rb ===

      # The Facade design pattern is a structural design pattern that provides a simplified interface to a complex
      # system, hiding the complexity of the system and making it easier to use. The Facade design pattern is often used
      # to provide a high-level interface to a large body of code, allowing client code to work with the system more easily,
      # and to reduce the dependency of the client code on the implementation details of the system.

      # Imagine that you are building a system for a restaurant that allows customers to place orders for food and drinks.
      # The system has a set of classes that represent the various items on the menu (e.g. burgers, pizzas, and drinks),
      # and a set of classes that represent the various ways that orders can be placed (e.g. in-person, online, and via phone).
      #
      # To implement this scenario using the Facade design pattern, you could define a Menu class that represents the menu,
      # and a OrderFacade class that represents the simplified interface to the system. The Menu class has methods for
      # retrieving the various items on the menu, and the OrderFacade class has methods for placing orders in-person,
      # online, and via phone, which delegate to the appropriate classes in the system.
      # The Menu class represents the menu. It has methods for retrieving the
      # various items on the menu.
      class Menu
        def burgers
          ['Cheeseburger', 'Hamburger', 'Veggie Burger']
        end

        def pizzas
          ['Pepperoni', 'Margherita', 'Veggie']
        end

        def drinks
          ['Soda', 'Beer', 'Wine']
        end
      end

      # The OrderFacade class represents the simplified interface to the system. It
      # has methods for placing orders in-person, online, and via phone, which
      # delegate to the appropriate classes in the system.
      class OrderFacade
        attr_reader :menu

        def initialize
          @menu = Menu.new
        end

        def place_in_person_order(items)
          # Code for placing in-person orders goes here...
        end

        def place_online_order(items)
          # Code for placing online orders goes here...
        end

        def place_phone_order(items)
          # Code for placing phone orders goes here...
        end
      end

      # The client code can work with the OrderFacade object, allowing it to place
      # orders without having to worry about the complexity of the system.
      facade = OrderFacade.new
      items = facade.menu.burgers + facade.menu.pizzas + facade.menu.drinks
      facade.place_online_order(items)


      # In this example, the Menu class represents the menu, and the OrderFacade class represents the simplified interface to
      # the system. The Menu class has methods for retrieving the various items on the menu, and the OrderFacade class
      # has methods for placing orders in-person, online, and via phone, which delegate to the appropriate classes in the system.
      #
      #   The OrderFacade class has a reference to a Menu object, and its methods use the Menu object to retrieve the items
      # that the customer has selected.
      #   This allows the client code to work with the OrderFacade object, allowing it to place orders without having to
      # worry about the complexity of the system. The client code can retrieve the items on the menu using the Menu object,
      # and then pass the selected items to the appropriate method on the OrderFacade object to place the order.
      #
      #  In this example, the OrderFacade class acts as a facade, providing a simplified interface to the system, and hiding
      # the complexity of the system from the client code. This makes it easier for the client code to work with the system,
      # and reduces the dependency of the client code on the implementation details of the system.

    end

    # Flyweight - Individual Topic
    # Source: design_patterns/structural/flyweight.rb
    # The Flyweight design pattern is a structural design pattern that allows you to create and manage a large number of similar objects efficiently.
    # It does this by storing the object's intrinsic state (i.e. the state that is independent of the object's context) separately from the object, and
    # sharing the object's extrinsic state (i.e. the state that depends on the object's context) among the objects.
    #
    # Imagine that you are building a system for a text editor that allows users to create and edit documents. The system has a set of classes that
    # represent the various elements that can be included in a document (e.g. characters, words, and paragraphs), and a set of classes that represent
    # the various formatting options that can be applied to these elements (e.g. font, size, and color).
    #
    # To implement this scenario using the Flyweight design pattern, you could define a Character class that represents a character in a document, and
    # a CharacterFactory class that creates and stores the Character objects. The Character class has an initialize method that takes a character value
    # as an argument, and a render method that takes a font, size, and color as arguments and returns a string representation of the character with the
    # specified formatting applied.
    #
    # The Character class represents a character in a document. It has an
    # initialize method that takes a character value as an argument, and a render
    # method that takes a font, size, and color as arguments and returns a string
    # representation of the character with the specified formatting applied.
    #
    # == Related Topics
    # - Adapter
    # - Bridge
    # - Composite
    # - Decorator
    # - Facade
    # - Proxy
    #
    class Flyweight

      # === Content from design_patterns/structural/flyweight.rb ===

      # The Flyweight design pattern is a structural design pattern that allows you to create and manage a large number of similar objects efficiently.
      # It does this by storing the object's intrinsic state (i.e. the state that is independent of the object's context) separately from the object, and
      # sharing the object's extrinsic state (i.e. the state that depends on the object's context) among the objects.
      #
      # Imagine that you are building a system for a text editor that allows users to create and edit documents. The system has a set of classes that
      # represent the various elements that can be included in a document (e.g. characters, words, and paragraphs), and a set of classes that represent
      # the various formatting options that can be applied to these elements (e.g. font, size, and color).
      #
      # To implement this scenario using the Flyweight design pattern, you could define a Character class that represents a character in a document, and
      # a CharacterFactory class that creates and stores the Character objects. The Character class has an initialize method that takes a character value
      # as an argument, and a render method that takes a font, size, and color as arguments and returns a string representation of the character with the
      # specified formatting applied.
      #
      # The Character class represents a character in a document. It has an
      # initialize method that takes a character value as an argument, and a render
      # method that takes a font, size, and color as arguments and returns a string
      # representation of the character with the specified formatting applied.
      class Character
        def initialize(value)
          @value = value
        end

        def render(font, size, color)
          "#{font}:#{size}:#{color}:#{@value}"
        end
      end

      # The CharacterFactory class creates and stores the Character objects. It has
      # a get method that takes a character value as an argument and returns the
      # corresponding Character object. If the Character object does not exist, it
      # creates it and stores it in a hash.
      class CharacterFactory
        def initialize
          @characters = {}
        end

        def get(value)
          @characters[value] ||= Character.new(value)
        end
      end

      # In this example, the Character class represents a character in a document, and the CharacterFactory class creates and stores the Character objects.
      # The Character class has an initialize method that takes a character value as an argument, and a render method that takes a font, size, and color
      # as arguments and returns a string representation of the character with the specified formatting applied.
      #
      # The CharacterFactory class has a get method that takes a character value as an argument and returns the corresponding Character object. If the
      # Character object does not exist, it creates it and stores it in a hash. This allows the CharacterFactory to efficiently manage a large number of
      # Character objects, and reduces the memory usage of the system.
      #

    end

    # Proxy - Individual Topic
    # Source: design_patterns/structural/proxy.rb
    # The Proxy design pattern is a structural design pattern that allows objects to act as surrogates for other objects. It is often used to provide a
    # simplified interface to complex or resource-intensive objects, or to delay the creation of expensive objects until they are actually needed.
    #
    #   Here's a summary of the Proxy pattern:
    #
    # The Proxy design pattern allows objects to act as surrogates for other objects.
    # It is often used to provide a simplified interface to complex or resource-intensive objects, or to delay the creation of expensive objects
    # until they are actually needed.
    # The Proxy pattern consists of a proxy class that acts as an intermediary between the client and the real object.
    # The proxy class has the same interface as the real object, and forwards requests from the client to the real object.
    #
    # Here's an example of the Proxy design pattern in Ruby for a remote file system scenario, with a real-world example to illustrate the concept:
    #
    # Imagine you are building a file system application that allows users to access and manage files on a remote server. The file system on the
    # remote server is very large and complex, and accessing it directly can be slow and resource-intensive.
    #
    # To improve the performance of the file system application, you could use the Proxy design pattern to create a RemoteFileSystemProxy class that
    # acts as an intermediary between the client and the real file system on the remote server. The RemoteFileSystemProxy class has the same interface
    # as the real file system, and forwards requests from the client to the real file system, but it also caches frequently accessed files locally to
    # improve performance.
    #
    # The RemoteFileSystem class represents the real file system on the remote server.
    # It has a read_file method that retrieves a file from the file system.
    #
    # == Related Topics
    # - Adapter
    # - Bridge
    # - Composite
    # - Decorator
    # - Facade
    # - Flyweight
    #
    class Proxy

      # === Content from design_patterns/structural/proxy.rb ===

      # The Proxy design pattern is a structural design pattern that allows objects to act as surrogates for other objects. It is often used to provide a
      # simplified interface to complex or resource-intensive objects, or to delay the creation of expensive objects until they are actually needed.
      #
      #   Here's a summary of the Proxy pattern:
      #
      # The Proxy design pattern allows objects to act as surrogates for other objects.
      # It is often used to provide a simplified interface to complex or resource-intensive objects, or to delay the creation of expensive objects
      # until they are actually needed.
      # The Proxy pattern consists of a proxy class that acts as an intermediary between the client and the real object.
      # The proxy class has the same interface as the real object, and forwards requests from the client to the real object.
      #
      # Here's an example of the Proxy design pattern in Ruby for a remote file system scenario, with a real-world example to illustrate the concept:
      #
      # Imagine you are building a file system application that allows users to access and manage files on a remote server. The file system on the
      # remote server is very large and complex, and accessing it directly can be slow and resource-intensive.
      #
      # To improve the performance of the file system application, you could use the Proxy design pattern to create a RemoteFileSystemProxy class that
      # acts as an intermediary between the client and the real file system on the remote server. The RemoteFileSystemProxy class has the same interface
      # as the real file system, and forwards requests from the client to the real file system, but it also caches frequently accessed files locally to
      # improve performance.

      # The RemoteFileSystem class represents the real file system on the remote server.
      # It has a read_file method that retrieves a file from the file system.
      class RemoteFileSystem
        def read_file(path)
          puts "Reading file from remote file system: #{path}"
          # Return contents of file at the given path
        end
      end

      # The RemoteFileSystemProxy class represents a proxy for the real file system on
      # the remote server. It has a cache attribute that stores a hash of recently
      # accessed files, and a read_file method that retrieves a file from the file
      # system or from the cache if the file has been recently accessed.
      class RemoteFileSystemProxy
        def initialize
          @cache = {}
          @file_system = RemoteFileSystem.new
        end

        def read_file(path)
          if @cache.key?(path)
            puts "Reading file from cache: #{path}"
            @cache[path]
          else
            puts "Reading file from remote file system: #{path}"
            file_contents = @file_system.read_file(path)
            @cache[path] = file_contents
            file_contents
          end
        end
      end

      # The client code can use the RemoteFileSystemProxy class to access and manage
      # files on the remote file system, with improved performance due to caching.
      file_system = RemoteFileSystemProxy.new

      # with improved performance due to caching.
      file_system.read_file('/path/to/file1')
      # Output: Reading file from cache: /path/to/file1

      file_system.read_file('/path/to/file2')
      # Output:

      # In this example, the RemoteFileSystemProxy class acts as a proxy for the RemoteFileSystem class, providing a simplified interface to the file
      # system on the remote server. It also implements caching to improve the performance of the file system application.
      #
      # The client code can use the RemoteFileSystemProxy class to access and manage files on the remote file system, and it will receive the benefits
      # of the proxy pattern, including improved performance due to caching.

    end

  end

end

# MixedDataStructures module for organizing mixeddatastructures implementations
module MixedDataStructures

  # Cache module
  #
  # == Table of Contents
  # - LruCache
  # - LeastRecentlyUsedCacheSimple
  #
  module Cache

    # LruCache - Individual Topic
    # Source: mixed_data_structures/cache/LRU_cache.rb
    #
    # == Related Topics
    # - LeastRecentlyUsedCacheSimple
    #
    class LruCache

      # === Content from mixed_data_structures/cache/LRU_cache.rb ===

      class ListNode
        attr_accessor :key, :value, :prev, :next

        def initialize(key, value)
          @key = key
          @value = value
          @prev = nil
          @next = nil
        end
      end

      class LRUCache
        def initialize(capacity)
          @dic = {}  # key to node
          @capacity = capacity
          @head = ListNode.new(0, 0)
          @tail = ListNode.new(-1, -1)
          @head.next = @tail
          @tail.prev = @head
        end

        def show_order
          list = []
          node = @head
          while node
            list << [@head.key, @head.value]
            node = @head.next
          end
          puts list.to_s
        end
        def get(key)
          if @dic.key?(key)
            node = @dic[key]
            remove_from_list(node)
            insert_into_head(node)
            return node.value
          else
            return -1
          end
        end

        def put(key, value)
          if @dic.key?(key)
            node = @dic[key]
            remove_from_list(node)
            insert_into_head(node)
            node.value = value
          else
            if @dic.size > @capacity
              remove_from_tail
            end
            node = ListNode.new(key, value)
            @dic[key] = node
            insert_into_head(node)
          end
        end

        def remove_from_list(node)
          node.prev.next = node.next
          node.next.prev = node.prev
        end

        def insert_into_head(node)
          head_next = @head.next
          @head.next = node
          node.prev = @head
          node.next = head_next
          head_next.prev = node
        end

        def remove_from_tail
          return if @dic.empty?
          tail_node = @tail
          @dic.delete(tail_node.key)
          remove_from_list(tail_node)
        end
      end

      lru = LRUCache.new(5)
      lru.put('k1','v1')
      lru.put('k2','v2')
      lru.put('k3','v3')
      lru.put('k4','v4')
      lru.put('k5','v5')

      puts lru.get('k1')
      puts lru.get('k3')

      puts lru.show_order

    end

    # LeastRecentlyUsedCacheSimple - Individual Topic
    # Source: mixed_data_structures/cache/least_recently_used_cache_simple.rb
    # https://leetcode.com/problems/lru-cache/discuss/352295/Python3-doubly-linked-list-and-dictionary - official better solution non language specific
    #
    # == Related Topics
    # - LruCache
    #
    class LeastRecentlyUsedCacheSimple

      # === Content from mixed_data_structures/cache/least_recently_used_cache_simple.rb ===

      # https://leetcode.com/problems/lru-cache/discuss/352295/Python3-doubly-linked-list-and-dictionary - official better solution non language specific
      class LRUCache
        def initialize(capacity)
          @capacity = capacity
          @store = {} # ruby hash is ordered. First Element is Least Recently used. Last Element is most frequently used.
        end

        def get(key)
          val = @store.delete(key)
          return -1 if val.nil?
          @store[key] = val
          val
        end

        def put(key, value)
          if !@store[key] && @store.size == @capacity
            @store.shift
            @store[key] = value
          else
            _v = @store.delete(key)
            @store[key] = value
          end
        end

        def show_cache
          puts @store
        end
      end


      cache = LRUCache.new(4)
      cache.put('a', 1)
      cache.put('b', 2)
      cache.put('c', 3)
      cache.put('d', 4)
      cache.show_cache
      cache.get('b')
      cache.show_cache
      cache.put('e', 5)
      cache.show_cache

    end

  end

end

# PopularAlgorithms module for organizing popularalgorithms implementations
module PopularAlgorithms

  # Arrays module
  #
  # == Table of Contents
  # - BreakingChain
  # - InsertInterval
  # - MaxArea
  # - MinimumWindowSubstring
  # - SubarraySumEqualsK
  # - SortedArrays
  #
  module Arrays

    # BreakingChain - Individual Topic
    # Source: popular_algorithms/arrays/breaking_chain.rb
    # Problem
    #
    # An array A consisting of N integers is given.
    # The elements of array A together represent a chain, and each element represents the strength of each link in the chain.
    # We want to divide this chain into three smaller chains. All we can do is break the chain in exactly two non-adjacent positions.
    # More precisely, we should break links P,Q (0 < P < Q < N - 1, Q - P > 1), resulting in three chains [0, P - 1], [P   1, Q - 1], [Q   1, N - 1].
    # The total cost of this operation is equal to A[P]   A[Q].
    #
    # For example, consider an array such that:
    #
    # A[0] = 5
    # A[1] = 2
    # A[2] = 4
    # A[3] = 6
    # A[4] = 3
    # A[5] = 7
    # We can choose to break the following links:
    #
    #                                        (1-3): total cost is 2   6 = 8
    # (1-4): total cost is 2   3 = 5
    # (2-4): total cost is 4   3 = 7
    # Write a function class Solution { public int solution(int[] A); } that, given an array A of N integers, returns the minimal cost of dividing the chain into three pieces. Given the example above, the function should return 5.
    #
    #
    # == Related Topics
    # - InsertInterval
    # - MaxArea
    # - MinimumWindowSubstring
    # - SubarraySumEqualsK
    #
    class BreakingChain

      # === Content from popular_algorithms/arrays/breaking_chain.rb ===

      # Problem
      #
      # An array A consisting of N integers is given.
      # The elements of array A together represent a chain, and each element represents the strength of each link in the chain.
      # We want to divide this chain into three smaller chains. All we can do is break the chain in exactly two non-adjacent positions.
      # More precisely, we should break links P,Q (0 < P < Q < N - 1, Q - P > 1), resulting in three chains [0, P - 1], [P   1, Q - 1], [Q   1, N - 1].
      # The total cost of this operation is equal to A[P]   A[Q].
      #
      # For example, consider an array such that:
      #
      # A[0] = 5
      # A[1] = 2
      # A[2] = 4
      # A[3] = 6
      # A[4] = 3
      # A[5] = 7
      # We can choose to break the following links:
      #
      #                                        (1-3): total cost is 2   6 = 8
      # (1-4): total cost is 2   3 = 5
      # (2-4): total cost is 4   3 = 7
      # Write a function class Solution { public int solution(int[] A); } that, given an array A of N integers, returns the minimal cost of dividing the chain into three pieces. Given the example above, the function should return 5.

      def breaking_chain(a)
        cap = a.size
        min_cost_cut = 0

        for i in 1..cap-2
          for j in 1..cap-2
            if j - i >= 2
              cost = a[i] + a[j]
              if min_cost_cut == 0 || min_cost_cut > cost
                min_cost_cut = cost
              end
            end
          end
        end

        #puts "Minimum Cost of dividing is from: #{from} to: #{to} is: #{min_cost_cut}"

        return min_cost_cut
      end

      def breaking_chain_optimized(chain)
        from, to, prev_best = 1, 3, 1 # cheapest link _at least two links behind to_
        cheapest = Float::INFINITY

        (3...chain.length - 1).each do |i|
          prev_best = i - 2 if chain[i - 2] < chain[prev_best]
          cost = chain[i] + chain[prev_best]

          if cost < cheapest
            from = prev_best
            to = i
            cheapest = cost
          end
        end

        cheapest
      end




      puts solve_O_N([5,2,4,7,3,7]).to_s

    end

    # InsertInterval - Individual Topic
    # Source: popular_algorithms/arrays/insert_interval.rb
    # https://leetcode.com/problems/insert-interval/description/
    # Solution summary:
    # -
    #
    # == Related Topics
    # - BreakingChain
    # - MaxArea
    # - MinimumWindowSubstring
    # - SubarraySumEqualsK
    #
    class InsertInterval

      # === Content from popular_algorithms/arrays/insert_interval.rb ===

      # https://leetcode.com/problems/insert-interval/description/
      # Solution summary:
      # -
      def insert(intervals, new_interval)
        result = []
        i = 0
        size =  intervals.size

        # skip all the intervals that ends before the new interval starts
        while i < size && intervals[i].last < new_interval.first
          result << intervals[i]
          i += 1
        end

        # we have a match
        # merge all intervals that overlap with 'new_interval'
        # the current interval starts before the new interval ends
        while i < size && intervals[i].first <= new_interval.last
          new_interval[0] = [intervals[i][0], new_interval[0]].min
          new_interval[1] = [intervals[i][1], new_interval[1]].max
          i += 1
        end

        # merge the new_interval
        result << new_interval

        # add the left over intervals to the result
        while i < size
          result << intervals[i]
          i += 1
        end

        result
      end

      intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
      new_interval = [4,8]

      puts insert(intervals, new_interval).to_s
      # [[1, 2], [3, 10], [12, 16]]

    end

    # MaxArea - Individual Topic
    # Source: popular_algorithms/arrays/max_area.rb
    # https://leetcode.com/problems/container-with-most-water/
    # measure container with the most water
    #
    # @param {Integer[]} height
    # @return {Integer}
    #
    # == Related Topics
    # - BreakingChain
    # - InsertInterval
    # - MinimumWindowSubstring
    # - SubarraySumEqualsK
    #
    class MaxArea

      # === Content from popular_algorithms/arrays/max_area.rb ===

      # https://leetcode.com/problems/container-with-most-water/
      # measure container with the most water

      # @param {Integer[]} height
      # @return {Integer}
      def max_area(height)
        left, right = 0, height.size - 1
        water = 0
        while left < right
          current_water = (right - left) * [height[left], height[right]].min
          water = [water, current_water].max
          if height[left] < height[right]
            left += 1
          else
            right -= 1
          end
        end
        water
      end


      puts max_area([[1,8,6,2,5,4,8,3,7]]) == 49

    end

    # MinimumWindowSubstring - Individual Topic
    # Source: popular_algorithms/arrays/minimum_window_substring.rb
    # https://leetcode.com/problems/minimum-window-substring/
    # Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".
    # The testcases will be generated such that the answer is unique.
    # A substring is a contiguous sequence of characters within the string.
    # @topics
    #   two_pointers,windows
    # @example
    #  Input: s = "ADOBECODEBANC", t = "ABC"
    #  Output: "BANC"
    #  Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
    #
    #  Input: s = "a", t = "a"
    #  Output: "a"
    #  Explanation: The entire string s is the minimum window.
    #
    #  Input: s = "a", t = "aa"
    #  Output: ""
    #  Explanation: Both 'a's from t must be included in the window.
    #  Since the largest window of s only has one 'a', return empty string.
    #
    # == Related Topics
    # - BreakingChain
    # - InsertInterval
    # - MaxArea
    # - SubarraySumEqualsK
    #
    class MinimumWindowSubstring

      # === Content from popular_algorithms/arrays/minimum_window_substring.rb ===

      # https://leetcode.com/problems/minimum-window-substring/
      # Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".
      # The testcases will be generated such that the answer is unique.
      # A substring is a contiguous sequence of characters within the string.
      # @topics
      #   two_pointers,windows
      # @example
      #  Input: s = "ADOBECODEBANC", t = "ABC"
      #  Output: "BANC"
      #  Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
      #
      #  Input: s = "a", t = "a"
      #  Output: "a"
      #  Explanation: The entire string s is the minimum window.
      #
      #  Input: s = "a", t = "aa"
      #  Output: ""
      #  Explanation: Both 'a's from t must be included in the window.
      #  Since the largest window of s only has one 'a', return empty string.
      def minimum_window_substring(s, t)
        return "" unless t || s

        # count all the unique characters and store in hash of "t". This will be used for comparison throughout.
        dict_t = t.chars.tally
        # count of required characters minimally. If formed == required, this window has all the required characters.
        required = dict_t.size
        formed = 0

        l = r = 0

        # this hash stores the current window of characters
        window_counts = {}

        # tuples of answers, [smallest window, left pointer, right pointer]
        ans = Float::INFINITY, nil, nil
        while r < s.size do
          # add one character from the right to the current window
          character = s[r]
          window_counts[character] = window_counts.fetch(character, 0) + 1

          # if the frequency of the current character added equals to the desired count in "t", then we increment "formed"
          # formed is used to decide if the inner loop will be entered
          if dict_t[character] && window_counts[character] == dict_t[character]
            formed += 1
          end

          # contract the left pointer if possible. Since formed == required, we can also store
          # our answers intermediately. If multiple answers were found, we store only the one
          # that has least amount of characters.
          while l <= r and formed == required
            character = s[l]

            if r - l + 1 < ans[0]
              ans = r - l + 1, l, r
            end

            # because we move the left pointer at the end of the loop, we update the window_counts
            window_counts[character] -= 1
            # if the left pointer is currently a required character, we will deduct formed and stop
            # contracting left pointer at the end of this loop.
            if dict_t[character] and window_counts[character] < dict_t[character]
              formed -= 1
            end
            # since we already found the answer at least one time, we will move the left pointer.
            l += 1
          end
          # keep expanding the right pointer to change the window.
          r += 1
        end

        if ans[0] == Float::INFINITY
          return ""
        else
          s[ans[1], ans[2] - ans[1] + 1]
        end
      end

      puts minimum_window_substring("ADOBECODEBANC", "ABC")
      puts minimum_window_substring("abc", "b")
      puts minimum_window_substring("B", "A")

    end

    # SubarraySumEqualsK - Individual Topic
    # Source: popular_algorithms/arrays/subarray_sum_equals_k.rb
    # https://leetcode.com/problems/subarray-sum-equals-k/
    #
    # First of all, the basic idea behind this code is that, whenever the sums has increased by a value of k, we've found a subarray of sums=k.
    # I'll also explain why we need to initialise a 0 in the hashmap.
    #
    # Example: Let's say our elements are [1,2,1,3] and k = 3. <br>
    # And our corresponding running sums = [1,3,4,7]. <br>
    # Now, if you notice the running sums array, from 1->4, there is increase of k and from 4->7, there is an increase of k. So, we've found 2 subarrays of sums=k.
    #
    # But, if you look at the original array, there are 3 subarrays of sums==k. Now, you'll understand why 0 comes in the picture.
    #
    # In the above example, 4-1=k and 7-4=k. Hence, we concluded that there are 2 subarrays.
    # However, if sums==k, it should've been 3-0=k. But 0 is not present in the array. To account for this case, we include the 0.
    # Now the modified sums array will look like [0,1,3,4,7]. Now, try to see for the increase of k.
    #
    # - 0->3
    # - 1->4
    # - 4->7
    # Hence, 3 sub arrays of sums=k
    # This clarified some confusions I had while doing this problem.
    #
    # == Related Topics
    # - BreakingChain
    # - InsertInterval
    # - MaxArea
    # - MinimumWindowSubstring
    #
    class SubarraySumEqualsK

      # === Content from popular_algorithms/arrays/subarray_sum_equals_k.rb ===

      # https://leetcode.com/problems/subarray-sum-equals-k/
      #
      # First of all, the basic idea behind this code is that, whenever the sums has increased by a value of k, we've found a subarray of sums=k.
      # I'll also explain why we need to initialise a 0 in the hashmap.
      #
      # Example: Let's say our elements are [1,2,1,3] and k = 3. <br>
      # And our corresponding running sums = [1,3,4,7]. <br>
      # Now, if you notice the running sums array, from 1->4, there is increase of k and from 4->7, there is an increase of k. So, we've found 2 subarrays of sums=k.
      #
      # But, if you look at the original array, there are 3 subarrays of sums==k. Now, you'll understand why 0 comes in the picture.
      #
      # In the above example, 4-1=k and 7-4=k. Hence, we concluded that there are 2 subarrays.
      # However, if sums==k, it should've been 3-0=k. But 0 is not present in the array. To account for this case, we include the 0.
      # Now the modified sums array will look like [0,1,3,4,7]. Now, try to see for the increase of k.
      #
      # - 0->3
      # - 1->4
      # - 4->7
      # Hence, 3 sub arrays of sums=k
      # This clarified some confusions I had while doing this problem.
      def subarray_sum_equals_k(nums, k)
        ans = 0
        pref_sum = 0
        d = { 0 => 1 }
        nums.each do |num|
          pref_sum = pref_sum + num
          if d[pref_sum - k]
            ans = ans + d[pref_sum - k]
          end
          d[pref_sum] = d.fetch(pref_sum, 0) + 1
        end
        ans
      end

      puts subarray_sum_equals_k([1, 2, 1, 3], 3) # subarray are [1,2] [2,1] [3]: Answer is 3
      puts subarray_sum_equals_k([5, 2, 7, 9, 10, -4, 5, 7, 0, 4, 3, 6], 7) # [5,2] [7] [7] [7,0] [0,4,3] [4,3] # Answer is 6

    end

    # BinarySearch - Individual Topic
    # Source: popular_algorithms/arrays/sorted_arrays/binary_search.rb
    #
    # == Related Topics
    # - MergedSortedArrays
    # - MinEatingSpeed
    # - SingleNonDuplicate
    # - SortedRemoveDuplicates
    #
    class BinarySearch

      # === Content from popular_algorithms/arrays/sorted_arrays/binary_search.rb ===

      def binary_search(arr, val)
        search = partition(arr, 0, (arr.length), val)
        return -1 if search.nil?
        search
      end

      def partition(arr, start, last, val)
        median = (start + last) / 2
        # condition for exiting the function if the value is not in the array at all.
        return nil if start == last && arr[median] != val

        return median if arr[median] == val
        median_remainder = (arr.length - 1) % 2
        if median_remainder
          if arr[median + median_remainder] == val
            return median + 1
          end
        end

        if arr[median] > val
          return partition(arr, start, median, val)
        elsif arr[median] <  val
          return partition(arr, median+1, last, val)
        end
      end

      def lo_hi_binary_search(arr, target)
        low = 0
        high = arr.length - 1

        while low <= high
          mid = (low + high) / 2
          if arr[mid] == target
            return mid
          elsif arr[mid] < target
            low = mid + 1
          else
            high = mid - 1
          end
        end

        return -1
      end


      arr = [1, 2, 3, 4, 5, 6]


      ################ Assertions
      # out of index, left most
      puts binary_search(arr, 0) == -1
      # out of index, right most
      puts binary_search(arr, 9) == -1
      # value is present, show the left most value
      puts binary_search(arr, 2) == 1
      # happy path
      puts binary_search(arr, 3) == 2

      puts lo_hi_binary_search(arr, 6)

    end

    # MergedSortedArrays - Individual Topic
    # Source: popular_algorithms/arrays/sorted_arrays/merged_sorted_arrays.rb
    # https://leetcode.com/explore/featured/card/top-interview-questions-easy/96/sorting-and-searching/587/
    # The problem only allows modification of inplace algorithms... TC O(n+m), SC O(1)
    #
    # == Related Topics
    # - BinarySearch
    # - MinEatingSpeed
    # - SingleNonDuplicate
    # - SortedRemoveDuplicates
    #
    class MergedSortedArrays

      # === Content from popular_algorithms/arrays/sorted_arrays/merged_sorted_arrays.rb ===

      # https://leetcode.com/explore/featured/card/top-interview-questions-easy/96/sorting-and-searching/587/
      # The problem only allows modification of inplace algorithms... TC O(n+m), SC O(1)
      def merge_sorted_arrays(nums1, m, nums2, n)
        while m > 0 and n > 0
          if nums1[m - 1] > nums2[n - 1]
            nums1[m + n - 1] = nums1[m - 1]
            m -= 1
          else
            nums1[m + n - 1] = nums2[n - 1]
            n -= 1
          end
        end
        while n > 0
          nums1[n - 1] = nums2[n - 1]
          n -= 1
        end
      end

      nums1 = [1, 2, 3, 0, 0, 0]
      m = 3
      nums2 = [2, 5, 6]
      n = 3

      merge_sorted_arrays(nums1, m, nums2, n)
      puts nums1

    end

    # MinEatingSpeed - Individual Topic
    # Source: popular_algorithms/arrays/sorted_arrays/min_eating_speed.rb
    # https://leetcode.com/problems/koko-eating-bananas/
    #
    #
    # == Related Topics
    # - BinarySearch
    # - MergedSortedArrays
    # - SingleNonDuplicate
    # - SortedRemoveDuplicates
    #
    class MinEatingSpeed

      # === Content from popular_algorithms/arrays/sorted_arrays/min_eating_speed.rb ===

      # https://leetcode.com/problems/koko-eating-bananas/

      def min_eating_speed(piles, h)
        low = 1
        high = piles.max
        while low <= high
          return low if low == high
          mid = (low + high) / 2
          if check_able_finish(piles, h, mid)
            high = mid
          else
            low = mid + 1
          end
        end
        low
      end

      def check_able_finish(piles, h, k)
        sum = 0
        piles.each do |pile|
          sum += (pile / k)
          sum += 1 if pile % k != 0
          return false if sum > h
        end
        true
      end

      puts min_eating_speed([3, 6, 7, 11], 8) # 4
      puts min_eating_speed([30, 11, 23, 4, 20], 5) # 30
      puts min_eating_speed([30, 11, 23, 4, 20], 6) # 23

    end

    # SingleNonDuplicate - Individual Topic
    # Source: popular_algorithms/arrays/sorted_arrays/single_non_duplicate.rb
    # https://leetcode.com/problems/single-element-in-a-sorted-array/description/
    #
    # == Related Topics
    # - BinarySearch
    # - MergedSortedArrays
    # - MinEatingSpeed
    # - SortedRemoveDuplicates
    #
    class SingleNonDuplicate

      # === Content from popular_algorithms/arrays/sorted_arrays/single_non_duplicate.rb ===

      # https://leetcode.com/problems/single-element-in-a-sorted-array/description/
      require "./support_tools/easy_benchmark"


      def iter_single_non_duplicate(nums)
        index = 0
        while index < nums.size - 1 do
          num = nums[index]
          if num == nums[index + 1]
            index += 1
          else
            return num
          end
          index += 1
        end
        nums.last
      end

      def binary_single_non_duplicate(nums)
        lo, hi = 0, nums.size - 1

        while lo < hi
          mid = ( lo + hi ) / 2
          # we always check for even index
          # if the left part (lo..mid) doesn't have single element
          # then mid, mid + 1 should be a repeating pair
          mid -= 1 if mid.odd?

          # if we didn't find a pair, the single element should be on the left
          if nums[mid] != nums[mid + 1]
            hi = mid
          else
            lo = mid + 2
          end
        end

        nums[lo]
      end

      EasyBenchmark.iterations = 10000
      EasyBenchmark.benchmark_time(["iter_single_non_duplicate", "binary_single_non_duplicate"], [3,3,7,7,10,11,11,12,12])



    end

    # SortedRemoveDuplicates - Individual Topic
    # Source: popular_algorithms/arrays/sorted_arrays/sorted_remove_duplicates.rb
    # excellente algorithm removing duplicates from a sorted array.
    #
    #
    # == Related Topics
    # - BinarySearch
    # - MergedSortedArrays
    # - MinEatingSpeed
    # - SingleNonDuplicate
    #
    class SortedRemoveDuplicates

      # === Content from popular_algorithms/arrays/sorted_arrays/sorted_remove_duplicates.rb ===

      # excellente algorithm removing duplicates from a sorted array.

      def sorted_remove_duplicates(nums)
        if nums.length == 0
          return 0
        end

        count = 1

        for i in 1...nums.length
          if nums[i] != nums[i - 1]
            nums[count] = nums[i]
            count += 1
          end
        end

        nums.slice!(count..nums.length)
        return nums
      end

      puts remove_duplicates([1,1,1,3,3,3,4,5,6,7,8,9, 12, 9100, 9200, 10000])

    end

  end

  # Backtracking module
  #
  # == Table of Contents
  # - LetterCombinationsOfAPhoneNumber
  # - PalindromePartitioning
  # - RemoveInvalidParentheses
  # - RestoreIpAddresses
  # - Subsets
  #
  module Backtracking

    # LetterCombinationsOfAPhoneNumber - Individual Topic
    # Source: popular_algorithms/backtracking/letter_combinations_of_a_phone_number.rb
    # @param {String} digits
    # @return {String[]}
    #
    # https://leetcode.com/explore/interview/card/facebook/53/recursion-3/267/discuss/780232/Backtracking-Python-problems+-solutions-interview-prep
    # https://leetcode.com/problems/letter-combinations-of-a-phone-number/
    # https://www.youtube.com/watch?v=Zq4upTEaQyM # how to backtrack
    #
    # == Related Topics
    # - PalindromePartitioning
    # - RemoveInvalidParentheses
    # - RestoreIpAddresses
    # - Subsets
    #
    class LetterCombinationsOfAPhoneNumber

      # === Content from popular_algorithms/backtracking/letter_combinations_of_a_phone_number.rb ===

      # @param {String} digits
      # @return {String[]}

      # https://leetcode.com/explore/interview/card/facebook/53/recursion-3/267/discuss/780232/Backtracking-Python-problems+-solutions-interview-prep
      # https://leetcode.com/problems/letter-combinations-of-a-phone-number/
      # https://www.youtube.com/watch?v=Zq4upTEaQyM # how to backtrack
      def letter_combinations_of_a_phone_number(digits)
        digit_to_chars = {
          "2" => ["a", "b", "c"],
          "3" => ["d", "e", "f"],
          "4" => ["g", "h", "i"],
          "5" => ["j", "k", "l"],
          "6" => ["m", "n", "o"],
          "7" => ["p", "q", "r", "s"],
          "8" => ["t", "u", "v"],
          "9" => ["w", "x", "y", "z"]
        }
        results = []
        return results if digits.empty?

        # methods in ruby have closure, cannot access variables outside of the methods. But lambdas, Proc, stabby arrow (->) can .
        backtrack = lambda do |i, current_string|
          # puts "i: #{i}, current_string, #{current_string}"
          if current_string.size == digits.size
            results << current_string
            return
          end
          digit_to_chars[digits[i]].each do |c|
            backtrack.call(i + 1, current_string + c )
          end
        end

        backtrack.call(0, "")
        results
      end


      res = letter_combinations_of_a_phone_number("234")
      puts res.to_s

    end

    # PalindromePartitioning - Individual Topic
    # Source: popular_algorithms/backtracking/palindrome_partitioning.rb
    # https://leetcode.com/problems/palindrome-partitioning/description/
    #
    #
    # == Related Topics
    # - LetterCombinationsOfAPhoneNumber
    # - RemoveInvalidParentheses
    # - RestoreIpAddresses
    # - Subsets
    #
    class PalindromePartitioning

      # === Content from popular_algorithms/backtracking/palindrome_partitioning.rb ===

      # https://leetcode.com/problems/palindrome-partitioning/description/

      def partition(s)
        result = []
        backtrack(s, [], result)
        result
      end

      def backtrack(s, curr, result)
        if s.size == 0
          result << curr.dup
        end

        sample = ""
        s.each_char.with_index do |char, index|
          sample += char
          backtrack(s[(index+1)..-1], curr + [sample], result) if is_palindrome(sample)
        end
      end

      def is_palindrome(s)
        s == s.reverse
      end

      puts partition("aab").to_s

    end

    # RemoveInvalidParentheses - Individual Topic
    # Source: popular_algorithms/backtracking/remove_invalid_parentheses.rb
    #
    # == Related Topics
    # - LetterCombinationsOfAPhoneNumber
    # - PalindromePartitioning
    # - RestoreIpAddresses
    # - Subsets
    #
    class RemoveInvalidParentheses

      # === Content from popular_algorithms/backtracking/remove_invalid_parentheses.rb ===

      require 'set'

      # https://leetcode.com/problems/remove-invalid-parentheses/
      # @topics algorithms -
      #   - backtracking
      #   - recursion
      def remove_invalid_parentheses(s)
        # Initialize a queue to store the strings that need to be processed
        queue = [s]
        # Initialize a set to store the strings that have already been processed
        visited = Set.new
        # Initialize a flag to keep track of whether we have found a valid string
        found = false
        results = []
        # Loop through the queue
        while !queue.empty? do
          # Get the next string from the queue
          str = queue.shift
          # Check if the string is valid
          if valid_string?(str)
            # If it is valid, add it to the results and set the found flag to true
            found = true
            results << str
          end
          # If we have already found a valid string, we can stop processing the queue
          next if found
          # Otherwise, we need to remove one character at a time and add the modified strings to the queue
          (0...str.length).each do |i|
            # Only consider removing characters that are parentheses
            next unless str[i] == '(' || str[i] == ')'
            # Remove the character at index i
            modified_str = str[0...i] + str[i+1..-1]
            # Skip this string if we have already processed it
            next if visited.include?(modified_str)
            # Add the modified string to the queue and the visited set
            queue << modified_str
            visited.add(modified_str)
          end
        end

        # Return the results
        results
      end

      # This helper function checks if a string is valid
      def valid_string?(str)
        # Initialize a counter to keep track of the number of open parentheses
        counter = 0
        # Loop through the characters in the string
        str.each_char do |c|
          # If we encounter an open parenthesis, increment the counter
          counter += 1 if c == '('
          # If we encounter a close parenthesis, decrement the counter
          counter -= 1 if c == ')'
          # If the counter becomes negative, the string is invalid
          return false if counter < 0
        end
        # If the counter is not zero, the string is invalid
        return counter == 0
      end

      # puts remove_invalid_parentheses(")(f")
      # puts remove_invalid_parentheses("())(()")
      puts remove_invalid_parentheses("()())()")

    end

    # RestoreIpAddresses - Individual Topic
    # Source: popular_algorithms/backtracking/restore_ip_addresses.rb
    # https://leetcode.com/problems/restore-ip-addresses/description/
    #
    # each number need to be between 0-255.
    # you must have 4 numbers separated by zero
    # the starting number should have not a zero in front unless it is 0 itself
    #
    # == Related Topics
    # - LetterCombinationsOfAPhoneNumber
    # - PalindromePartitioning
    # - RemoveInvalidParentheses
    # - Subsets
    #
    class RestoreIpAddresses

      # === Content from popular_algorithms/backtracking/restore_ip_addresses.rb ===

      # https://leetcode.com/problems/restore-ip-addresses/description/

      # each number need to be between 0-255.
      # you must have 4 numbers separated by zero
      # the starting number should have not a zero in front unless it is 0 itself
      def restore_ip_addresses(s)
        results = []
        backtrack(s.split(''), [], results)
        results
      end

      def backtrack(s, current_result, results)
        if s.length == 0
          results << current_result.join('.') if current_result.size == 4
          return
        end

        num = ''
        s.each_with_index do |char, index|
          num += char
          next if num.length > 1 && num[0] == '0'
          backtrack(s[(index + 1)..-1], current_result + [num], results) if num.to_i <= 255 && current_result.length < 4
        end

      end

      puts restore_ip_addresses("25525511135")

    end

    # Subsets - Individual Topic
    # Source: popular_algorithms/backtracking/subsets.rb
    # https://leetcode.com/problems/subsets/
    # @topics algorithms -
    #   - backtracking
    #   - permutations
    #
    # == Related Topics
    # - LetterCombinationsOfAPhoneNumber
    # - PalindromePartitioning
    # - RemoveInvalidParentheses
    # - RestoreIpAddresses
    #
    class Subsets

      # === Content from popular_algorithms/backtracking/subsets.rb ===

      # https://leetcode.com/problems/subsets/
      # @topics algorithms -
      #   - backtracking
      #   - permutations
      def subsets(nums)
        subsets = [[]]
        nums.each do |num|
          tmp_subset = []
          subsets.each do |i|
            tmp_subset << i + [num]
          end
          subsets += tmp_subset
        end
        subsets
      end

      # dfs method
      def subsets_dfs(nums)
        result = []
        dfs = lambda do |subset, index|
          if index == nums.size
            result.append(subset)
            return
          end
          dfs.call(subset + [nums[index]], index + 1)
          dfs.call(subset, index + 1)
        end

        dfs.call([], 0)
        result
      end

      subsets([1,2,3])

    end

  end

  # Dag module
  #
  # == Table of Contents
  # - DjikstraShortestPath
  #
  module Dag

    # DjikstraShortestPath - Individual Topic
    # Source: popular_algorithms/dag/djikstra_shortest_path.rb
    #
    # Dijkstra’s algorithm (pronounced “dike’ struh”)
    # Also known asTraveling salesman problem
    # https://www.youtube.com/watch?v=pVfj6mxhdMw
    #
    #
    ## Start ##
    # Let distance of start vertex from start vertex = 0
    # Let distance of all other vertices from start = infinity
    #
    ## Algorithm ##
    # WHILE vertices remain unvisited
    #   Visit unvisited vertex with the smallest known distance from the start vertex (call this the current vertex)
    #   FOR each unvisited neighbour of the currente vertex
    #     Calculate the distance from the start vertex
    #     If the calculated distance of this vertex is less than the known distance
    #       Update the shortest distance of this vertex
    #       Update the previous vertex with the current vertex
    #     end if
    #     NEXT unvisited neighbour
    #     Add the current vertex to the list of visited vertices
    # END WHILE
    #
    # rdoc-image:assets/djikstra_shortest_path.png
    class DjikstraShortestPath

      # === Content from popular_algorithms/dag/djikstra_shortest_path.rb ===

      # frozen_string_literal: true

      # Dijkstra’s algorithm (pronounced “dike’ struh”)
      # Also known asTraveling salesman problem
      # https://www.youtube.com/watch?v=pVfj6mxhdMw
      #
      #
      ## Start ##
      # Let distance of start vertex from start vertex = 0
      # Let distance of all other vertices from start = infinity

      ## Algorithm ##
      # WHILE vertices remain unvisited
      #   Visit unvisited vertex with the smallest known distance from the start vertex (call this the current vertex)
      #   FOR each unvisited neighbour of the currente vertex
      #     Calculate the distance from the start vertex
      #     If the calculated distance of this vertex is less than the known distance
      #       Update the shortest distance of this vertex
      #       Update the previous vertex with the current vertex
      #     end if
      #     NEXT unvisited neighbour
      #     Add the current vertex to the list of visited vertices
      # END WHILE

      # rdoc-image:assets/djikstra_shortest_path.png
      class City
        attr_accessor :name, :routes

        def initialize(name)
          @name = name
          # For the adjacent nodes, we are now using a hash table
          # instead of an array:
          @routes = {}
          # As an example, if this were Atlanta, its routes would be:
          # {boston => 100, denver => 160}
        end

        def add_route(city, price_info)
          @routes[city] = price_info
        end
      end

      atlanta = City.new('Atlanta')
      boston = City.new('Boston')
      chicago = City.new('Chicago')
      denver = City.new('Denver')
      el_paso = City.new('El Paso')

      atlanta.add_route(boston, 100)
      atlanta.add_route(denver, 160)
      boston.add_route(chicago, 120)
      boston.add_route(denver, 180)
      chicago.add_route(el_paso, 80)
      denver.add_route(chicago, 40)
      denver.add_route(el_paso, 140)

      def dijkstra(starting_city, other_cities)
        # The routes_from_city hash table below holds the data of all price_infos
        # from the given city to all other destinations, and the city which it
        # took to get there:
        routes_from_city = {}
        # The format of this data is:
        # {city => [price, other city which immediately precedes this city
        # along the path from the original city]}

        # In our example this will end up being:
        # {atlanta => [0, nil], boston => [100, atlanta], chicago => [200, denver],
        # denver => [160, atlanta], el_paso => [280, chicago]}

        # Since it costs nothing to get to the starting city from the starting city:
        routes_from_city[starting_city] = [0, starting_city]

        # When initializing our data, we set up all other cities having an
        # infinite cost - since the cost and the path to get to each other city
        # is currently unknown:
        other_cities.each do |city|
          routes_from_city[city] = [Float::INFINITY, nil]
        end
        # In our example, our data starts out as:
        # {atlanta => [0, nil], boston => [Float::INFINITY, nil],
        # chicago => [Float::INFINITY, nil],
        # denver => [Float::INFINITY, nil], el_paso => [Float::INFINITY, nil]}

        # We keep track of which cities we visited in this array:
        visited_cities = []

        # We begin visiting the starting city by making it the current_city:
        current_city = starting_city

        # We launch the heart of the algorithm, which is a loop that visits
        # each city:
        while current_city
          puts "Current_city: #{current_city.name}"
          # We officially visit the current city:
          visited_cities << current_city

          # We check each route from the current city:
          current_city.routes.each do |city, price_info|
            # If the route from the starting city to the other city
            # is cheaper than currently recorded in routes_from_city, we update it:
            next unless routes_from_city[city][0] > price_info + routes_from_city[current_city][0]

            routes_from_city[city] = [price_info + routes_from_city[current_city][0], current_city]
          end

          # We determine which city to visit next:
          current_city = nil
          cheapest_route_from_current_city = Float::INFINITY
          # We check all available routes:
          routes_from_city.each do |city, price_info|
            # if this route is the cheapest from this city, and it has not yet been
            # visited, it should be marked as the city we'll visit next:
            next unless price_info[0] < cheapest_route_from_current_city && !visited_cities.include?(city)

            cheapest_route_from_current_city = price_info[0]
            current_city = city
          end

        end

        routes_from_city
      end

      routes = dijkstra(atlanta, [boston, chicago, denver, el_paso])
      routes.each do |city, price_info|
        p "#{city.name}: #{price_info[0]}"
      end

    end

  end

  # Documentation from popular_algorithms/dynamic_programming/Fibonacci.md
  #
  # Fibonacci Non Optimized Visualization
  # rdoc-image:assets/fib_non_opt.png
  #
  #
  # == Table of Contents
  # - BestTeamScore
  # - BestTimeToSellAStock1
  # - CoinChange
  # - DynamicProgramming
  # - Fibonacci
  # - HouseRobber1
  # - HouseRobber2
  # - LongestCommonSubsequence
  # - MaxSubArray
  # - MaximalSquare
  # - MaximumLengthOfPairChain
  # - MaximumScore
  # - MinCostClimbingStairs
  # - MinDifficultyJobSchedule
  # - MinFlipsMonoIncr
  # - MinimumCoinChange
  # - NumDecodings
  # - NumDiceRolls
  #
  module DynamicProgramming

    # BestTeamScore - Individual Topic
    # Source: popular_algorithms/dynamic_programming/best_team_score.rb
    # https://leetcode.com/problems/best-team-with-no-conflicts/description/
    #
    # Summary:
    # Sum all the scores per age group that are equal or less than each other.
    #
    # == Related Topics
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class BestTeamScore

      # === Content from popular_algorithms/dynamic_programming/best_team_score.rb ===

      # https://leetcode.com/problems/best-team-with-no-conflicts/description/

      # Summary:
      # Sum all the scores per age group that are equal or less than each other.
      def best_team_score(scores, ages)
        @players = scores.zip(ages).sort_by(&:itself)

        @result = {}
        @players.each_with_index do |(score, age), index|
          younger_or_equal_age_max = @result.select { |age_previous, _| age_previous <= age }.values.max || 0
          @result[age] = younger_or_equal_age_max + score
        end

        @result.values.max
      end

      scores = [1,2,3,5]
      ages = [8,9,10,1]
      best_team_score(scores, ages).to_s

    end

    # BestTimeToSellAStock1 - Individual Topic
    # Source: popular_algorithms/dynamic_programming/best_time_to_sell_a_stock_1.rb
    # https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
    #
    #
    # == Related Topics
    # - BestTeamScore
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class BestTimeToSellAStock1

      # === Content from popular_algorithms/dynamic_programming/best_time_to_sell_a_stock_1.rb ===

      # https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

      def max_profit(prices)
        max_profit = 0
        min_price = Float::INFINITY
        prices.each do |price|
          min_price = price if price < min_price
          profit = price - min_price
          max_profit = [max_profit, profit].max
        end
        max_profit
      end

      puts max_profit([3, 0, 0])

    end

    # CoinChange - Individual Topic
    # Source: popular_algorithms/dynamic_programming/coin_change.rb
    # 322. Coin Change
    # https://leetcode.com/problems/coin-change/description/
    #
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class CoinChange

      # === Content from popular_algorithms/dynamic_programming/coin_change.rb ===

      # 322. Coin Change
      # https://leetcode.com/problems/coin-change/description/

      require 'set'

      # Approach 1: BFS
      # Time: O(n)
      # Space: O(n)

      # Approach 2: Recursion with memo (DP Top-Down)
      # Time: O(amount * n)
      # Space: O(amount)

      # Approach 3: DP (DP Bottom-Up)
      # Steps:
      # 1. We try to form the amount with every coin
      # 2. We take the min to form a previous amount (i - c) and check if dp[i - c] + 1 < dp[i], then update

      # dp[i] represents the min number of coins to make up amount i
      # Base case:
      # dp[0] = 0, which means that it takes a minimum 0 coins of any type to form amount 0

      # Recurrance relation:
      # for every coin in coins, dp[i] = min(dp[i - coin] + 1)
      # Meaning:
      # 1. We take min coins required to form amount (i - coin) and add 1, for all amounts from 1 upto given amount
      # 2. We update dp[i] with that amount if it is lesser than curr dp[i]

      # Example:
      # coin = [1, 2], amount = 3

      # If 1 coin wasn't added at the end ( dp[i - c] + 1 <--) , it'd have been bad. cuz of below flow.
      # c: 2
      # i = 1
      # idx:    0       1       2                 3
      # dp:     0       i < c   dp[2 - 1] == -1   dp[3 - 2] == -1
      #         0       -1      -1                -1

      # But since we have 1 coin, it'll look something like this.
      # c = 1
      # i:      0       1       2      3
      # bfore:  0      -1      -1     -1
      # dp:     0       1       2      3 [Just dp[i - 1] for each i, pretty simple

      # c: 2
      # i:      0       1       2                 3
      # dp:     0       i < c   dp[2 - 2] == 0   dp[3 - 2] == 1
      #         0       1       0 + 1            1 + 1

      # We return dp[3] == 2

      # printed from code
      # dp: [0, -1, -1, -1]
      #         i: 1 dp: [0, 1, -1, -1] dp[i - coin]: 0
      #         i: 2 dp: [0, 1, 2, -1] dp[i - coin]: 1
      #         i: 3 dp: [0, 1, 2, 3] dp[i - coin]: 2
      # dp: [0, 1, 2, 3]
      #         i: 2 dp: [0, 1, 1, 3] dp[i - coin]: 0
      #         i: 3 dp: [0, 1, 1, 2] dp[i - coin]: 1

      # Time: O(amount * n)
      # Space: O(amount)

      def coin_change_bfs(coins, amount)
        return 0 if amount.zero?

        q, visited = [[0, 0]], Set.new([0])
        while !q.empty?
          node, dist = q.shift

          coins.each do |coin|
            nxt_node = coin + node
            return dist + 1 if nxt_node == amount
            next if nxt_node > amount
            next if visited.include?(nxt_node)

            visited.add(nxt_node)
            q.push([nxt_node, dist + 1])
          end
        end

        -1
      end

      def coin_change_dfs(coins, amount)
        memo = {}
        res = dfs(coins, amount, memo)
        res == Float::INFINITY ? -1 : res
      end

      def dfs(coins, amount, memo)
        return 0 if amount == 0
        return memo[amount] if memo[amount]

        res = Float::INFINITY
        coins.each do |coin|
          next if amount < coin
          sub_res = dfs(coins, amount - coin, memo)
          res = [res, sub_res + 1].min
        end

        memo[amount] = res
      end

      # Approach 3: DP bottom-up
      # Clearer Code, DP Solution
      def coin_change_dp(coins, amount)
        return 0 if amount == 0
        dp = Array.new(amount + 1, Float::INFINITY)
        dp[0] = 0

        coins.each do |coin|
          1.upto(amount).each do |i|
            next if i < coin
            dp[i] = [dp[i], dp[i - coin] + 1].min
          end
        end

        dp[amount] == Float::INFINITY ? -1 : dp[amount]
      end

      # Fastest solution
      def coin_change_fastest(coins, amount)
        dp = Array.new(amount + 1, -1)
        dp[0] = 0

        coins.each do |c|
          # puts "dp: #{dp}"
          1.upto(amount) do |i|
            next if i < c || dp[i - c] == -1
            dp[i] = dp[i - c] + 1 if dp[i] == -1 || dp[i - c] + 1 < dp[i]
            # puts "\ti: #{i} dp: #{dp} dp[i - c]: #{dp[i - c]}"
          end
        end

        dp[amount]
      end

      def coin_change_recursion(denoms, change)
        # Use memoization to avoid recalculating
        @memo ||= {}
        return @memo[change] if @memo[change]
        best = nil
        min_coins = Float::INFINITY
        denoms = denoms.sort!.reverse()
        denoms.each do |coin|
          next if coin > change
          if change == coin
            current = [coin]
          else
            remaining = coin_change_recursion(denoms, change - coin)
            current = [coin] + remaining if remaining
          end
          if current && current.length < min_coins
            min_coins = current.length
            best = current
          end
        end
        @memo[change] = best
      end

      res = coin_change_recursion([4,3,1], 6)
      puts res.length
      puts coin_change_bfs([186, 419, 83, 408], 6249) == 20
      puts coin_change_bfs([1, 2, 5], 11) == 3
      puts coin_change_bfs([2], 3) == -1

      puts coin_change_dfs([186, 419, 83, 408], 6249) == 20
      puts coin_change_dfs([1, 2, 5], 11) == 3
      puts coin_change_dfs([2], 3) == -1

      puts coin_change_dp([186, 419, 83, 408], 6249) == 20
      puts coin_change_dp([1, 2, 5], 11) == 3
      puts coin_change_dp([2], 3) == -1
      puts coin_change_dp([1, 2], 3) == 2

      puts coin_change_fastest([186, 419, 83, 408], 6249) == 20
      puts coin_change_fastest([1, 2, 5], 11) == 3
      puts coin_change_fastest([2], 3) == -1
      puts coin_change_fastest([1, 2], 3) == 2

    end

    # DynamicProgramming - Individual Topic
    # Source: popular_algorithms/dynamic_programming/dynamic_programming.rb
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class DynamicProgramming

      # === Content from popular_algorithms/dynamic_programming/dynamic_programming.rb ===

      require '../popular_algorithms'
      module ::PopularAlgorithms::DynamicProgramming; end

    end

    # Fibonacci - Individual Topic
    # Source: popular_algorithms/dynamic_programming/fibonacci.rb
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class Fibonacci

      # === Content from popular_algorithms/dynamic_programming/fibonacci.rb ===

      require './support_tools/easy_benchmark'

      # naive approach
      def naive_fib(n)
        if n >= 0 and n <= 1
          n
        else
          naive_fib(n - 1) + naive_fib(n - 2)
        end
      end

      # top down
      def fibm(n, memo = { 0 => 0, 1 => 1 })
        if memo[n].nil?
          memo[n] = fibm(n - 1, memo) + fibm(n - 2, memo)
          # puts(memo)
        end
        memo[n]
      end

      # bottom up
      def fibi(n, memo = nil)
        a, b = 0, 1
        (2..n).each do
          a, b = b, a + b
        end
        b
      end

      test1 = ['Optimized', :fibm]
      test2 = ['Classic', :fibi]

      memo = { 0 => 0, 1 => 1 }

      EasyBenchmark.iterations = 100
      EasyBenchmark.benchmark_time([test1, test2], 30, memo)


    end

    # HouseRobber1 - Individual Topic
    # Source: popular_algorithms/dynamic_programming/house_robber_1.rb
    # https://leetcode.com/problems/house-robber/
    # https://leetcode.com/problems/house-robber/discuss/156523/From-good-to-great.-How-to-approach-most-of-DP-problems.
    #
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class HouseRobber1

      # === Content from popular_algorithms/dynamic_programming/house_robber_1.rb ===

      # https://leetcode.com/problems/house-robber/
      # https://leetcode.com/problems/house-robber/discuss/156523/From-good-to-great.-How-to-approach-most-of-DP-problems.

      def simple_rob(nums)
        prev = curr = 0
        nums.each { |num|
          temp = prev # This represents the nums[i-2]th value
          prev = curr # This represents the nums[i-1]th value
          curr = [num + temp, prev].max # Here we just plug into the formula
        }
        curr
      end

      puts simple_rob([1,0,0,1000,1002,2,3])

    end

    # HouseRobber2 - Individual Topic
    # Source: popular_algorithms/dynamic_programming/house_robber_2.rb
    # https://leetcode.com/problems/house-robber-ii/
    #
    # dynamic programming
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class HouseRobber2

      # === Content from popular_algorithms/dynamic_programming/house_robber_2.rb ===

      # https://leetcode.com/problems/house-robber-ii/

      # dynamic programming
      def rob(nums)
        return nums.max if nums.size <= 3
        [simple_rob(nums.slice(0, nums.size - 1)), simple_rob(nums.slice(1, nums.size))].max
      end

      def simple_rob(nums)
        prev = curr = 0
        nums.each { |num|
          temp = prev # This represents the nums[i-2]th value
          prev = curr # This represents the nums[i-1]th value
          curr = [num + temp, prev].max # Here we just plug into the formula
        }
        curr
      end

      puts rob([200,3,140,20,10])
      puts rob([[1,2,3,1]])
      puts rob([0])

    end

    # LongestCommonSubsequence - Individual Topic
    # Source: popular_algorithms/dynamic_programming/longest_common_subsequence.rb
    # https://leetcode.com/explore/featured/card/dynamic-programming/631/strategy-for-solving-dp-problems/4045/
    # https://leetcode.com/explore/featured/card/dynamic-programming/631/strategy-for-solving-dp-problems/4045/discuss/590781/From-Brute-Force-To-DP
    #
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class LongestCommonSubsequence

      # === Content from popular_algorithms/dynamic_programming/longest_common_subsequence.rb ===

      # https://leetcode.com/explore/featured/card/dynamic-programming/631/strategy-for-solving-dp-problems/4045/
      # https://leetcode.com/explore/featured/card/dynamic-programming/631/strategy-for-solving-dp-problems/4045/discuss/590781/From-Brute-Force-To-DP

      def longest_common_subsequence(text1, text2)
        memo = Array.new(text1.size) { Array.new(text2.size) }
        res = dp(text1, text2, 0, 0, memo)
        puts
        res
      end

      def dp(text1, text2, i, j, memo)
        # base case for exiting. When either text index reached the full size, that means it finished iterating
        if i == text1.size || j == text2.size
          return 0
        end

        unless memo[i][j].nil?
          return memo[i][j]
        end
        # when a matching text is found, increment both index
        if text1[i] == text2[j]
          return memo[i][j] = 1 + dp(text1, text2, i + 1, j + 1, memo)
        else
          return memo[i][j] = [dp(text1, text2, i + 1, j, memo), dp(text1, text2, i, j + 1, memo)].max
        end
      end

      puts longest_common_subsequence('bacdefg', 'aace')

    end

    # MaxSubArray - Individual Topic
    # Source: popular_algorithms/dynamic_programming/max_sub_array.rb
    # https://leetcode.com/explore/featured/card/top-interview-questions-easy/97/dynamic-programming/566/
    #
    # Explanation:
    # 1. We loop through all the numbers eventually. FOr each loop, we keep the current maximum, and the best maximum.
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class MaxSubArray

      # === Content from popular_algorithms/dynamic_programming/max_sub_array.rb ===

      # https://leetcode.com/explore/featured/card/top-interview-questions-easy/97/dynamic-programming/566/

      # Explanation:
      # 1. We loop through all the numbers eventually. FOr each loop, we keep the current maximum, and the best maximum.
      def max_sub_array(nums)
        best, curr = nums[0], 0
        nums.each do |n|
          curr = [n, curr+n].max #
          best = [best, curr].max
        end
        best
      end


      # puts max_sub_array([1]) == 1
      # puts max_sub_array([]) == 0
      puts max_sub_array([5,4,-1,7,8]) == 23

    end

    # MaximalSquare - Individual Topic
    # Source: popular_algorithms/dynamic_programming/maximal_square.rb
    # https://www.youtube.com/watch?v=6X7Ha2PrDmM
    # https://leetcode.com/problems/maximal-square/
    #
    # @param {Character[][]} matrix
    # @return {Integer}
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class MaximalSquare

      # === Content from popular_algorithms/dynamic_programming/maximal_square.rb ===

      # https://www.youtube.com/watch?v=6X7Ha2PrDmM
      # https://leetcode.com/problems/maximal-square/

      # @param {Character[][]} matrix
      # @return {Integer}
      def maximal_square_top_down(matrix)
        memo = Array.new(matrix.size) { Array.new(matrix[0].size) }
        dp(matrix, 0, 0, memo)
        memo.flatten.max ** 2
      end

      def dp(matrix, row, col, memo)
        if row >= matrix.size || col >= matrix[0].size
          return 0
        end

        if memo[row][col].nil?
          bottom_left = dp(matrix, row + 1, col, memo)
          top_right = dp(matrix, row, col + 1, memo)
          bottom_right = dp(matrix, row + 1, col + 1, memo)
          memo[row][col] = 0
          if matrix[row][col] == "1"
            memo[row][col] = 1 + [bottom_left, top_right, bottom_right].min
          end
        end
        memo[row][col]
      end

      def maximal_square_bottom_up(matrix)
        memo = Array.new(matrix.size + 1, 0) { Array.new(matrix[0].size + 1, 0) }
        max_side = 0
        matrix.each_with_index do |row_ele, row|
          row_ele.each_with_index do |col_ele, col|
            if matrix[row][col] == "1"
              memo[row+1][col+1] = [memo[row+1][col], memo[row][col+1], memo[row][col]].min + 1
              max_side = [memo[row+1][col+1], max_side].max
            end
          end
        end
        max_side ** 2
      end


      input = [["1", "0", "1", "0", "0"], ["1", "0", "1", "1", "1"], ["1", "1", "1", "1", "1"], ["1", "0", "0", "1", "0"]]
      input1 = [["1", "1", "1", "1", "1"], ["1", "1", "1", "1", "1"], ["0", "0", "0", "0", "0"], ["1", "1", "1", "1", "1"], ["1", "1", "1", "1", "1"]]
      input2 = [["1", "1", "1", "1"], ["1", "1", "1", "1"], ["1", "1", "1", "1"], ["1", "1", "1", "1"]]
      puts maximal_square_bottom_up(input)
      puts maximal_square_bottom_up(input) == maximal_square_top_down(input)

    end

    # MaximumLengthOfPairChain - Individual Topic
    # Source: popular_algorithms/dynamic_programming/maximum_length_of_pair_chain.rb
    # https://leetcode.com/problems/maximum-length-of-pair-chain/
    #
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class MaximumLengthOfPairChain

      # === Content from popular_algorithms/dynamic_programming/maximum_length_of_pair_chain.rb ===

      # https://leetcode.com/problems/maximum-length-of-pair-chain/

      def find_longest_chain(pairs)
        pairs.sort_by!(&:last)

        seq = 0
        prev = -10000

        pairs.each do |(i, j)|
          if i > prev
            seq += 1
            prev = j
          end
        end

        seq
      end


      puts find_longest_chain([[1,2],[2,3],[3,4]]) # 2
      puts find_longest_chain([[1,2],[7,8],[4,5]]) # 3
      puts find_longest_chain([[-10,-8],[8,9],[-5,0],[6,10],[-6,-4],[1,7],[9,10],[-4,7]]) # 4
      puts find_longest_chain([[-6,9],[1,6],[8,10],[-1,4],[-6,-2],[-9,8],[-5,3],[0,3]])  # 3

    end

    # MaximumScore - Individual Topic
    # Source: popular_algorithms/dynamic_programming/maximum_score.rb
    # https://leetcode.com/explore/learn/card/dynamic-programming/631/strategy-for-solving-dp-problems/4146
    #
    #2d
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class MaximumScore

      # === Content from popular_algorithms/dynamic_programming/maximum_score.rb ===

      # https://leetcode.com/explore/learn/card/dynamic-programming/631/strategy-for-solving-dp-problems/4146

      #2d
      def maximum_score_2d(nums, mult)
        n = nums.size
        m = mult.size
        dp = Array.new(n+1,0) {|| Array.new(m+1,0)}
        (m - 1).downto(0).each do |k|
          (k).downto(0).each do |i|
            dp[i][k] = [
              mult[k] * nums[i] + dp[i + 1][k + 1],
              mult[k] * nums[n - 1 - k + i] + dp[i][k + 1]
            ].max
          end
        end
        dp[0][0]
      end

      #1d


      puts maximum_score_2d([-5, -3, -3, -2, 7, 1], [-5, -3, -3, -2, 7, 1])

    end

    # MinCostClimbingStairs - Individual Topic
    # Source: popular_algorithms/dynamic_programming/min_cost_climbing_stairs.rb
    # https://leetcode.com/explore/learn/card/dynamic-programming/631/strategy-for-solving-dp-problems/4040/discuss/476388/4-ways-or-Step-by-step-from-Recursion-greater-top-down-DP-greater-bottom-up-DP-greater-fine-tuning
    # dynamic programming
    #
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class MinCostClimbingStairs

      # === Content from popular_algorithms/dynamic_programming/min_cost_climbing_stairs.rb ===

      # https://leetcode.com/explore/learn/card/dynamic-programming/631/strategy-for-solving-dp-problems/4040/discuss/476388/4-ways-or-Step-by-step-from-Recursion-greater-top-down-DP-greater-bottom-up-DP-greater-fine-tuning
      # dynamic programming

      def min_cost_climbing_stairs(cost)
        n = cost.size
        memo = { -1 => 0, -2 => 0 }
        [min_cost(cost, n - 1, memo), min_cost(cost, n - 2, memo)].min
      end

      def min_cost(cost, n, memo)
        return 0 if n < 0
        return memo[n] unless memo[n].nil?
        memo[n] = cost[n] + [min_cost(cost, n - 1, memo), min_cost(cost, n - 2, memo)].min
        memo[n]
      end

      puts min_cost_climbing_stairs([10, 15, 20]) == 15
      puts min_cost_climbing_stairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]) == 6
      puts min_cost_climbing_stairs([0, 1, 1, 1])
      puts min_cost_climbing_stairs([0, 1, 1, 1]) == 1

    end

    # MinDifficultyJobSchedule - Individual Topic
    # Source: popular_algorithms/dynamic_programming/min_difficulty_job_schedule.rb
    # rdoc-image:assets/minimum_job_schedule.gif
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class MinDifficultyJobSchedule

      # === Content from popular_algorithms/dynamic_programming/min_difficulty_job_schedule.rb ===

      require './dynamic_programming'

      module PopularAlgorithms::DynamicProgramming
        # https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule/
        module MinimumDifficultyOfAJobSchedule
          class << self
            def min_difficulty_top_down(job_difficulty, day)
              $job_difficulty = job_difficulty
              $num_jobs = job_difficulty.size
              return -1 if $num_jobs < day
              memo = {}
              ans = dp(day, 0, memo)
              ans
            end

            # @note Recursion portion of the Top Down method.
            # rdoc-image:assets/minimum_job_schedule.gif
            def dp(day, cut, memo)
              if memo["#{day},#{cut}"]
                return memo["#{day},#{cut}"]
              end
              if day == 1
                return $job_difficulty.slice(cut, $job_difficulty.size).max
              end

              max_so_far = 0
              answer = Float::INFINITY
              # calculates the maximum element we can work up to.
              # FORMULA:  0 < maximum elements  < (job_difficulty.size  - days(remaining))
              # You always want to leave some jobs for the remaining days, so you stop iterating up to the formula
              # Ex: Suppose you input is like this
              #   jobs: [7,1,7,1,7,1]
              #   days: 2
              #   day 1: iterate elements index 0 - 4 which is [7,1,7,1,7]. Now there is task [1] left.
              #   day 2: you need to leave at least 1 task for the last day [1], so just return this.
              cut.upto($num_jobs - day) do |j|
                max_so_far = [max_so_far, $job_difficulty[j]].max
                answer = [answer, max_so_far + dp(day - 1, j + 1, memo)].min
              end
              memo["#{day},#{cut}"] = answer
              answer
            end

            # fastest solution on LeetCode. Quite smart, creating a Proc on the fly in order to get access to all the variables.
            def min_difficulty_leet_code(job_difficulty, d)
              jobs = job_difficulty
              days = d - 1
              return -1 if jobs.length < days

              rec = -> (job, day) do
                days_remaining = days - day
                jobs_remaining = jobs.length - job
                jobs_remaining_for_day = jobs_remaining - days_remaining
                puts "job: #{job}"
                if days_remaining == 0
                  return jobs.slice(job, jobs.size).max
                end
                (1..jobs_remaining_for_day).map do |j|
                  jobs[job..(job + j)].max + rec.call(job + j, day + 1)
                end.min
              end

              rec.call(0, 0)
            end
          end
        end
      end

      ns = PopularAlgorithms::DynamicProgramming::MinimumDifficultyOfAJobSchedule
      puts ns.min_difficulty_top_down([7, 1, 7, 1, 7, 1], 2)
      puts ns.min_difficulty_top_down([6, 5, 4, 3, 2, 1], 3)
      puts ns.min_difficulty_top_down([1, 2, 3, 4, 5, 6], 3)


    end

    # MinFlipsMonoIncr - Individual Topic
    # Source: popular_algorithms/dynamic_programming/min_flips_mono_incr.rb
    # https://leetcode.com/problems/flip-string-to-monotone-increasing/description/
    #
    # non dp method
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinimumCoinChange
    # - NumDecodings
    # - NumDiceRolls
    #
    class MinFlipsMonoIncr

      # === Content from popular_algorithms/dynamic_programming/min_flips_mono_incr.rb ===

      # https://leetcode.com/problems/flip-string-to-monotone-increasing/description/

      # non dp method
      def min_flips_mono_incr(s)
        cur = s.count('0')
        ans = cur
        s.each_char do |c|
          if c == '0'
            cur -= 1
          else
            cur += 1
          end
          ans = cur if ans > cur
        end
        ans
      end

      # dp method
      def dp_min_flips_mono_incr(s)
        dp = []
        ones = 0
        s.each_char.with_index do |c, i|
          if i == 0
            dp[0] = 0
          else
            flips_if_c_is_in_zeros = ones + (c == '1' ? 1 : 0)
            flips_if_c_is_in_ones = dp[i - 1] + (c == '0' ? 1 : 0)
            dp[i] = [flips_if_c_is_in_zeros, flips_if_c_is_in_ones].min
          end
          if c == '1'
            ones += 1
          end
        end
        dp.last
      end

    end

    # MinimumCoinChange - Individual Topic
    # Source: popular_algorithms/dynamic_programming/minimum_coin_change.rb
    #
    # https://www.youtube.com/watch?v=H9bfqozjoqs
    # bottom up approach. Start from 0..Amount Sub problems.
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - NumDecodings
    # - NumDiceRolls
    #
    class MinimumCoinChange

      # === Content from popular_algorithms/dynamic_programming/minimum_coin_change.rb ===


      # https://www.youtube.com/watch?v=H9bfqozjoqs
      # bottom up approach. Start from 0..Amount Sub problems.
      def coin_change(coins, amount)
        dp = Array.new(amount + 1, Float::INFINITY )
        dp[0] = 0
        (1..(amount)).each do |a|
          coins.each do |c|
            if a - c >= 0
              dp[a] = [dp[a], 1 + dp[a-c]].min
            end
          end
        end
        if dp[amount] != amount + 1
          dp[amount]
        else
          -1
        end
      end

      coins = [186,419,83,408]
      amount = 6249
      puts coin_change(coins, amount)

    end

    # NumDecodings - Individual Topic
    # Source: popular_algorithms/dynamic_programming/num_decodings.rb
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDiceRolls
    #
    class NumDecodings

      # === Content from popular_algorithms/dynamic_programming/num_decodings.rb ===

      def num_decodings(s, memo = {})
        return memo[s] if memo.key?(s)

        num      = s[0]
        num_next = s[1]

        return 0 if num == '0'
        return 1 if num.nil?
        return 1 if num_next.nil?

        result = num_decodings(s[1..-1], memo)

        if (num + num_next).to_i.between?(1,26)
          result += num_decodings(s[2..-1], memo)
        end

        memo[s] = result
        result
      end


      num_decodings('226')

    end

    # NumDiceRolls - Individual Topic
    # Source: popular_algorithms/dynamic_programming/num_dice_rolls.rb
    # 1155. Number of Dice Rolls With Target Sum
    # https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/description/?
    #
    #
    # == Related Topics
    # - BestTeamScore
    # - BestTimeToSellAStock1
    # - CoinChange
    # - DynamicProgramming
    # - Fibonacci
    # - HouseRobber1
    # - HouseRobber2
    # - LongestCommonSubsequence
    # - MaxSubArray
    # - MaximalSquare
    # - MaximumLengthOfPairChain
    # - MaximumScore
    # - MinCostClimbingStairs
    # - MinDifficultyJobSchedule
    # - MinFlipsMonoIncr
    # - MinimumCoinChange
    # - NumDecodings
    #
    class NumDiceRolls

      # === Content from popular_algorithms/dynamic_programming/num_dice_rolls.rb ===

      # 1155. Number of Dice Rolls With Target Sum
      # https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/description/?

      def num_rolls_to_target(d, f, target)
        @dp = Array.new(d+1)
        ways(d, f, target)
      end

      def ways(d, f, target)
        return 1 if d == 0 && target == 0
        return 0 if d < 0 || target < 0
        return @dp[d][target] if @dp[d] && @dp[d][target]
        count = 0
        (1..f).each { |val|
          count += ways(d-1, f, target-val)
        }
        @dp[d] ||= []
        puts @dp.to_s
        @dp[d][target] = count % ((10**9)+7)
      end

      num_rolls_to_target(30, 30, 500)

    end

  end

  # Graph module
  #
  # == Table of Contents
  # - FindCheapestPrice
  # - FindJudge
  # - LongestPathWithDifferentAdjacentCharacters
  # - NumberOfNodesSubtreeWithSameLabel
  #
  module Graph

    # FindCheapestPrice - Individual Topic
    # Source: popular_algorithms/graph/find_cheapest_price.rb
    #
    # == Related Topics
    # - FindJudge
    # - LongestPathWithDifferentAdjacentCharacters
    # - NumberOfNodesSubtreeWithSameLabel
    #
    class FindCheapestPrice

      # === Content from popular_algorithms/graph/find_cheapest_price.rb ===

      require './support_tools/easy_benchmark'
      # https://leetcode.com/problems/cheapest-flights-within-k-stops/description/

      # build the graph via hash
      def naive_dfs_find_cheapest_price(n, flights, src, dst, k)
        trips = {}
        trip_price = {}
        flights.each do |from, to, price|
          trips[from] ||= []
          trips[from] << to
          trip_price["#{from},#{to}"] = price
        end
        dfs(src, dst, trips, trip_price, 0, k + 1)
      end

      def dfs(src, dst, trips, trip_price, cost, k)
        if src == dst && k >= 0
          return cost
        end
        return -1 if trips[src].nil?
        return -1 if k < 0

        costs = []
        trips[src].each do |stop|
          price = trip_price["#{src},#{stop}"]
          route = dfs(stop, dst, trips, trip_price, cost + price, k - 1)
          costs << route unless route == -1
        end
        if costs.empty?
          return -1
        else
          costs.min
        end
      end

      # https://www.youtube.com/watch?v=lyw4FaxrwHg
      def bellman_ford_find_cheapest_price(n, flights, src, dst, k)
        # dp represents the cost of traveling for a particular Edge. Set all edge costs to infinity
        # in the beginning to find the min cost later
        dp = Array.new(n, Float::INFINITY)
        # Set starting point cost to 0.
        dp[src] = 0

        # Use the Bellman-Ford algorithm
        # Let E = the number of edges (connection between two edges - the line)
        # Let V = the number of vertices (nodes)
        # Let S = the id of the starting node
        # Let D = the array of size V that tracks the best distance from S to each node.
        # Bellman ford algorithm states V iterations to find the true cost. (Count from zero to V-1, which basically means V). However below substitutes
        # V with k stops. K == 1 means take one stop during the flight. That means you can travel at least 2 nodes.
        (0..k).each do
          new_dp = dp.dup
          flights.each do |flight|
            new_dp[flight[1]] = [new_dp[flight[1]], dp[flight[0]] + flight[2]].min
          end
          dp = new_dp
        end

        # Return the min cost to reach the dest node with at most k stops
        dp[dst] != Float::INFINITY ? dp[dst] : -1
      end

      def dijkstra_find_cheapest_price(n, flights, src, dst, k)
        neighbors = Hash.new { |h, k| h[k] = [] }
        flights.each { |from, to, price| neighbors[from] << [price, to] }
        queue = neighbors[src].map { |price, to| [price, to, k] }.sort
        visited = { src => k }
        until queue.empty?
          price, city, remaining = queue.shift
          visited[city] = remaining
          return price if city == dst
          neighbors[city].each { |cost, to|
            next if visited[to] && visited[to] >= remaining
            next_price = price + cost
            index = queue.bsearch_index { |price, _, _| price > next_price } || queue.size
            queue.insert(index, [next_price, to, remaining - 1])
          } if remaining > 0
        end
        -1
      end

      # puts find_cheapest_price(4, [[0, 1, 100], [1, 2, 100], [2, 0, 100], [1, 3, 600], [2, 3, 200]], 0, 3, 1)
      n = 17
      flights = [[0, 12, 28], [5, 6, 39], [8, 6, 59], [13, 15, 7], [13, 12, 38], [10, 12, 35], [15, 3, 23], [7, 11, 26], [9, 4, 65], [10, 2, 38], [4, 7, 7], [14, 15, 31], [2, 12, 44], [8, 10, 34], [13, 6, 29], [5, 14, 89], [11, 16, 13], [7, 3, 46], [10, 15, 19], [12, 4, 58], [13, 16, 11], [16, 4, 76], [2, 0, 12], [15, 0, 22], [16, 12, 13], [7, 1, 29], [7, 14, 100], [16, 1, 14], [9, 6, 74], [11, 1, 73], [2, 11, 60], [10, 11, 85], [2, 5, 49], [3, 4, 17], [4, 9, 77], [16, 3, 47], [15, 6, 78], [14, 1, 90], [10, 5, 95], [1, 11, 30], [11, 0, 37], [10, 4, 86], [0, 8, 57], [6, 14, 68], [16, 8, 3], [13, 0, 65], [2, 13, 6], [5, 13, 5], [8, 11, 31], [6, 10, 20], [6, 2, 33], [9, 1, 3], [14, 9, 58], [12, 3, 19], [11, 2, 74], [12, 14, 48], [16, 11, 100], [3, 12, 38], [12, 13, 77], [10, 9, 99], [15, 13, 98], [15, 12, 71], [1, 4, 28], [7, 0, 83], [3, 5, 100], [8, 9, 14], [15, 11, 57], [3, 6, 65], [1, 3, 45], [14, 7, 74], [2, 10, 39], [4, 8, 73], [13, 5, 77], [10, 0, 43], [12, 9, 92], [8, 2, 26], [1, 7, 7], [9, 12, 10], [13, 11, 64], [8, 13, 80], [6, 12, 74], [9, 7, 35], [0, 15, 48], [3, 7, 87], [16, 9, 42], [5, 16, 64], [4, 5, 65], [15, 14, 70], [12, 0, 13], [16, 14, 52], [3, 10, 80], [14, 11, 85], [15, 2, 77], [4, 11, 19], [2, 7, 49], [10, 7, 78], [14, 6, 84], [13, 7, 50], [11, 6, 75], [5, 10, 46], [13, 8, 43], [9, 10, 49], [7, 12, 64], [0, 10, 76], [5, 9, 77], [8, 3, 28], [11, 9, 28], [12, 16, 87], [12, 6, 24], [9, 15, 94], [5, 7, 77], [4, 10, 18], [7, 2, 11], [9, 5, 41]]
      src = 13
      dst = 4
      k = 1
      params = [n, flights, src, dst, k]

      # puts dijkstra_find_cheapest_price(*params)
      puts bellman_ford_find_cheapest_price(*params)
      # EasyBenchmark.iterations = 100
      # EasyBenchmark.benchmark_time(["bellman_ford_find_cheapest_price", "dijkstra_find_cheapest_price"], *params)

    end

    # FindJudge - Individual Topic
    # Source: popular_algorithms/graph/find_judge.rb
    # https://leetcode.com/problems/find-the-town-judge/description/
    #
    #
    # == Related Topics
    # - FindCheapestPrice
    # - LongestPathWithDifferentAdjacentCharacters
    # - NumberOfNodesSubtreeWithSameLabel
    #
    class FindJudge

      # === Content from popular_algorithms/graph/find_judge.rb ===

      # https://leetcode.com/problems/find-the-town-judge/description/

      def find_judge(n, trust)
        return n if n == 1
        degree = Array.new(n+1, 0)
        trust.each do |o, i|
          degree[i] += 1
          degree[o] -= 1
        end
        degree.index(n-1) ? degree.index(n-1) : -1
      end


      puts find_judge(2, [[1,2]]) # 2
      puts find_judge(3, [[1,3],[2,3]])  # 3
      puts find_judge(3, [[1,3],[2,3],[3,1]])  # -1

    end

    # LongestPathWithDifferentAdjacentCharacters - Individual Topic
    # Source: popular_algorithms/graph/longest_path_with_different_adjacent_characters.rb
    # https://leetcode.com/problems/longest-path-with-different-adjacent-characters/
    # Solution summary:
    #
    #
    # == Related Topics
    # - FindCheapestPrice
    # - FindJudge
    # - NumberOfNodesSubtreeWithSameLabel
    #
    class LongestPathWithDifferentAdjacentCharacters

      # === Content from popular_algorithms/graph/longest_path_with_different_adjacent_characters.rb ===

      # https://leetcode.com/problems/longest-path-with-different-adjacent-characters/
      # Solution summary:

      def longest_path(parent, s)
        @maximum = 1
        @letters = s.bytes
        @tree = build_tree(parent)
        count_long_path(0, 0)
        @maximum
      end

      def count_long_path(node_index, char)
        child_nodes = @tree[node_index]
        paths = child_nodes.map { |child_index| count_long_path(child_index, @letters[node_index]) }.max(2)
        local_maximum = 1 + paths.sum
        @maximum = local_maximum if local_maximum > @maximum
        return 0 if @letters[node_index] == char

        1 + paths.max.to_i
      end

      def build_tree(list)
        tree = { -1 => [] }
        list.each.with_index do |parent, index|
          if tree.key?(parent)
            tree[parent] << index
          else
            tree[parent] = [index]
          end
          tree[index] ||= []
        end
        tree
      end

      parent = [-1,0,0,1,1,2]
      s = "abacbe"

      puts longest_path(parent, s)

    end

    # NumberOfNodesSubtreeWithSameLabel - Individual Topic
    # Source: popular_algorithms/graph/number_of_nodes_subtree_with_same_label.rb
    # https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/
    #
    #
    # == Related Topics
    # - FindCheapestPrice
    # - FindJudge
    # - LongestPathWithDifferentAdjacentCharacters
    #
    class NumberOfNodesSubtreeWithSameLabel

      # === Content from popular_algorithms/graph/number_of_nodes_subtree_with_same_label.rb ===

      # https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/

      def count_sub_trees(n, edges, labels)
        labels = labels.each_char.map { _1.ord - 97 }  # TLE w/o this line
        nodes = {}
        edges.each do |(a, b)|
          nodes[a] ||= []
          nodes[a] << b
          nodes[b] ||= []
          nodes[b] << a
        end
        output = [nil] * n
        dfs(0, nil, nodes, labels, output)
        output
      end

      def dfs(node, parent_node, nodes, labels, output)
        label_counters = Hash.new(0)
        label_counters[labels[node]] += 1
        nodes[node].each do |n|
          next if n == parent_node
          child_counters = dfs(n, node, nodes, labels, output)
          child_counters.each do |label, counter|
            label_counters[label] += counter
          end
        end
        output[node] = label_counters[labels[node]]
        label_counters
      end

    end

  end

  # Documentation from popular_algorithms/linked_list/README.md
  #
  # # Top 4 Logic that solves 20+ Linked List FAANG Interview Problems.
  #  - Reverse Linked List → 2 FAANG Interview Problems
  #  - Two Pointer Approach → 4 FAANG Interview Problems
  #    - The Two Pointer Approach comprises of slow and fast pointers. Which are manipulated in a way to traverse the same list in different ways.
  #    - Mostly it depends on moving slow pointer with one step and fast pointer with two steps.
  #  - Merge Linked Lists → 2 FAANG Interview Problems
  #  - Sentinel Node (Dummy Node) → 3 FAANG Interview Problems
  #    - The Sentinel Node is the node that you create as a dummy node. Mostly you will be using it for overcoming the edge cases of deleting the head.
  #      Whenever you are dealing with removal of a node or removing a particular value from a list. Anything that remotely resembles removal of a node. You have to think of using the Sentinel Node first.
  #
  #
  # [source](https://medium.com/javarevisited/4-incredibly-useful-linked-list-tips-for-interview-79d80a29f8fc)
  #
  #
  # == Table of Contents
  # - AddTwoNumbers
  # - HasCycle
  # - IsPalindrome
  # - ListNode
  # - MergeTwoSortedLinkedLists
  # - ReorderList
  # - ReverseByKGroups
  # - ReverseLinkedList
  #
  module LinkedList

    # AddTwoNumbers - Individual Topic
    # Source: popular_algorithms/linked_list/add_two_numbers.rb
    #
    # == Related Topics
    # - HasCycle
    # - IsPalindrome
    # - ListNode
    # - MergeTwoSortedLinkedLists
    # - ReorderList
    # - ReverseByKGroups
    # - ReverseLinkedList
    #
    class AddTwoNumbers

      # === Content from popular_algorithms/linked_list/add_two_numbers.rb ===

      require_relative 'list_node'
      # Definition for singly-linked list.
      # You are given two non-empty linked lists representing two non-negative integers.  Add the two numbers and return the sum as a linked list.
      #
      # You may assume the two numbers do not contain any leading zero, except the number 0 itself.
      # @example
      #   Input: l1 = [2,4,3], l2 = [5,6,4]
      #   Output: [7,0,8]
      #   Explanation: [2,5] + [4,6] + [3,4] + 1 from previous remainder = [7,0,8]

      # @param {ListNode} l1
      # @param {ListNode} l2
      # @return {ListNode}
      def add_two_numbers_linked_list(l1, l2)
        ans = ListNode.new
        pointer = ans
        carry = sum = 0

        until l1.nil? && l2.nil? do
          sum = carry
          if l1
            sum += l1.val
            l1 = l1.next
          end

          if l2
            sum += l2.val
            l2 = l2.next
          end

          carry = sum / 10
          pointer.next = ListNode.new(sum % 10)
          pointer = pointer.next
        end
        if carry == 1
          pointer.next = ListNode.new(1)
        end
        ans.next
      end

      node1 = ListNode.new(2)
      node2 = ListNode.new(4)
      node3 = ListNode.new(3)

      node4 = ListNode.new(5)
      node5 = ListNode.new(6)
      node6 = ListNode.new(4)


      node1.next = node2
      node2.next = node3

      node4.next = node5
      node5.next = node6

      puts add_two_numbers_linked_list(node1, node4)

    end

    # HasCycle - Individual Topic
    # Source: popular_algorithms/linked_list/has_cycle.rb
    # rdoc-image:assets/has_cycle.png
    #
    # == Related Topics
    # - AddTwoNumbers
    # - IsPalindrome
    # - ListNode
    # - MergeTwoSortedLinkedLists
    # - ReorderList
    # - ReverseByKGroups
    # - ReverseLinkedList
    #
    class HasCycle

      # === Content from popular_algorithms/linked_list/has_cycle.rb ===

      require_relative './list_node'

      # https://leetcode.com/explore/featured/card/top-interview-questions-easy/93/linked-list/773/
      # rdoc-image:assets/has_cycle.png
      def has_cycle_destructive_method(head)
        tmp = nil
        node = head
        while node&.next do
          tmp, node = node, node.next
          tmp.next = false
          return true if node.next == false
        end
        false
      end

      # [Tortoise and Hare method](https://en.wikipedia.org/wiki/Cycle_detection#Tortoise_and_hare)
      def has_cycle(head)
        slow = head
        fast = head.next
        while slow != fast
          slow = slow.next
          fast = fast.next.next
        end
        true
      rescue => e
        false
      end

      n1 = ListNode.new(1)
      n2 = ListNode.new(2)
      n3 = ListNode.new(3)
      n4 = ListNode.new(4)
      n5 = ListNode.new(5)

      # has cycle
      n1.next, n2.next, n3.next = n2, n3, n1
      puts has_cycle(n1)

      # no cycle
      n1.next, n2.next, n3.next = n2, n3, nil
      puts has_cycle(n1)

      # no cycle
      n1.next = nil
      puts has_cycle(n1)

    end

    # IsPalindrome - Individual Topic
    # Source: popular_algorithms/linked_list/is_palindrome.rb
    # rdoc-image:assets/is_palindrome.png
    #
    # == Related Topics
    # - AddTwoNumbers
    # - HasCycle
    # - ListNode
    # - MergeTwoSortedLinkedLists
    # - ReorderList
    # - ReverseByKGroups
    # - ReverseLinkedList
    #
    class IsPalindrome

      # === Content from popular_algorithms/linked_list/is_palindrome.rb ===

      require_relative './list_node'
      #https://leetcode.com/explore/featured/card/top-interview-questions-easy/93/linked-list/773/

      # rdoc-image:assets/is_palindrome.png
      def is_palindrome(head)
        rev = nil
        slow = fast = head
        while fast && fast.next
          fast = fast.next.next
          # rev, rev.next, slow = slow, rev, slow.next # Very clever, but hard to understand.
          # We just need to make sure slow.next is updated before slow
          # rev, slow.next, slow = slow, rev, slow.next # works
          slow.next, rev, slow = rev, slow, slow.next # works
          # slow, rev, slow.next = slow.next, slow, rev # doesn't work
        end
        # handle odd numbered sized array of nodes.
        if fast
          slow = slow.next
        end
        while rev and rev.val == slow.val
          slow = slow.next
          rev = rev.next
        end
        # !nil == true
        # !true == false
        # !false == true
        !rev
      end

      node1 = ListNode.new(1)
      node2 = ListNode.new(2)
      node3 = ListNode.new(2)
      node4 = ListNode.new(1)
      node5 = ListNode.new(1)

      # non palindrome
      node1.next, node2.next, node3.next, node4.next  = node2, node3, node4, node5
      puts is_palindrome(node1)
      #palindrome
      node1.next, node2.next, node3.next, node4.next  = node2, node3, node4, nil
      puts is_palindrome(node1)

      node6 = ListNode.new(1, ListNode.new(2))
      puts is_palindrome(node6)

    end

    # ListNode - Individual Topic
    # Source: popular_algorithms/linked_list/list_node.rb
    #
    # == Related Topics
    # - AddTwoNumbers
    # - HasCycle
    # - IsPalindrome
    # - MergeTwoSortedLinkedLists
    # - ReorderList
    # - ReverseByKGroups
    # - ReverseLinkedList
    #
    class ListNode

      # === Content from popular_algorithms/linked_list/list_node.rb ===

      class ListNode
        attr_accessor :val, :next
        def initialize(val = 0, _next = nil)
          @val = val
          @next = _next
        end
      end

    end

    # MergeTwoSortedLinkedLists - Individual Topic
    # Source: popular_algorithms/linked_list/merge_two_sorted_linked_lists.rb
    # https://leetcode.com/problems/merge-two-sorted-lists/description/?envType=study-plan&id=level-1
    #
    #
    # == Related Topics
    # - AddTwoNumbers
    # - HasCycle
    # - IsPalindrome
    # - ListNode
    # - ReorderList
    # - ReverseByKGroups
    # - ReverseLinkedList
    #
    class MergeTwoSortedLinkedLists

      # === Content from popular_algorithms/linked_list/merge_two_sorted_linked_lists.rb ===

      # https://leetcode.com/problems/merge-two-sorted-lists/description/?envType=study-plan&id=level-1

      require_relative './list_node'

      def merge_two_sorted_linked_lists(l1,l2)
        return l1 unless l2
        return l2 unless l1
        if l1.val < l2.val
          l1.next = merge_two_sorted_linked_lists(l1.next, l2)
          return l1
        else
          l2.next = merge_two_sorted_linked_lists(l1, l2.next)
          return l2
        end
      end

      l1 = ListNode.new(1, ListNode.new(2, ListNode.new(7)))
      l2 = ListNode.new(3, ListNode.new(4, ListNode.new(10)))
      merged = merge_two_sorted_linked_lists(l1, l2)
      memo = []
      while merged
        memo << merged.val
        merged = merged.next
      end
      puts memo.to_s

    end

    # ReorderList - Individual Topic
    # Source: popular_algorithms/linked_list/reorder_list.rb
    # [leetcode](https://leetcode.com/problems/reorder-list/)
    # 1. Find the midpoint. If midpoint is odd number, choose the floor
    # 2. Using the midpoint, reverse everything from there.
    # 3. From head, begin merging the original list and the reversed list.
    #
    # == Related Topics
    # - AddTwoNumbers
    # - HasCycle
    # - IsPalindrome
    # - ListNode
    # - MergeTwoSortedLinkedLists
    # - ReverseByKGroups
    # - ReverseLinkedList
    #
    class ReorderList

      # === Content from popular_algorithms/linked_list/reorder_list.rb ===

      # [leetcode](https://leetcode.com/problems/reorder-list/)
      # 1. Find the midpoint. If midpoint is odd number, choose the floor
      # 2. Using the midpoint, reverse everything from there.
      # 3. From head, begin merging the original list and the reversed list.
      def reorder_list(head)
        slow = fast = head
        while fast && fast.next
          slow = slow.next
          fast = fast.next.next
        end

        curr, rev = slow, nil
        while curr
          curr.next, rev, curr = rev, curr, curr.next
        end

        curr = head
        while rev && rev.next
          next_curr = curr.next
          next_rev = rev.next
          curr.next = rev
          rev.next = next_curr
          curr = next_curr
          rev = next_rev
        end

        head
      end

    end

    # ReverseByKGroups - Individual Topic
    # Source: popular_algorithms/linked_list/reverse_by_k_groups.rb
    #
    # == Related Topics
    # - AddTwoNumbers
    # - HasCycle
    # - IsPalindrome
    # - ListNode
    # - MergeTwoSortedLinkedLists
    # - ReorderList
    # - ReverseLinkedList
    #
    class ReverseByKGroups

      # === Content from popular_algorithms/linked_list/reverse_by_k_groups.rb ===

      require_relative './list_node'

      # Given a linked list, write a function to reverse every k nodes (where k is an input to the function).
      # Don't reverse if next group is below k
      # @topics companies
      #     - bytedance
      # @topics algorithms
      #     - recursion
      #     - two pointers
      # - Input: 1->2->3->4->5->6->7->8->NULL, K = 3
      # - Output: 3->2->1->6->5->4->8->8->NULL
      # - Input: 1->2->3->4->5->6->7->8->NULL, K = 5
      # - Output: 5->4->3->2->1->6->7->8->NULL
      def reverse_by_k_groups(head, k)
        return head if head.nil?
        return head unless has_k_groups?(head, k)
        count = 0
        current = head
        rev = nil
        while current and count < k
          rev, rev.next, current = current, rev, current.next
          count += 1
        end

        if !current.nil?
          head.next = reverse_by_k_groups(current, k)
        end
        rev
      end

      def has_k_groups?(head, k)
        1.upto(k).each do
          return false if head.nil?
          head = head.next
        end
        true
      end

      node1 = ListNode.new(1)
      node2 = ListNode.new(2)
      node3 = ListNode.new(3)
      node4 = ListNode.new(4)
      node5 = ListNode.new(5)
      node6 = ListNode.new(6)
      node7 = ListNode.new(7)
      node8 = ListNode.new(8)
      node9 = ListNode.new(9)

      node1.next = node2
      node2.next = node3
      node3.next = node4
      node4.next = node5
      node5.next = node6
      node6.next = node7
      node7.next = node8

      ans = reverse_by_k_groups(node1, 3)
      puts ans

    end

    # ReverseLinkedList - Individual Topic
    # Source: popular_algorithms/linked_list/reverse_linked_list.rb
    # rdoc-image:assets/reversed_linked_list.gif
    #
    # == Related Topics
    # - AddTwoNumbers
    # - HasCycle
    # - IsPalindrome
    # - ListNode
    # - MergeTwoSortedLinkedLists
    # - ReorderList
    # - ReverseByKGroups
    #
    class ReverseLinkedList

      # === Content from popular_algorithms/linked_list/reverse_linked_list.rb ===

      require_relative './list_node'

      # Given a singly linked list, reverse it.
      # rdoc-image:assets/reversed_linked_list.gif
      # The three pointer approach
      def reverse_linked_list(head)
        return head if head.nil?
        curr = head
        nexts = nil
        prevs = nil
        while curr
          nexts = curr.next
          curr.next = prevs
          prevs = curr
          curr = nexts
        end
        prevs
      end

      #  The two pointer approach
      def reverse_linked_list_alternative(head)
        rev = nil
        curr = head
        while curr
          # rev, rev.next, curr = curr, rev, curr.next # Very clever, but hard to understand.
          # We just need to make sure curr is assigned before curr
          # rev, curr.next, curr = curr, rev, curr.next # works
          curr.next, rev, curr = rev, curr, curr.next # works
          # curr, rev, curr.next = curr.next, curr, rev # doesn't work
        end
        rev
      end


      node1 = ListNode.new(1)
      node2 = ListNode.new(2)
      node3 = ListNode.new(3)
      node4 = ListNode.new(4)
      node5 = ListNode.new(5)
      node6 = ListNode.new(6)
      node7 = ListNode.new(7)
      node8 = ListNode.new(8)
      node9 = ListNode.new(9)

      node1.next = node2
      node2.next = node3
      node3.next = node4
      node4.next = node5
      node5.next = node6
      node6.next = node7
      node7.next = node8
      node8.next = node9

      # puts reverse_linked_list(node1)
      a = reverse_linked_list_alternative(node1)
      puts a

    end

  end

  # Matrix module
  #
  # == Table of Contents
  # - ValidSudoku
  #
  module Matrix

    # ValidSudoku - Individual Topic
    # Source: popular_algorithms/matrix/valid_sudoku.rb
    # https://leetcode.com/problems/valid-sudoku/
    # Solution summary
    # - use the #.add? method in set to see if there are duplicates
    # - solution only works if the inputs are either 0-9 or '.', otherwise use hash to check.
    # - the most difficult concept is accessing the row, columns, and 9/9 box pattern. Just need to remember this part for other solutions to work as
    # well.
    # @param {Character[][]} board
    # @return {Boolean}
    class ValidSudoku

      # === Content from popular_algorithms/matrix/valid_sudoku.rb ===

      # https://leetcode.com/problems/valid-sudoku/
      # Solution summary
      # - use the #.add? method in set to see if there are duplicates
      # - solution only works if the inputs are either 0-9 or '.', otherwise use hash to check.
      # - the most difficult concept is accessing the row, columns, and 9/9 box pattern. Just need to remember this part for other solutions to work as
      # well.
      # @param {Character[][]} board
      # @return {Boolean}
      def is_valid_sudoku(board)
        boxes = Array.new(3) { Array.new(3) { Set.new } }
        rows = Array.new(9) { Set.new }
        cols = Array.new(9) { Set.new }

        board.each_with_index do |array, row|
          array.each_with_index do |num, col|
            next if num == '.'
            return false unless boxes[row/3][col/3].add?(num) && rows[row].add?(num) && cols[col].add?(num)
          end
        end
        true
      end

    end

  end

  # Numbers module
  #
  # == Table of Contents
  # - ConvertDecimalToBinary
  # - CountProperFractions
  # - IntToRoman
  # - IntegerToEnglishWords
  # - IsPowerOf
  # - IsPowerOfTwo
  # - PrimeOrNot
  # - RomanToInt
  # - SumOfNaturalNum
  # - ThreeSum
  # - TwoSum
  #
  module Numbers

    # ConvertDecimalToBinary - Individual Topic
    # Source: popular_algorithms/numbers/convert_decimal_to_binary.rb
    # Never knew you can create binaries like this. Anyone know what is the thinking behind?
    #
    # == Related Topics
    # - CountProperFractions
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - RomanToInt
    # - SumOfNaturalNum
    # - ThreeSum
    # - TwoSum
    #
    class ConvertDecimalToBinary

      # === Content from popular_algorithms/numbers/convert_decimal_to_binary.rb ===

      # Never knew you can create binaries like this. Anyone know what is the thinking behind?
      def d_to_b_recursion(number, str = '')
        if number == 0
          return str
        end
        new_num = number / 2
        str = "#{number % 2}" + str
        d_to_b_recursion(new_num, str)
      end

      def d_to_b_loop(number)
        str = ""
        while number > 0
          str = "#{number % 2}" + str
          number = number / 2
        end
        return str
      end

      answers = {
        233 => 11101001,
        8 => 1000,
        6573 => 1100110101101
      }

      answers.each do |number, answer|
        puts "Number: #{number} || Answer #{answer} ||  d_to_b_recursion: #{d_to_b_recursion(number)}, d_to_b_loop: #{d_to_b_loop(number)}"
      end




    end

    # CountProperFractions - Individual Topic
    # Source: popular_algorithms/numbers/count_proper_fractions.rb
    # If n is the numerator and d the denominator of a fraction, that fraction is defined a (reduced) proper fraction if and only if GCD(n,d)==1.
    #
    #   For example 5/16 is a proper fraction, while 6/16 is not, as both 6 and 16 are divisible by 2, thus the fraction can be reduced to 3/8.
    #
    #   Now, if you consider a given number d, how many proper fractions can be built using d as a denominator?
    #
    # For example, let's assume that d is 15: you can build a total of 8 different proper fractions between 0 and 1 with it: 1/15, 2/15, 4/15, 7/15, 8/15, 11/15, 13/15 and 14/15.
    #
    # You are to build a function that computes how many proper fractions you can build with a given denominator:
    #
    # proper_fractions(1)==0
    # proper_fractions(2)==1
    # proper_fractions(5)==4
    # proper_fractions(15)==8
    # proper_fractions(25)==20
    # Be ready to handle big numbers.
    #
    # Edit: to be extra precise, the term should be "reduced" fractions, thanks to girianshiido for pointing this out and sorry for the use of an improper word :)
    #
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - RomanToInt
    # - SumOfNaturalNum
    # - ThreeSum
    # - TwoSum
    #
    class CountProperFractions

      # === Content from popular_algorithms/numbers/count_proper_fractions.rb ===

      # If n is the numerator and d the denominator of a fraction, that fraction is defined a (reduced) proper fraction if and only if GCD(n,d)==1.
      #
      #   For example 5/16 is a proper fraction, while 6/16 is not, as both 6 and 16 are divisible by 2, thus the fraction can be reduced to 3/8.
      #
      #   Now, if you consider a given number d, how many proper fractions can be built using d as a denominator?
      #
      # For example, let's assume that d is 15: you can build a total of 8 different proper fractions between 0 and 1 with it: 1/15, 2/15, 4/15, 7/15, 8/15, 11/15, 13/15 and 14/15.
      #
      # You are to build a function that computes how many proper fractions you can build with a given denominator:
      #
      # proper_fractions(1)==0
      # proper_fractions(2)==1
      # proper_fractions(5)==4
      # proper_fractions(15)==8
      # proper_fractions(25)==20
      # Be ready to handle big numbers.
      #
      # Edit: to be extra precise, the term should be "reduced" fractions, thanks to girianshiido for pointing this out and sorry for the use of an improper word :)

      require 'set'

      def proper_fractions(n)
        distinct_prime_factors = Set.new() # use set to avoid duplicates
        totient_function = n
        if n == 1
          totient_function = 0
        else
          i = 2
          while i * i <= n
            if n % i == 0
              distinct_prime_factors << (i)
              n = n / i
            else
              i += 1
            end
          end
          if n > 1
            distinct_prime_factors.add(n)
          end # picks up prime factors > sqrt(n)
          if (distinct_prime_factors.size) == 0
            # empty set means denominator is prime
            totient_function = n - 1
          else
            for p in distinct_prime_factors
              totient_function = (totient_function * (p - 1)) / p
            end
          end
          totient_function
        end
      end


      ## Solution 2 - Ruby specific
      require 'prime'

      def proper_fractions2(n)
        return 0 if n <= 1

        Prime.prime_division(n).inject(1) do |memo, pair|
          memo * (pair[0] - 1) * pair[0] ** (pair[1] - 1)
        end
      end


      proper_fractions(5) == 4
      proper_fractions(25) == 20
      proper_fractions(374996) == 186240
      proper_fractions(2760492088) == 1380246040
      proper_fractions(3326225271) == 2217483512

    end

    # IntToRoman - Individual Topic
    # Source: popular_algorithms/numbers/int_to_roman.rb
    # https://leetcode.com/problems/integer-to-roman/
    #
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - RomanToInt
    # - SumOfNaturalNum
    # - ThreeSum
    # - TwoSum
    #
    class IntToRoman

      # === Content from popular_algorithms/numbers/int_to_roman.rb ===

      # https://leetcode.com/problems/integer-to-roman/

      def int_to_roman(num)
        map = { 1000 => "M",
                900 => "CM",
                500 => "D",
                400 => "CD",
                100 => "C",
                90 => "XC",
                50 => "L",
                40 => "XL",
                10 => "X",
                9 => "IX",
                5 => "V",
                4 => "IV",
                1 => "I"
        }
        roman = ""
        map.each do |number, letter|
          while num / number > 0
            puts "Current num: #{num}"
            roman += letter
            num -= number
          end
        end
        roman
      end

      puts int_to_roman(1234)

    end

    # IntegerToEnglishWords - Individual Topic
    # Source: popular_algorithms/numbers/integer_to_english_words.rb
    # https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/273/
    #
    # 232,006,987
    # 1. The current three digits place. Ex: Two hundred thirty two
    # 2. Its relative place in the number, Ex: million
    # 3. Move to next three numbers if not zero. Repeat Step one. Ex: Six thousand
    # @param {Integer} num
    # @return {String}
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntToRoman
    # - IsPowerOf
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - RomanToInt
    # - SumOfNaturalNum
    # - ThreeSum
    # - TwoSum
    #
    class IntegerToEnglishWords

      # === Content from popular_algorithms/numbers/integer_to_english_words.rb ===

      # https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/273/
      #
      # 232,006,987
      # 1. The current three digits place. Ex: Two hundred thirty two
      # 2. Its relative place in the number, Ex: million
      # 3. Move to next three numbers if not zero. Repeat Step one. Ex: Six thousand
      # @param {Integer} num
      # @return {String}
      def number_to_words(num)
        return "Zero" if num == 0
        size = {
          4 => "Billion",
          3 => "Million",
          2 => "Thousand"
        }
        edge_case_tenth_size = {
          "10" => "Ten",
          "11" => "Eleven",
          "12" => "Twelve",
          "13" => "Thirteen",
          "14" => "Fourteen",
          "15" => "Fifteen",
          "16" => "Sixteen",
          "17" => "Seventeen",
          "18" => "Eighteen",
          "19" => "Nineteen"
        }
        tenth_size = {
          "2" => "Twenty",
          "3" => "Thirty",
          "4" => "Forty",
          "5" => "Fifty",
          "6" => "Sixty",
          "7" => "Seventy",
          "8" => "Eighty",
          "9" => "Ninety"
        }
        one_size = {
          "1" => "One",
          "2" => "Two",
          "3" => "Three",
          "4" => "Four",
          "5" => "Five",
          "6" => "Six",
          "7" => "Seven",
          "8" => "Eight",
          "9" => "Nine"
        }

        to_ar = num.to_s.chars
        grouped = []

        until to_ar.empty?
          if to_ar.size >= 3
            grouped.insert(0, to_ar.slice!(-3, 3))
          else
            grouped.insert(0, to_ar.slice!(0, 3))
          end
        end
        translated = ""
        index = 0
        until index == grouped.size do
          curr = grouped[index]
          all_zeroes = true

          if curr.size == 3
            unless curr[0] == "0"
              translated += "#{one_size[curr[0]]}" + " Hundred "
              all_zeroes = false
            end
            curr.shift
          end

          if curr.size == 2
            unless curr[0] == "0"
              if curr[0] == "1"
                translated += "#{edge_case_tenth_size[curr[0, 2].join]} "
                curr.shift # shift twice
              else
                translated += "#{tenth_size[curr[0]]} "
              end
              all_zeroes = false
            end
            curr.shift
          end

          if curr.size == 1
            unless curr[0] == "0"
              translated += "#{one_size[curr[0]]} "
              all_zeroes = false
            end
            curr.shift
          end

          if all_zeroes
            index += 1
            next
          end

          current_place = grouped.size - index

          if current_place > 1
            translated += "#{size[current_place]} "
          end

          index += 1
        end
        translated.rstrip
      end

    end

    # IsPowerOf - Individual Topic
    # Source: popular_algorithms/numbers/is_power_of.rb
    # https://leetcode.com/problems/power-of-three/solution/
    # An important piece of information can be deduced from the function signature
    # In particular, n is of type int. In Java, this means it is a 4 byte, signed integer [ref]. The maximum value of this data type is 2147483647. Three ways of calculating this value are
    #
    # - Google
    # - System.out.println(Integer.MAX_VALUE);
    # - max_int = ((2 ** 32) / 2) - 1   -- since 32 bit is used to represent an integer, half of the range is used to represent negative numbers, and zero is also used
    #
    # Knowing the limitation of n, we can now deduce that the maximum value of n that is also a power of three is 1162261467. We calculate this as:
    # - log3(max_int) = 19.56..
    # - rounded down to whole number 19. The biggest whole number that can be stored for base 3: 3 ^ 19
    # - 3 ^ 19 == 1162261467
    #
    # Therefore, the possible values of n where we should return true are 3^1, 3^2, 3^3...
    # Since 3 is a prime number, the only divisors of 3^19 are 3^0, 3^1, 3^3. therefore all we need to do is divide 3^(19) by n
    # A remainder of 0 means n is a divisor of 3^19 and therefore a power of three.
    #
    # Complexity Analysis
    #
    # Time complexity : O(1)O(1). We are only doing one operation. (if we figure out the max_power before hand)
    # Space complexity : O(1)O(1). We are not using any additional memory.
    #
    # This method only works for PRIME NUMBERS.
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - RomanToInt
    # - SumOfNaturalNum
    # - ThreeSum
    # - TwoSum
    #
    class IsPowerOf

      # === Content from popular_algorithms/numbers/is_power_of.rb ===

      # https://leetcode.com/problems/power-of-three/solution/
      # An important piece of information can be deduced from the function signature
      # In particular, n is of type int. In Java, this means it is a 4 byte, signed integer [ref]. The maximum value of this data type is 2147483647. Three ways of calculating this value are
      #
      # - Google
      # - System.out.println(Integer.MAX_VALUE);
      # - max_int = ((2 ** 32) / 2) - 1   -- since 32 bit is used to represent an integer, half of the range is used to represent negative numbers, and zero is also used
      #
      # Knowing the limitation of n, we can now deduce that the maximum value of n that is also a power of three is 1162261467. We calculate this as:
      # - log3(max_int) = 19.56..
      # - rounded down to whole number 19. The biggest whole number that can be stored for base 3: 3 ^ 19
      # - 3 ^ 19 == 1162261467
      #
      # Therefore, the possible values of n where we should return true are 3^1, 3^2, 3^3...
      # Since 3 is a prime number, the only divisors of 3^19 are 3^0, 3^1, 3^3. therefore all we need to do is divide 3^(19) by n
      # A remainder of 0 means n is a divisor of 3^19 and therefore a power of three.
      #
      # Complexity Analysis
      #
      # Time complexity : O(1)O(1). We are only doing one operation. (if we figure out the max_power before hand)
      # Space complexity : O(1)O(1). We are not using any additional memory.
      #
      # This method only works for PRIME NUMBERS.
      def is_power_of?(base_number, n)
        max_int = ((2 ** 32) / 2) - 1
        max_power = base_number ** Math.log(max_int, base_number).floor
        n > 0 && max_power % n == 0
      end

    end

    # IsPowerOfTwo - Individual Topic
    # Source: popular_algorithms/numbers/is_power_of_two.rb
    # https://leetcode.com/problems/power-of-two/?envType=daily-question&envId=2024-02-19
    #
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - PrimeOrNot
    # - RomanToInt
    # - SumOfNaturalNum
    # - ThreeSum
    # - TwoSum
    #
    class IsPowerOfTwo

      # === Content from popular_algorithms/numbers/is_power_of_two.rb ===

      # https://leetcode.com/problems/power-of-two/?envType=daily-question&envId=2024-02-19

      def is_power_of_two(n)
        return true if n == 1
        n > 0 && (n & (n - 1)) == 0
      end



      puts is_power_of_two(2)
      puts is_power_of_two(4)
      puts is_power_of_two(5)
      puts is_power_of_two(6)
      puts is_power_of_two(128)

    end

    # PrimeOrNot - Individual Topic
    # Source: popular_algorithms/numbers/prime_or_not.rb
    # require_relative './support_tools/easy_benchmark'
    # one of the fastest prime or not algorithms.
    # Time complexity: log base 6(n)?
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - IsPowerOfTwo
    # - RomanToInt
    # - SumOfNaturalNum
    # - ThreeSum
    # - TwoSum
    #
    class PrimeOrNot

      # === Content from popular_algorithms/numbers/prime_or_not.rb ===

      # require_relative './support_tools/easy_benchmark'
      # one of the fastest prime or not algorithms.
      # Time complexity: log base 6(n)?
      def polynomial_prime?(n)
        return false if n <= 1
        return true if n <= 3
        return false if ((n % 2) == 0) || ((n % 3) == 0)
        i = 5
        # check division on 6k+i polinom
        # cause all primes are of the form 6k ± 1, with the exception of 2 and 3.
        while i * i <= n
          return false if n % i == 0 || n % (i + 2) == 0
          i += 6
        end
        return true
      end

      # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
      # sieves prime method
      def sieves_primes(max)
        nums = Array.new(max, 1)
        nums[0] = nums[1] = 0

        (2..Math.sqrt(max)).each do |sieve|
          if nums[sieve] == 1
            (2 * sieve).step(max, sieve).each do |num|
              nums[num] = 0
            end
          end
        end

        primes = (2..max).select { |num| nums[num] == 1 }
        primes.size
      end

      def sieve_of_eratosthenes(n)
        bool = Array.new(n, true)
        bool[0], bool[1] = false, false

        tmp = Math.sqrt(n).to_i

        (2..tmp).each do |i|
          if bool[i]
            (i**2...n).step(i) {|j| bool[j] = false}
          end
        end

        count = 0
        bool.each {|b| if b; count += 1 end}
        return count
      end

      (1..100).each do |n|
        sp = sieves_primes(n)
        soe = sieve_of_eratosthenes(n)
        if sp != soe
          puts "sieve_primes result: #{sp}"
          puts "sieve_of_eratosthenes result: #{soe}"
        end
      end

      #
      # test1 = ['Solution 1', :polynomial_prime?]
      # test2 = ['Solution 2', :sieves_prime?]
      # input = 100000000000000000000000000007
      # EasyBenchmark.benchmark_time([test1,test2], input)


    end

    # RomanToInt - Individual Topic
    # Source: popular_algorithms/numbers/roman_to_int.rb
    # https://leetcode.com/explore/featured/card/top-interview-questions-easy/102/math/878/
    #
    # rdoc-image:assets/roman_to_int.png
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - SumOfNaturalNum
    # - ThreeSum
    # - TwoSum
    #
    class RomanToInt

      # === Content from popular_algorithms/numbers/roman_to_int.rb ===

      # https://leetcode.com/explore/featured/card/top-interview-questions-easy/102/math/878/

      # rdoc-image:assets/roman_to_int.png
      def roman_to_int(s)
        lookup = { "I" => 1,
                   "V" => 5,
                   "X" => 10,
                   "L" => 50,
                   "C" => 100,
                   "D" => 500,
                   "M" => 1000 }
        z = 0
        0.upto(s.size - 2).each do |i|
          if lookup[s[i]] < lookup[s[i + 1]]
            z -= lookup[s[i]]
          else
            z += lookup[s[i]]
          end
        end
        z + lookup[s[-1]]
      end

      puts roman_to_int("XX") # 20
      puts roman_to_int("MCMXCIV") # 1994

    end

    # SumOfNaturalNum - Individual Topic
    # Source: popular_algorithms/numbers/sum_of_natural_num.rb
    # Never knew you can create binaries like this. Anyone know what is the thinking behind?
    #
    ## recursion
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - RomanToInt
    # - ThreeSum
    # - TwoSum
    #
    class SumOfNaturalNum

      # === Content from popular_algorithms/numbers/sum_of_natural_num.rb ===

      # Never knew you can create binaries like this. Anyone know what is the thinking behind?

      ## recursion
      def sum_natural_num_recursion(number)
        if number == 0
          return number
        end
        sum = number + sum_natural_num_recursion(number-1)
        sum
      end


      ## loop
      def sum_natural_num_looping(number)
        sum = 0
        curr_num = 0
        until curr_num > number
          sum += curr_num
          curr_num += 1
        end
        sum
      end


      answers = {
        10 => 55
      }

      answers.each do |number, answer|
        puts "Number: #{number} || Answer #{answer} ||  sum_natural_num_recursion: #{sum_natural_num_recursion(number)} || sum_natural_num_looping: #{sum_natural_num_looping(number)}"
      end




    end

    # ThreeSum - Individual Topic
    # Source: popular_algorithms/numbers/three_sum.rb
    # https://leetcode.com/problems/3sum/description/
    #
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - RomanToInt
    # - SumOfNaturalNum
    # - TwoSum
    #
    class ThreeSum

      # === Content from popular_algorithms/numbers/three_sum.rb ===

      # https://leetcode.com/problems/3sum/description/

      def three_sum(nums)
        result = []
        nums.sort!
        (0..(nums.length - 3)).each do |i|
          next if i > 0 && nums[i] == nums[i-1]
          left = i + 1
          right = nums.length - 1
          while left < right
            sum = nums[i] + nums[left] + nums[right]
            if sum == 0
              result << [nums[i], nums[left], nums[right]]
              while left < right && nums[left] == nums[left + 1]
                left += 1
              end
              while left < right && nums[right] == nums[right - 1]
                right -= 1
              end
              left += 1
              right -= 1
            elsif sum < 0
              left += 1
            else
              right -= 1
            end
          end
        end
        result
      end

      three_sum([3,9,8,4,5,7,10],15)

    end

    # TwoSum - Individual Topic
    # Source: popular_algorithms/numbers/two_sum.rb
    #
    # == Related Topics
    # - ConvertDecimalToBinary
    # - CountProperFractions
    # - IntToRoman
    # - IntegerToEnglishWords
    # - IsPowerOf
    # - IsPowerOfTwo
    # - PrimeOrNot
    # - RomanToInt
    # - SumOfNaturalNum
    # - ThreeSum
    #
    class TwoSum

      # === Content from popular_algorithms/numbers/two_sum.rb ===

      def two_sum(nums, target)
        possible_remainders = {}
        nums.each_with_index  do |value, index|
          subtracted = target - value
          if possible_remainders[value].nil?
            possible_remainders[subtracted] = index
          else
            return [possible_remainders[value], index]
          end
        end
      end

      def two_sum_alternative(freq, n)
        freq.keys.each_with_object([]) do |num, ans|
          next if freq[n - num] == 0
          next if n == num * 2 && freq[num] < 2
          ans << [num, n - num]
        end
      end


      puts two_sum([2,7,11,15],9).to_s
      puts two_sum([3,2,4],6).to_s
      puts two_sum([3,3],6).to_s

    end

  end

  # Permutations module
  #
  # == Table of Contents
  # - GenerateParentheses
  # - NextPermutations
  # - NonDecreasingSubsequences
  # - Permutations
  #
  module Permutations

    # GenerateParentheses - Individual Topic
    # Source: popular_algorithms/permutations/generate_parentheses.rb
    # https://leetcode.com/problems/generate-parentheses/description/
    #
    # Summary:
    #   1. Use Opened and Closed pointer method to check valid parentheses
    #   2. Each recursion iteration generates 2 more recursion for adding and closing parentheses.
    #   3. n is passed to the recursion to check final results
    #
    # == Related Topics
    # - NextPermutations
    # - NonDecreasingSubsequences
    # - Permutations
    #
    class GenerateParentheses

      # === Content from popular_algorithms/permutations/generate_parentheses.rb ===

      # https://leetcode.com/problems/generate-parentheses/description/

      # Summary:
      #   1. Use Opened and Closed pointer method to check valid parentheses
      #   2. Each recursion iteration generates 2 more recursion for adding and closing parentheses.
      #   3. n is passed to the recursion to check final results
      def generate_parenthesis(n)
        res = []
        gen(res, n, 0, 0, '')
        res
      end

      def gen(res, n, o, c, s)
        if o == c && o == n
          res << s
        end

        if o < n
          gen(res, n, o + 1, c, "#{s}(")
        end

        if c < o
          gen(res, n, o, c + 1, "#{s})")
        end
      end

      puts generate_parenthesis(2).to_s


    end

    # NextPermutations - Individual Topic
    # Source: popular_algorithms/permutations/next_permutations.rb
    # https://leetcode.com/problems/next-permutation/
    #
    # A permutation of an array of integers is an arrangement of its members into a sequence or linear order.
    #
    # For example, for arr = [1,2,3], the following are considered permutations of arr: [1,2,3], [1,3,2], [3,1,2], [2,3,1].
    # The next permutation of an array of integers is the next lexicographically greater permutation of its integer. More formally, if all the permutations of the array are sorted in one container according to their lexicographical order, then the next permutation of that array is the permutation that follows it in the sorted container. If such arrangement is not possible, the array must be rearranged as the lowest possible order (i.e., sorted in ascending order).
    #
    # For example, the next permutation of arr = [1,2,3] is [1,3,2].
    # Similarly, the next permutation of arr = [2,3,1] is [3,1,2].
    # While the next permutation of arr = [3,2,1] is [1,2,3] because [3,2,1] does not have a lexicographical larger rearrangement.
    # Given an array of integers nums, find the next permutation of nums.
    #
    # The replacement must be in place and use only constant extra memory.
    # 65ms solution
    #
    # == Related Topics
    # - GenerateParentheses
    # - NonDecreasingSubsequences
    # - Permutations
    #
    class NextPermutations

      # === Content from popular_algorithms/permutations/next_permutations.rb ===

      # https://leetcode.com/problems/next-permutation/
      #
      # A permutation of an array of integers is an arrangement of its members into a sequence or linear order.
      #
      # For example, for arr = [1,2,3], the following are considered permutations of arr: [1,2,3], [1,3,2], [3,1,2], [2,3,1].
      # The next permutation of an array of integers is the next lexicographically greater permutation of its integer. More formally, if all the permutations of the array are sorted in one container according to their lexicographical order, then the next permutation of that array is the permutation that follows it in the sorted container. If such arrangement is not possible, the array must be rearranged as the lowest possible order (i.e., sorted in ascending order).
      #
      # For example, the next permutation of arr = [1,2,3] is [1,3,2].
      # Similarly, the next permutation of arr = [2,3,1] is [3,1,2].
      # While the next permutation of arr = [3,2,1] is [1,2,3] because [3,2,1] does not have a lexicographical larger rearrangement.
      # Given an array of integers nums, find the next permutation of nums.
      #
      # The replacement must be in place and use only constant extra memory.
      # 65ms solution
      def next_permutation(nums)
        index = nums.size - 1
        return nums if nums.size <= 1

        while true do
          if index == 0 # means everything is sorted desc like [3,2,1]
            return nums.reverse!
          elsif nums[index - 1] >= nums[index]
            index -= 1
          elsif nums[index - 1] < nums[index]
            next_larger_index = find_just_larger(nums, nums[index - 1])
            swap(nums, index - 1, next_larger_index)
            nums[index..nums.size - 1] = nums[index..nums.size - 1].reverse
            return nums
          end
        end
      end

      def find_just_larger(nums, a)
        index = nums.size - 1
        while nums[index] <= a
          index -= 1
        end
        index
      end

      def swap(nums, a, b )
        nums[a], nums[b] = nums[b], nums[a]
      end

      puts next_permutation([1,5,8,4,7,6,5,3,1]).to_s
      puts next_permutation([1,5,8,5,1,3,5,6,7]).to_s

      # 158476531
      # 158513567
      # 158513576

    end

    # NonDecreasingSubsequences - Individual Topic
    # Source: popular_algorithms/permutations/non_decreasing_subsequences.rb
    # https://leetcode.com/problems/non-decreasing-subsequences/description/
    #
    #
    # == Related Topics
    # - GenerateParentheses
    # - NextPermutations
    # - Permutations
    #
    class NonDecreasingSubsequences

      # === Content from popular_algorithms/permutations/non_decreasing_subsequences.rb ===

      # https://leetcode.com/problems/non-decreasing-subsequences/description/

      require 'set'

      def find_subsequences(nums)
        results = Set.new
        find_sequence(nums, [], results)
        results.to_a
      end

      def find_sequence(nums, current, results)
        return if results.include?(current)
        results.add(current) if current.length >= 2
        return if nums.empty?

        nums.each_with_index do |num, index|
          unless current.any? && current.last > num
            find_sequence(nums[index+1..-1], current + [num], results)
          end
        end
      end

      puts find_subsequences([4,4,3,2,1]).to_s # [[4,4]]
      puts find_subsequences([4,6,7,7]).to_s # [[4,6],[4,6,7],[4,6,7,7],[4,7],[4,7,7],[6,7],[6,7,7],[7,7]]

    end

    # Permutations - Individual Topic
    # Source: popular_algorithms/permutations/permutations.rb
    # https://leetcode.com/problems/permutations/
    #
    # == Related Topics
    # - GenerateParentheses
    # - NextPermutations
    # - NonDecreasingSubsequences
    #
    class Permutations

      # === Content from popular_algorithms/permutations/permutations.rb ===

      # https://leetcode.com/problems/permutations/
      def permute(nums)
        results = []
        generator(nums, 0, nums.size - 1, results )
        results
      end

      def generator(nums, left, right, results )
        if left == right
          return results << nums.dup
        else
          (left..right).each do |i|
            nums[left], nums[i] = nums[i], nums[left] # swap temporarily and push into generator
            generator(nums, left+1, right, results)
            nums[left], nums[i] = nums[i], nums[left] # swap back to original
          end
        end
      end


      puts permute([1,2,3,]).to_s

    end

  end

  # Sampling module
  #
  # == Table of Contents
  # - ReservoirSampling
  #
  module Sampling

    # ReservoirSampling - Individual Topic
    # Source: popular_algorithms/sampling/reservoir_sampling.rb
    # @param k is the # of samples to retrieve
    # @param bag current list of elements that we want to randomly pick out from
    # @return an array of randomly selected elements from the bag
    class ReservoirSampling

      # === Content from popular_algorithms/sampling/reservoir_sampling.rb ===

      # @param k is the # of samples to retrieve
      # @param bag current list of elements that we want to randomly pick out from
      # @return an array of randomly selected elements from the bag
      def reservoir_sampling(bag, k)
        reservoir = bag[0..k - 1]
        (k...bag.size).each do |i|
          j = rand(i + 1)
          reservoir[j] = bag[i] if j < k
        end
        return reservoir
      end

      bag = [1, 2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
      k = 1

      distribution = {}
      1.upto(100).each do
        sample = reservoir_sampling(bag, 1)
        # sample = bag.sample
        distribution[sample] ||= 0
        distribution[sample] += 1
      end

      distribution = distribution.sort_by {|k, v | k}
      puts distribution.to_h

    end

  end

  # Documentation from popular_algorithms/sorting/SortIng.md
  #
  # # Sort Complexity Comparisons (Average Scenario)
  #
  # | N elements 	| Max # of steps in Bubble Sort 	| Max # of steps in Selection Sort 	|  Max # of steps in Quick Sort     |
  # |:----------:	|:-----------------------------:	|:---------------------------------:| :---:     |
  # | 5 	        | 20 	                            | 14 (10 comparisons + 4 swaps) 	|  7    (5 comparisons + 2 swaps)   |
  # | 10 	        | 90 	                            | 54 (45 comparisons + 9 swaps) 	|  15   (10 comparisons + 5 swaps)  |
  # | 20 	        | 380 	                            | 199 (180 comparisons + 19 swaps) 	|  30   (20 comparisons + 10 swaps) |
  # | 40 	        | 1560 	                            | 819 (780 comparisons + 39 swaps) 	|  60   (40 comparisons + 20 swaps) |
  # | 80 	        | 6320 	                            | 3239 (3160 comparisons + 79 swaps)|  120  (80 comparisons + 40 swaps) |
  #
  #
  # == Table of Contents
  # - BubbleSort
  # - InsertionSort
  # - QuickSort
  # - SelectionSort
  #
  module Sorting

    # BubbleSort - Individual Topic
    # Source: popular_algorithms/sorting/bubble_sort.rb
    # Complexity is about O(n^2)
    # Calculation
    # n + (n-1) + (n-2).. --> n-n = Total Comparisons needed for each element
    # O(1) * Total Comparison = Total Number of Swaps
    #
    #
    # Integer comparison implementation
    # Gist of how this works - Move largest number to the last element of the array to the right most
    # after each iterations
    #
    # == Related Topics
    # - InsertionSort
    # - QuickSort
    # - SelectionSort
    #
    class BubbleSort

      # === Content from popular_algorithms/sorting/bubble_sort.rb ===

      # Complexity is about O(n^2)
      # Calculation
      # n + (n-1) + (n-2).. --> n-n = Total Comparisons needed for each element
      # O(1) * Total Comparison = Total Number of Swaps


      # Integer comparison implementation
      # Gist of how this works - Move largest number to the last element of the array to the right most
      # after each iterations
      def bubble_sort(array)
        unsorted_until_index = array.size - 1
        sorted = false
        until sorted
          sorted = true
          (0..(unsorted_until_index - 1)).each do |index|
            next unless array[index] > array[index + 1]
            sorted = false
            # Swap places with next element if is bigger
            array[index], array[index + 1] = array[index + 1], array[index]
          end
          # After first pass through is over, we guaranteed that the last element is the biggest number,
          #   so no need to sort the last element.
          unsorted_until_index -= 1
        end
        array
      end


      array = [65, 55, 45, 35, 25, 15, 10]
      puts bubble_sort(array).to_s

    end

    # InsertionSort - Individual Topic
    # Source: popular_algorithms/sorting/insertion_sort.rb
    # Complexity is about O(n^2)
    # Calculation
    # n + (n-1) + (n-2).. --> (n^2)/2 = Total Comparisons needed for each element
    # n + (n-1) + (n-2).. --> (n^2)/2 = Total Number of element overwriting
    #
    #
    # Integer comparison implementation
    # Gist of how this works - Moving from left to right, cut out a boundary of the array starting between
    # index 0 and index 1. Pick one element at the time, and compare the left side.
    # Move lowest number to the left at the end of each iteration.
    #
    #
    # == Related Topics
    # - BubbleSort
    # - QuickSort
    # - SelectionSort
    #
    class InsertionSort

      # === Content from popular_algorithms/sorting/insertion_sort.rb ===

      # Complexity is about O(n^2)
      # Calculation
      # n + (n-1) + (n-2).. --> (n^2)/2 = Total Comparisons needed for each element
      # n + (n-1) + (n-2).. --> (n^2)/2 = Total Number of element overwriting
      #

      # Integer comparison implementation
      # Gist of how this works - Moving from left to right, cut out a boundary of the array starting between
      # index 0 and index 1. Pick one element at the time, and compare the left side.
      # Move lowest number to the left at the end of each iteration.

      def insertion_sort(ar)
        (1..(ar.size - 1)).each do |index|
          position = index
          temp_value = ar[index]
          while (position > 0) && (ar[position - 1] > temp_value)
            ar[position] = ar[position - 1]
            position = (position - 1)
          end
          ar[position] = temp_value
        end
      end


      array = [65, 55, 45, 35, 25, 15, 10]
      insertion_sort(array)
      puts array.to_s














    end

    # QuickSort - Individual Topic
    # Source: popular_algorithms/sorting/quick_sort.rb
    # animation: https://www.hackerearth.com/practice/algorithms/sorting/quick-sort/visualize/
    # Main Ideas:
    # There is a pivot point chosen. This can be random or just the last element for simplicity.
    # The partition function can return the pivot location at the end of partition loops.
    # At the end one partition loop, all elements to the left of the pivot element should be less than the pivot.
    # All elements to the right of the pivot element should be more than the pivot.
    # The partition return function needs to return the pivot.
    # Quick sort is the default sort algorithm for standard libraries.
    #
    # == Related Topics
    # - BubbleSort
    # - InsertionSort
    # - SelectionSort
    #
    class QuickSort

      # === Content from popular_algorithms/sorting/quick_sort.rb ===

      # animation: https://www.hackerearth.com/practice/algorithms/sorting/quick-sort/visualize/
      # Main Ideas:
      # There is a pivot point chosen. This can be random or just the last element for simplicity.
      # The partition function can return the pivot location at the end of partition loops.
      # At the end one partition loop, all elements to the left of the pivot element should be less than the pivot.
      # All elements to the right of the pivot element should be more than the pivot.
      # The partition return function needs to return the pivot.
      # Quick sort is the default sort algorithm for standard libraries.
      def quick_sort(array, first, last)
        if first < last
          j = partition(array, first, last)
          puts "*" * 50

          quick_sort(array, first, j - 1)
          quick_sort(array, j + 1, last)
        end
        array
      end

      def partition(array, first, last)
        puts "-" * 100
        puts "sorting contents #{array[first..last]} pivot: [#{array[last]}]"
        arr_beginning = array.dup

        left = first
        right = first
        while right < last
          puts "##### starting index positions: left: #{left}, right:#{right}"
          if array[right] <= array[last] # array last is pivot
            if left != right
              ###################### for visual purposes ###########################
              puts "Swapping inner loop: "                                         #
              puts "left index: #{left}      right index: #{right}"                #
              str_put = "["                                                        #
              0.upto(array.size - 1).each do |i|                              #
                if i == left || i == right                                         #
                  str_put += ">#{array[i]}<"                                       #
                else                                                               #
                  str_put += "#{array[i]}"                                         #
                end                                                                #
                str_put += ", " unless i == array.size - 1                        #
              end                                                                  #
              str_put += "]"                                                       #
              puts str_put + " pivot [#{array[last]}]"                             #
              ######################################################################
              array[right], array[left] = array[left], array[right]
            end
            left += 1
          end
          right += 1
          puts "##### ending index positions:   left: #{left}, right:#{right}"
          puts
        end
        # swap left and pivot at the end of loop
        puts "Exchanging Pivot: left index: #{left} last: #{last}"
        array[left], array[last] = array[last], array[left]

        puts "partition beginning: #{arr_beginning.to_s}"
        puts "partition    ending: #{array.to_s}"
        puts "-" * 100
        puts
        left
      end



      def quick_sort_simple(arr)
        if arr.length <= 1
          return arr
        end
        pivot = arr.pop
        less = []
        greater = []
        arr.each do |x|
          if x <= pivot
            less << x
          else
            greater << x
          end
        end
        quick_sort_simple(less) + [pivot] + quick_sort_simple(greater)
      end


      arr = [20, 21, 4, 5, 8, 10, 3, 3, 2, 1, 12, 18, 7]
      arr2 = arr.dup
      puts "quick sort pointer method" , quick_sort(arr, 0, arr.size - 1).to_s
      puts "quick sort simple array method", quick_sort_simple(arr2).to_s


    end

    # SelectionSort - Individual Topic
    # Source: popular_algorithms/sorting/selection_sort.rb
    #
    # Complexity is about O(n^2)
    # Calculation
    # n + (n-1) + (n-2).. --> n-n = Total Comparisons needed for each element
    # (n-1) + (n-2) + (n-3) --> n-n = Total Number of Swaps
    #
    # Integer comparison implementation
    # Gist of how this works - Remember the index of the lowest number of each iterations, and
    # at the end of each iteration, move the lowest number to the front.
    #
    # == Related Topics
    # - BubbleSort
    # - InsertionSort
    # - QuickSort
    #
    class SelectionSort

      # === Content from popular_algorithms/sorting/selection_sort.rb ===

      # frozen_string_literal: true

      # Complexity is about O(n^2)
      # Calculation
      # n + (n-1) + (n-2).. --> n-n = Total Comparisons needed for each element
      # (n-1) + (n-2) + (n-3) --> n-n = Total Number of Swaps

      # Integer comparison implementation
      # Gist of how this works - Remember the index of the lowest number of each iterations, and
      # at the end of each iteration, move the lowest number to the front.
      def selection_sort(ar)
        (0..(ar.size - 1)).each do |i|
          smallest = 0
          (i..(ar.size - 1)).each do |j|
            smallest = j if ar[j] > ar[smallest]
            temp = ar[j]
            ar[j] = ar[smallest]
            ar[smallest] = temp
          end
        end
        ar
      end

      array = [65, 55, 45, 35, 25, 15, 10]
      puts selection_sort(array).to_s

    end

  end

  # Strings module
  #
  # == Table of Contents
  # - CheckParenthesesBalanced
  # - IsOneEditDistance
  # - LongestSubstringWithAtMostKDistinctCharacters
  # - MinimumEditDistance
  # - Palindrome
  # - ReverseString
  # - SmallestEquivalentString
  # - UniqueStringOrNot
  # - ValidPalindromeIi
  #
  module Strings

    # CheckParenthesesBalanced - Individual Topic
    # Source: popular_algorithms/strings/check_parentheses_balanced.rb
    #
    # == Related Topics
    # - IsOneEditDistance
    # - LongestSubstringWithAtMostKDistinctCharacters
    # - MinimumEditDistance
    # - Palindrome
    # - ReverseString
    # - SmallestEquivalentString
    # - UniqueStringOrNot
    # - ValidPalindromeIi
    #
    class CheckParenthesesBalanced

      # === Content from popular_algorithms/strings/check_parentheses_balanced.rb ===

      def check_parentheses_balanced(s)
        balanced = 0
        index = 0
        while index < s.size do
          curr = s[index]
          if curr == '('
            balanced += 1
          elsif curr == ')'
            balanced -= 1
          end
          return false if balanced < 0
          index += 1
        end
        balanced == 0
      end

      puts check_parentheses_balanced("()())()")

    end

    # IsOneEditDistance - Individual Topic
    # Source: popular_algorithms/strings/is_one_edit_distance.rb
    # https://leetcode.com/problems/one-edit-distance/
    # @topics algorithms -
    #   - two_pointers
    #   - edit_distance
    #
    # == Related Topics
    # - CheckParenthesesBalanced
    # - LongestSubstringWithAtMostKDistinctCharacters
    # - MinimumEditDistance
    # - Palindrome
    # - ReverseString
    # - SmallestEquivalentString
    # - UniqueStringOrNot
    # - ValidPalindromeIi
    #
    class IsOneEditDistance

      # === Content from popular_algorithms/strings/is_one_edit_distance.rb ===

      # https://leetcode.com/problems/one-edit-distance/
      # @topics algorithms -
      #   - two_pointers
      #   - edit_distance
      def is_one_edit_distance(s, t)
        return false if s == t

        l1, l2 = s.size, t.size
        if l1 > l2
          # make sure string "t" is always bigger or equal to s. We will do a subtraction next line
          return is_one_edit_distance(t, s)
        end

        if l2 - l1 > 1
          return false # no point of doing comparison if there are more than one character difference. Not one edit distance.
        end

        0.upto(l1).each do |i|
          if s[i] != t[i]
            if l1 == l2 # If they are same size, replace what is found in t to s. REPLACEMENT
              s = s[0, i] + t[i] + s[i + 1, s.size]
            else
              # if they are not the same size, take whatever that is in t, and add it to s. INSERTION
              s = s[0, i] + t[i] + s[i, s.size]
            end
            break # optimization logic, there should only be one edit distance. No need to further iterate.
          end
        end
        s == t #|| s == t[0,t.size - 1]  # Don't think this part is necessary since we make sure t is greater and we handle the insertion above...
      end

      puts is_one_edit_distance("ab", "acb") # true
      puts is_one_edit_distance("ab", "ba") # false
      puts is_one_edit_distance("ab", "ba") # false
      puts is_one_edit_distance("aca", "caca") # true

    end

    # LongestSubstringWithAtMostKDistinctCharacters - Individual Topic
    # Source: popular_algorithms/strings/longest_substring_with_at_most_k_distinct_characters.rb
    # https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3017/
    #
    # Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.
    # "eceba" , 2
    # > returns 3 for "ece"
    # @param {String} s
    # @param {Integer} k
    # @return {Integer}
    # @topics algorithms -
    #   - two pointers
    #   - sliding window
    #
    # == Related Topics
    # - CheckParenthesesBalanced
    # - IsOneEditDistance
    # - MinimumEditDistance
    # - Palindrome
    # - ReverseString
    # - SmallestEquivalentString
    # - UniqueStringOrNot
    # - ValidPalindromeIi
    #
    class LongestSubstringWithAtMostKDistinctCharacters

      # === Content from popular_algorithms/strings/longest_substring_with_at_most_k_distinct_characters.rb ===

      # https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3017/
      #
      # Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.
      # "eceba" , 2
      # > returns 3 for "ece"
      # @param {String} s
      # @param {Integer} k
      # @return {Integer}
      # @topics algorithms -
      #   - two pointers
      #   - sliding window
      def length_of_longest_substring_k_distinct(s, k)
        if k == 0
          return 0
        end

        length = s.size
        return length if k > length

        left, right, max_len = 0, 0, 0
        right_most_position = {}

        while right < length
          char = s[right]
          right_most_position[char] = right
          right += 1

          if right_most_position.size > k
            lower_idx = right_most_position.values.min
            right_most_position.delete(s[lower_idx])
            left = lower_idx + 1
          end

          max_len = [max_len, right - left].max
        end

        max_len
      end

      puts length_of_longest_substring_k_distinct("ababffzzeee", 2) # 5 for "zzeee"


      # Another Algo I wrote maybe easier to understand.
      # def length_of_longest_substring_k_distinct(s, k)
      #   # tuple max_size, left, right ranges
      #   return s.size if k > s.size
      #   answer = 0, nil, nil
      #   left = right = 0
      #   char_counts = {}
      #   distinct_k = Set.new
      #   while left <= right && right < s.size
      #     while right < s.size && distinct_k.size <= k
      #       char = s[right]
      #       char_counts[char] = char_counts.fetch(char, 0) + 1
      #       distinct_k.add(char)
      #
      #       if distinct_k.size <= k && right - left + 1 > answer[0]
      #         answer = right - left + 1, left, right
      #       end
      #
      #       right += 1
      #       break if !distinct_k.include?(s[right]) && distinct_k.size >= k
      #     end
      #     char_counts[s[left]] -= 1 if char_counts[s[left]]
      #     distinct_k -= [s[left]] if char_counts[s[left]] == 0
      #     left += 1
      #   end
      #   answer[0]
      # end

    end

    # MinimumEditDistance - Individual Topic
    # Source: popular_algorithms/strings/minimum_edit_distance.rb
    # https://leetcode.com/problems/edit-distance/
    # Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
    #   You have the following three operations permitted on a word:
    # - Insert a character
    # - Delete a character
    # - Replace a character
    # @topics algorithms -
    #   - dynamic_programming
    #   - edit_distance
    #
    # == Related Topics
    # - CheckParenthesesBalanced
    # - IsOneEditDistance
    # - LongestSubstringWithAtMostKDistinctCharacters
    # - Palindrome
    # - ReverseString
    # - SmallestEquivalentString
    # - UniqueStringOrNot
    # - ValidPalindromeIi
    #
    class MinimumEditDistance

      # === Content from popular_algorithms/strings/minimum_edit_distance.rb ===

      # https://leetcode.com/problems/edit-distance/
      # Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
      #   You have the following three operations permitted on a word:
      # - Insert a character
      # - Delete a character
      # - Replace a character
      # @topics algorithms -
      #   - dynamic_programming
      #   - edit_distance
      def min_edit_distance(s1, s2)
        memo = Array.new(s1.size + 1) {Array.new(s2.size + 1)}
        dp(s1, s2, s1.size, s2.size, memo)
      end

      def dp(s1, s2, i, j, memo)
        return j if i == 0
        return i if j == 0

        if s1[i - 1] == s2[j - 1]
          return dp(s1, s2, i-1, j-1, memo)
        end

        if memo[i][j]
          return memo[i][j]
        else
          memo[i][j] = [dp(s1, s2, i-1, j,memo), dp(s1, s2, i, j-1,memo), dp(s1, s2, i-1, j-1,memo)].min + 1
        end
        memo[i][j]
      end


      puts min_edit_distance("data", "data-analytics")

    end

    # Palindrome - Individual Topic
    # Source: popular_algorithms/strings/palindrome.rb
    ## recursion
    #
    # == Related Topics
    # - CheckParenthesesBalanced
    # - IsOneEditDistance
    # - LongestSubstringWithAtMostKDistinctCharacters
    # - MinimumEditDistance
    # - ReverseString
    # - SmallestEquivalentString
    # - UniqueStringOrNot
    # - ValidPalindromeIi
    #
    class Palindrome

      # === Content from popular_algorithms/strings/palindrome.rb ===

      ## recursion
      def is_palindrome_recursion(input)
        if input.length <= 1
          return true
        end

        first = input[0]
        last = input[-1]
        rest = input[1..-2]

        if first == last
          return is_palindrome_recursion(rest)
        else
          return false
        end
      end


      ## loop
      def is_palindrome_loop(input)
        l, r = 0, input.length - 1
        while r > l do
          return false if input[l] != input[r]
          r -= 1
          l += 1
        end
        return true
      end

      inputs = ["kayak", "hello", "racecar"]

      inputs.each do |i|
        puts "Word: #{i} || is_palindrome_recursion: #{is_palindrome_recursion(i)} || is_palindrome_loop: #{is_palindrome_loop(i)}"
      end

    end

    # ReverseString - Individual Topic
    # Source: popular_algorithms/strings/reverse_string.rb
    # recursion
    #
    # == Related Topics
    # - CheckParenthesesBalanced
    # - IsOneEditDistance
    # - LongestSubstringWithAtMostKDistinctCharacters
    # - MinimumEditDistance
    # - Palindrome
    # - SmallestEquivalentString
    # - UniqueStringOrNot
    # - ValidPalindromeIi
    #
    class ReverseString

      # === Content from popular_algorithms/strings/reverse_string.rb ===

      # recursion
      def reverse_string_recursion(input)
        if input == ""
          return input
        end
        substr = input.slice!(1..input.length)
        reverse_string_recursion(substr) + input[0]
      end

      # looping
      def reverse_string_looping(input)
        l = 0
        r = input.length - 1
        while r > l do
          tmp = input[l]
          input[l] = input[r]
          input[r] = tmp
          r -= 1
          l += 1
        end
        input
      end


      input = "hello"

      puts reverse_string_recursion(input)
      puts reverse_string_recursion(input) == reverse_string_looping(input)

    end

    # SmallestEquivalentString - Individual Topic
    # Source: popular_algorithms/strings/smallest_equivalent_string.rb
    # https://leetcode.com/problems/lexicographically-smallest-equivalent-string/
    # @topics algorithms -
    #   - union find
    #
    #
    # == Related Topics
    # - CheckParenthesesBalanced
    # - IsOneEditDistance
    # - LongestSubstringWithAtMostKDistinctCharacters
    # - MinimumEditDistance
    # - Palindrome
    # - ReverseString
    # - UniqueStringOrNot
    # - ValidPalindromeIi
    #
    class SmallestEquivalentString

      # === Content from popular_algorithms/strings/smallest_equivalent_string.rb ===

      # https://leetcode.com/problems/lexicographically-smallest-equivalent-string/
      # @topics algorithms -
      #   - union find

      def smallest_equivalent_string(s1, s2, base_str)
        root = (0..25).to_a

        def find(c, root)
          i = c.ord - 'a'.ord
          while root[i] != i
            i = root[i]
          end
          return i
        end

        s1.chars.zip(s2.chars).each do |ch1, ch2|
          r1, r2 = find(ch1, root), find(ch2, root)
          if r1 > r2
            r1, r2 = r2, r1
          end
          root[r2] = r1
        end

        base_str.chars.map { |c| (find(c, root) + 'a'.ord).chr }.join

      end

    end

    # UniqueStringOrNot - Individual Topic
    # Source: popular_algorithms/strings/unique_string_or_not.rb
    #
    # == Related Topics
    # - CheckParenthesesBalanced
    # - IsOneEditDistance
    # - LongestSubstringWithAtMostKDistinctCharacters
    # - MinimumEditDistance
    # - Palindrome
    # - ReverseString
    # - SmallestEquivalentString
    # - ValidPalindromeIi
    #
    class UniqueStringOrNot

      # === Content from popular_algorithms/strings/unique_string_or_not.rb ===

      require 'set'
      require_relative '../../support_tools/easy_benchmark'


      # Tempting one-liner method
      def set_unique_string?(str)
        str.length == str.split('').to_set.length
      end


      # Most efficient method? :)
      def bitwise_unique_string?(str)
        char_index = 0
        str.each_char do |char|
          # Assuming characters are upper case and lower case included, and ascii characters below bit 65
          # is not used.
          # The letter 'A' is represented as 65. We minus all of the previous numbers in order to
          # avoid creating an unnecessary gigantic char_index number.
          bit_char = 1 << (char.ord - 65)
          # puts "Current character is: #{char}"
          return false if (char_index & bit_char) > 0
          char_index |= bit_char
        end
        true
      end

      input = 'abcdefghijklmnop!#@$%^qrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZAa'

      test1 = ['Set', :set_unique_string?]
      test2 = ['Bitwise', :bitwise_unique_string?]

      EasyBenchmark.benchmark_time([test1,test2], input)


    end

    # ValidPalindromeIi - Individual Topic
    # Source: popular_algorithms/strings/valid_palindrome_ii.rb
    # https://leetcode.com/problems/valid-palindrome-ii/
    #
    # Given a string s, return true if the s can be palindrome after deleting at most one character from it.
    # @example Input: s = "aba"
    #   Output: true
    #
    # @example Input: s = "abca"
    #   Output: true
    #   Explanation: You could delete the character 'c'.
    #
    # == Related Topics
    # - CheckParenthesesBalanced
    # - IsOneEditDistance
    # - LongestSubstringWithAtMostKDistinctCharacters
    # - MinimumEditDistance
    # - Palindrome
    # - ReverseString
    # - SmallestEquivalentString
    # - UniqueStringOrNot
    #
    class ValidPalindromeIi

      # === Content from popular_algorithms/strings/valid_palindrome_ii.rb ===

      # https://leetcode.com/problems/valid-palindrome-ii/
      #
      # Given a string s, return true if the s can be palindrome after deleting at most one character from it.
      # @example Input: s = "aba"
      #   Output: true
      #
      # @example Input: s = "abca"
      #   Output: true
      #   Explanation: You could delete the character 'c'.
      def valid_palindrome_ii(s)
        valid_palindrome?(s,0,s.size - 1)
      end

      def valid_palindrome?(s, l,r,deletes=1)
        while l < r
          if s[l] == s[r]
            l += 1
            r -= 1
          else
            if deletes != 0
              delete_left = valid_palindrome?(s, l+1, r, 0)
              delete_right = valid_palindrome?(s,l, r - 1, 0)
              return [delete_left, delete_right].any?
            else
              return false
            end
          end
        end
        true
      end

      puts valid_palindrome_iii("aca")
      # puts valid_palindrome("abca")
      # puts valid_palindrome("bddb")

    end

  end

  # Trees module
  #
  # == Table of Contents
  # - IsValidBst
  #
  module Trees

    # IsValidBst - Individual Topic
    # Source: popular_algorithms/trees/is_valid_bst.rb
    # https://leetcode.com/explore/featured/card/top-interview-questions-easy/94/trees/625/
    #
    class IsValidBst

      # === Content from popular_algorithms/trees/is_valid_bst.rb ===

      # https://leetcode.com/explore/featured/card/top-interview-questions-easy/94/trees/625/

      def is_valid_bst(root, less_than = Float::INFINITY, larger_than = (-Float::INFINITY))
        unless root
          return true
        end

        if root.val <= larger_than or root.val >= less_than
          return false
        end

        is_valid_bst(root.left, [less_than, root.val].min, larger_than) \
          && is_valid_bst(root.right, less_than, [larger_than, root.val].max)
      end

      def is_valid_bst_alternative(node, min = -2 ** 31, max = 2 ** 31 - 1)
        node.nil? ||
          (min..max).include?(node.val) &&
            is_valid_bst(node.left, min, node.val - 1) &&
            is_valid_bst(node.right, node.val + 1, max)
      end

      ## use in-order-traversal techniques for BST. This will print smallest to largest value

    end

  end

  # PopularAlgorithms - Individual Topic
  # Source: popular_algorithms/popular_algorithms.rb
  class PopularAlgorithms

    # === Content from popular_algorithms/popular_algorithms.rb ===

    module PopularAlgorithms
    end

    module PopularAlgorithms::DynamicProgramming; end

  end

end

# PopularDataStructures module for organizing populardatastructures implementations
module PopularDataStructures

  # HashTable module
  #
  # == Table of Contents
  # - TodoLinkedHashMap
  # - HashTableOpenAddressing
  # - HashTableSeparateChaining
  #
  module HashTable

    # TodoLinkedHashMap - Individual Topic
    # Source: popular_data_structures/hash_table/TODO_linked_hash_map.rb
    # TODO implment least recently used cache as well.
    class TodoLinkedHashMap

      # === Content from popular_data_structures/hash_table/TODO_linked_hash_map.rb ===

      # TODO implment least recently used cache as well.

    end

    # LinkedList - Individual Topic
    # Source: popular_data_structures/hash_table/hash_table_separate_chaining/linked_list.rb
    #
    # == Related Topics
    # - Node
    # - SeparateChaining
    # - SeparateChainingSpec
    # - UniversalHash
    #
    class LinkedList

      # === Content from popular_data_structures/hash_table/hash_table_separate_chaining/linked_list.rb ===

      require_relative '../hash_table_separate_chaining/node'

      class LinkedList
        attr_accessor :head
        attr_accessor :tail

        def initialize
          @head = nil
          @tail = nil
          @length = 0
        end

        # This method creates a new `Node` using `data`, and inserts it at the end of the list.
        def add_to_tail(new_n)
          if @head.nil?
            @head = new_n
            @tail = new_n
          else
            @tail.next = new_n
            @tail = new_n
          end
          @length += 1
        end

        # This method removes the last node in the lists and must keep the rest of the list intact.
        def remove_tail
          if @head === @tail
            @head = nil
            @tail = nil
          else
            new_n = @head
            while ((!new_n.nil?) && (new_n.next != @tail)) do
              new_n = new_n.next
            end
            @tail = new_n
            @tail.next = nil
          end
          @length -= 1
        end

        # This method prints out a representation of the list.
        def print(hash)
          new_n = @head
          i = 0
          while !new_n.nil?
            puts "Hash: #{hash} -> Position: #{i} -> Key: #{new_n.key} -> Value: #{new_n.value}"
            new_n = new_n.next
            i += 1
          end
        end

        def delete(new_n)
          if !@head.nil? # O(1)
            if @head === new_n
              remove_front
            elsif @tail === new_n # O(1)
              remove_tail
            else # The infamous separate chaining O(N)
              current_node = @head
              while !current_node.nil? && current_node.next.key != new_n.key
                current_node = current_node.next
              end
              if !current_node.next.next.nil?
                next_next_node = current_node.next.next
                current_node.next = next_next_node
              else
                puts 'something probably went wrong'
              end
            end
          end
        end

        # This method adds `node` to the front of the list and must set the list's head to `node`.
        def add_to_front(new_n)
          new_n.next = @head
          @head = new_n

          if @tail.nil?
            @tail = new_n
          end
          @length += 1
        end

        # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
        def remove_front
          if @head.nil?
            puts "Bro, there is nothing to remove"
            return
          end
          new_n = @head
          if @head === @tail
            @head = nil
            @tail = nil
          elsif !@head.nil?
            @head = new_n.next
            if @head.next.nil?
              @tail = @head
            end
          end
          @length -= 1
          new_n
        end

        def find_node(key)
          c_n = @head
          while !c_n.nil? && c_n.key != key
            c_n = c_n.next
          end
          c_n
        end

        def size
          @length
        end
      end

    end

    # Node - Individual Topic
    # Source: popular_data_structures/hash_table/hash_table_separate_chaining/node.rb
    #
    # == Related Topics
    # - LinkedList
    # - SeparateChaining
    # - SeparateChainingSpec
    # - UniversalHash
    #
    class Node

      # === Content from popular_data_structures/hash_table/hash_table_separate_chaining/node.rb ===

      class Node
        attr_accessor :next
        attr_accessor :key
        attr_accessor :value

        def initialize(key, value)
          @key = key
          @value = value
        end
      end

    end

    # SeparateChaining - Individual Topic
    # Source: popular_data_structures/hash_table/hash_table_separate_chaining/separate_chaining.rb
    #
    # == Related Topics
    # - LinkedList
    # - Node
    # - SeparateChainingSpec
    # - UniversalHash
    #
    class SeparateChaining

      # === Content from popular_data_structures/hash_table/hash_table_separate_chaining/separate_chaining.rb ===

      require_relative 'node'
      require_relative 'linked_list'
      require_relative 'universal_hash'

      class SeparateChaining
        include UniversalHash

        attr_reader :max_load_factor
        attr_accessor :items, :size

        def initialize(size)
          @max_load_factor = 0.7
          @items = Array.new(size)
          @size = @items.size
          @hash_algorithm = choose_hash_function
        end

        def choose_hash_function
          rand(@@HASH_ALGORITHMS.size - 1)
        end

        def []=(key, value)
          new_n = Node.new(key, value)
          i = index(key, @size)
          in_list = @items[i]
          if in_list.nil?
            list = LinkedList.new
            list.add_to_tail(new_n)
            @items[i] = list
          elsif in_list
            node = @items[i].find_node(key)
            @items[i].delete(node) if node
            @items[i].add_to_tail(new_n)
          end

          self.resize if load_factor > @max_load_factor
        end

        def [](key)
          i = index(key, @size)
          if !@items[i].nil?
            node = @items[i].find_node(key)
            if !node.value.nil?
              return node.value
            end
          end
        end

        # Returns a unique, deterministically reproducible index into an array
        # We are hashing based on strings, let's use the ascii value of each string as
        # a starting point.
        def index(key, input_size)
          universal_hashing(key, input_size)
        end

        # Calculate the current load factor
        # Total values stored/ Total Bags created
        def load_factor
          x = 0.0
          for i in 0..self.size - 1
            if !@items[i].nil?
              x += @items[i].size
            end
          end
          x / self.size
        end

        # Simple method to return the number of items in the hash
        def size
          @size
        end

        # Resize the hash
        def resize
          puts "-----------------------------RESIZE----------------------------------------"
          new_size = size * 2
          old_l = @items.compact
          new_l = Array.new(new_size)
          old_l.each do |list|
            while list.size > 0
              new_n = list.remove_front
              modify_hash(new_l, new_size, new_n.key, new_n.value)
            end
          end
          puts "-----------------------------RESIZE COMPLETE----------------------------------------"
          @items = new_l
          @size = new_size
          @hash_algorithm = choose_hash_function
        end

        def modify_hash(list, input_size, key, value)
          i = index(key, input_size)
          new_n = Node.new(key, value)
          in_list = list.slice(i)
          if in_list
            node = in_list.find_node(key)
            in_list.delete(node) if node
            in_list.add_to_tail(new_n)
          else
            ll = LinkedList.new
            ll.add_to_tail(new_n)
            list[i] = ll
          end
        end

        def print
          for i in 0..self.size - 1
            if !@items[i].nil?
              @items[i].print(i)
            end
          end
        end
      end

    end

    # SeparateChainingSpec - Individual Topic
    # Source: popular_data_structures/hash_table/hash_table_separate_chaining/separate_chaining_spec.rb
    #
    # == Related Topics
    # - LinkedList
    # - Node
    # - SeparateChaining
    # - UniversalHash
    #
    class SeparateChainingSpec

      # === Content from popular_data_structures/hash_table/hash_table_separate_chaining/separate_chaining_spec.rb ===

      include RSpec

      require_relative 'separate_chaining'

      RSpec.xdescribe SeparateChaining, type: Class do
        let(:star_wars_movies) { SeparateChaining.new(6) }

        describe "#index_by_size" do
          it "creates a hash key based on the string value passed in" do
            i = star_wars_movies.index_modulus_method("Star Wars: A New Hope", 6)
            expect(i).to eq 4
          end
        end

        describe "#hash[key] = value" do
          it "does not resize the array when a collision occurs and the values match" do
            hash = SeparateChaining.new(4)
            hash["key"] = "value"
            expect(hash.size).to eq 4
            hash["key"] = "second value"
            expect(hash.size).to eq 4
          end

          it "sets the value of key to value" do
            star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
            star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
            star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
            star_wars_movies["Star Wars: A New Hope"] = "Number Four"
            star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
            star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

            expect(star_wars_movies["Star Wars: The Phantom Menace"]).to eq "Number One"
            expect(star_wars_movies["Star Wars: Attack of the Clones"]).to eq "Number Two"
            expect(star_wars_movies["Star Wars: Revenge of the Sith"]).to eq "Number Three"
            expect(star_wars_movies["Star Wars: A New Hope"]).to eq "Number Four"
            expect(star_wars_movies["Star Wars: The Empire Strikes Back"]).to eq "Number Five"
            expect(star_wars_movies["Star Wars: Return of the Jedi"]).to eq "Number Six"
          end

          context 'when there are same keys being inserted' do
            it 'retains the latest value' do
              star_wars_movies['Han'] = 'Number Seven'
              star_wars_movies['Han'] = 'Number Eight'
              star_wars_movies['Han'] = 'Solo'
              expect(star_wars_movies['Han']).to eql('Solo')
            end
          end
        end

        describe "#load_factor" do
          it "returns the number of items in the hash divided by the size of the underlying array" do
            h = SeparateChaining.new(4)

            # Load Factor starts at zero
            expect(h.load_factor == 0).to be true
            h["key"] = "value"
            h["keytwo"] = "value"

            # Load factor should be .5 when two items are added
            expect(h.load_factor).to eq 0.5
            h["keythree"] = "value"

            # Load factor goes down to .375 (3/8) since when third item is added, load factor goes to .75
            # then the resize is triggered and load factor is recalculated
            expect(h.load_factor).to eq 0.375
          end
        end

        describe "#resize" do
          it "doubles the size of the array when invoked" do
            movies = SeparateChaining.new(6)
            expect(movies.size).to eq 6
            movies.resize
            expect(movies.size).to eq 12
          end

          it "copies existing values properly when the array is resized" do
            movies = SeparateChaining.new(6)
            movies["A New Hope"] = "Average"
            movies["Empire Strikes Back"] = "Excellent"
            movies["Return of the Jedi"] = "The Best"
            movies.resize
            expect(movies.size).to eq 12
            expect(movies["A New Hope"]).to eq "Average"
            expect(movies["Empire Strikes Back"]).to eq "Excellent"
            expect(movies["Return of the Jedi"]).to eq "The Best"
          end
        end
      end

      RSpec.xdescribe '#Algo Evaluation storing ascending numbers' do
        h = SeparateChaining.new(8)
        1..(15000).times do |e|
          h[e.to_s] = e
          if e % 100 == 0
            items_compact = h.items.compact
            linked_list_sizes = {}
            items_compact.each do |ll|
              linked_list_sizes[ll.size.to_s] ||= 0
              linked_list_sizes[ll.size.to_s] += 1
            end
            puts "Size of hash: #{h.size}"
            puts "Occupied items #{items_compact.size}"
            puts "Distribution of LinkedList entries #{linked_list_sizes}"
          end
        end
      end

      RSpec.describe '#Algo Evaluation - storing random characters' do
        h = SeparateChaining.new(8)
        size_of_word = 60
        start_random = 48
        end_random = 126

        1.upto(size_of_word) do |char_size|
          1.upto(50) do |_same_char_length_loop|
            random_characters = (1..char_size).map {|_n| rand(start_random..end_random).chr}.join('')
            h[random_characters] = 'hello world'
          end
          items_compact = h.items.compact
          linked_list_sizes = {}
          items_compact.each do |ll|
            linked_list_sizes[ll.size.to_s] ||= 0
            linked_list_sizes[ll.size.to_s] += 1
          end
          puts "Size of hash: #{h.size}"
          puts "Occupied items #{items_compact.size}"
          puts "Distribution of LinkedList entries #{linked_list_sizes}"
        end
      end

    end

    # UniversalHash - Individual Topic
    # Source: popular_data_structures/hash_table/hash_table_separate_chaining/universal_hash.rb
    #
    # == Related Topics
    # - LinkedList
    # - Node
    # - SeparateChaining
    # - SeparateChainingSpec
    #
    class UniversalHash

      # === Content from popular_data_structures/hash_table/hash_table_separate_chaining/universal_hash.rb ===

      module UniversalHash
        @@HASH_ALGORITHMS = [
          :index_multiplication_method,
          :index_division_method_with_prime,
          :index_division_method_with_linear,
          :index_modulus_method
        ]

        def universal_hashing(key, input_size)
          hash_algorithm = @@HASH_ALGORITHMS[@hash_algorithm]
          self.send(hash_algorithm, key, input_size)
        end

        # In the multiplication method, we create an index in the array by:
        #   First multiplying the key by a constant A which is between 0 and 1, and taking the decimal result.
        #   Then multiply that by the size of the array m and rounding down.
        #   h(k) = floor(m * (k * A mod 1))
        def index_multiplication_method(key, input_size)
          constant = 0.618033988749895 # (sqr(5) - 1)/2  # Recommended by knuth pg.264
          r1 = ((key.sum * constant) % 1).floor
          (input_size * r1).floor
        end

        # Introduction to Algorithms 3rd Edition - Cormen, Leiserson, Rivest, Stein
        # 11.3
        def index_division_method_with_prime(key, input_size)
          return 3 if input_size <= 3
          key_sum = key.sum
          collision_threshold = input_size / 3
          prime_number = find_closest_prime(collision_threshold)
          index = key_sum % prime_number
          index
        end

        def index_division_method_with_linear(key, input_size)
          # Formula = h(k) = (2k + 3) % size
          key_sum = key.sum
          h_k = (key_sum * 2) + 3
          h_k % input_size
        end

        def find_closest_prime(num)
          until is_prime(num)
            num -= 1
          end
          num
        end

        def is_prime(n)
          return false if n <= 1
          return true if n <= 3
          return false if ((n % 2) == 0) || ((n % 3) == 0)
          i = 5
          while i * i <= n
            return false if n % i == 0 || n % (i + 2) == 0
            i += 6
          end
          return true
        end

        def index_modulus_method(key, size)
          key.sum % size
        end
      end

    end

  end

  # Documentation from popular_data_structures/probabilistic/Probablistic.md
  #
  # Found a good source
  # https://dataconomy.com/2017/04/big-data-101-data-structures/
  #
  #
  # == Table of Contents
  # - BloomFilter
  # - SkipList
  #
  module Probabilistic

    # SkipList - Individual Topic
    # Source: popular_data_structures/probabilistic/skip_list/skip_list.rb
    # Credits to: https://github.com/light24bulbs/dynamic-skiplist/blob/master/lib/dskiplist.rb
    #
    class SkipList

      # === Content from popular_data_structures/probabilistic/skip_list/skip_list.rb ===

      # Credits to: https://github.com/light24bulbs/dynamic-skiplist/blob/master/lib/dskiplist.rb

      class DSkipList
        attr_accessor :level
        attr_accessor :header
        include Enumerable

        class Node
          attr_accessor :key
          attr_accessor :value
          attr_accessor :forward

          def initialize(k, v = nil)
            @key = k
            @value = v.nil? ? k : v
            @forward = []
          end
        end

        def initialize(top_level = Float::INFINITY)
          @header = Node.new(1)
          @level = 0
          @max_level = top_level
          @p = 0.5
          @node_nil = Node.new(1000000)
        end

        def clear
          initialize(@max_level)
          return self
        end

        #returns previous node if exact key match is not found
        def find_node(search_key)
          x = @header
          @level.downto(0) do |i|
            #puts "on level #{i}"
            while x.forward[i] and x.forward[i].key < search_key
              #puts "walked node #{x.key} on level #{i}"
              x = x.forward[i]
            end
          end
          x = x.forward[0] if x.forward[0].key == search_key
          return x
        end

        def [] key
          node = self.find_node(key)
          if node and node.key == key
            return node.value
          else
            return nil
          end
        end

        def random_level
          v = 0
          while rand < @p && v < @max_level
            v += 1
          end
          v
        end

        def delete(search_key)
          update = []
          x = @header
          @level.downto(0) do |i|
            while x.forward[i] and x.forward[i].key < search_key
              x = x.forward[i]
            end
            update[i] = x
          end
          x = x.forward[0]
          if x and x.key == search_key
            0.upto(x.forward.length - 1) do |i|
              update[i].forward[i] = x.forward[i]
            end
            return true
          else
            return false
          end
        end


        def insert(search_key, new_value = nil)
          new_value = search_key if new_value.nil?
          update = []
          x = @header
          @level.downto(0) do |i|
            while x.forward[i] and x.forward[i].key < search_key
              x = x.forward[i]
            end
            update[i] = x
          end
          x = x.forward[0]
          if x and x.key == search_key
            x.value = new_value
          else
            v = random_level
            if v > @level
              (@level + 1).upto(v) do |i|
                update[i] = @header
              end
              @level = v
            end
            x = Node.new(search_key, new_value)
            0.upto(v) do |i|
              x.forward[i] = update[i].forward[i]
              update[i].forward[i] = x
            end
          end
          return self
        end

        def []= key, value
          self.insert(key, value)
        end

        def insert_hash(hash)
          hash.each {|key, value| self[key] = value}
          return self
        end

        def count(from = nil, to = nil, level = 0)
          walk(from, to, nil, level, nil)
        end

        def walk(from, to, limit, level, output)
          if from
            x = find_node(from)
            x = x.forward[level] if x.forward[level]
          else
            x = @header.forward[level]
          end
          #if no block is given, assume we are trying to count and avoid the expensive yield below
          if !block_given?
            count = 0
            while x
              break if to && x.key >= to
              count += 1
              x = x.forward[level]
            end
            return count
          elsif to or limit
            count = 0
            while !x.nil?
              yield(x, output)
              count += 1
              break if to and x.key >= to
              break if limit and count == limit
              x = x.forward[level]
            end
          else
            while x
              yield(x, output)
              x = x.forward[level]
            end
          end
          return output
        end

        def to_h(from = nil, to = nil, limit = nil, level = 0)
          walk(from, to, limit, level, {}) {|n, hash| hash[n.key] = n.value}
        end

        def to_a(from = nil, to = nil, limit = nil, level = 0)
          walk(from, to, limit, level, []) {|n, arr| arr.push(n.value)}
        end
        alias_method :to_ary, :to_a

        def largest
          x = @header
          @level.downto(0) do |i|
            while x.forward[i]
              x = x.forward[i]
            end
          end
          return x.value
        end

        def smallest
          return @header.forward[0].value
        end

        def to_s
          str = ""
          @level.downto(0) do |l|
            str << "Level #{l}: " + to_a(nil, nil, nil, l).join('-') + "\n"
          end
          return str
        end

        def each(&block)
          self.to_a.each(&block)
        end

      end

    end

  end

  # Documentation from popular_data_structures/queues/Queues.md
  #
  # ## Queue
  # The basis of Stacks is the FIFO concept where items pushed first into a store are also the first to come out.
  #
  # ## Implementations
  #
  # ### LinkedList
  # Enqueuing into the linked list can be implemented by appending to the back of the singly-linked list, which takes worst-case time O(1). Dequeuing can be implemented by removing the first element, which also takes worst-case time O(1). This also requires a new allocation per enqueue, which may be slow.
  #
  # ### Circular Buffer
  # Enqueuing into the circular buffer works by inserting something at the next free position in the [circular buffer]. This works by growing the array if necessary, then inserting the new element. Using a similar analysis for the dynamic array, this takes best-case time O(1), worst-case time O(n), and amortized time O(1). Dequeuing from the buffer works by removing the first element of the circular buffer, which takes time O(1) in the worst case.
  #
  # ## Use cases
  #
  #
  # rdoc-image:assets/fifo.png
  # Credits to wikipedia
  #
  # [circular buffer]: <https://www.youtube.com/watch?v=ia__kyuwGag>
  #
  #
  # == Table of Contents
  # - QueueCircularBuffer
  # - QueueLinkedList
  #
  module Queues

    # QueueCircularBuffer - Individual Topic
    # Source: popular_data_structures/queues/queue_circular_buffer.rb
    # This is mainly for demonstrative purposes. In Ruby, Arrays.new are already has dynamic size increase
    # functionality. Some implementations might not make sense if you're well versed in ruby. :)
    #
    #
    # == Related Topics
    # - QueueLinkedList
    #
    class QueueCircularBuffer

      # === Content from popular_data_structures/queues/queue_circular_buffer.rb ===

      # This is mainly for demonstrative purposes. In Ruby, Arrays.new are already has dynamic size increase
      # functionality. Some implementations might not make sense if you're well versed in ruby. :)

      class DynamicCircularBuffer
        def initialize(size = 8)
          @buffer = Array.new(size)
          reset_pointers
        end

        def clear
          @buffer.clear
          reset_pointers
        end

        def enqueue(value)
          resize if full?
          return @buffer[@tail_pointer] = value if @buffer[@tail_pointer].nil?
          @tail_pointer = (@tail_pointer + 1) % size
          @buffer[@tail_pointer] = value
        end

        def dequeue
          return nil if empty?
          value = @buffer[@head_pointer]
          @buffer[@head_pointer] = nil
          return value if empty?
          @head_pointer = (@head_pointer + 1) % size
          value
        end

        def size
          @buffer.size
        end

        def resize
          # O(n)
          old_size = size
          new_array = Array.new(old_size * 2, default = nil)
          @buffer = populate_new_array(new_array)
          @head_pointer = 0
          @tail_pointer = (old_size - 1)
        end

        def populate_new_array(new)
          head = @head_pointer
          if @head_pointer < @tail_pointer
            until head == @tail_pointer
              new[head] = @buffer[head]
              head += 1
            end
          else
            count = 0
            head.upto(size - 1) do |index|
              new[count] = @buffer[index]
              count += 1
            end
            0.upto(@tail_pointer) do |index|
              new[count] = @buffer[index]
              count += 1
            end
          end
          new
        end

        def enumerate
          temp = []
          head = @head_pointer
          if @head_pointer < @tail_pointer
            until head == @tail_pointer
              temp.push(@buffer[head])
              head += 1
            end
          else
            head.upto(size - 1) do |index|
              temp.push(@buffer[index])
            end
            0.upto(@tail_pointer) do |index|
              temp.push(@buffer[index])
            end
          end
          temp
        end

        def empty?
          @buffer[@head_pointer].nil? && @head_pointer == @tail_pointer
        end

        def full?
          @head_pointer == (@tail_pointer % size) + 1
        end

        def reset_pointers
          @head_pointer = 0
          @tail_pointer = 0
        end

        def info
          puts "buffer: #{@buffer}"
          puts "head: #{@head_pointer}"
          puts "tail: #{@tail_pointer}"
        end
      end

      dcb = DynamicCircularBuffer.new(4)
      dcb.enqueue(5)
      dcb.enqueue(3)
      dcb.enqueue(1)
      dcb.enqueue(0)
      dcb.info
      dcb.dequeue
      dcb.info
      dcb.dequeue
      dcb.info
      dcb.dequeue
      dcb.info
      dcb.dequeue
      dcb.info
      dcb.dequeue
      dcb.info

      dcb.enqueue(5)
      dcb.enqueue(3)
      dcb.enqueue(1)
      dcb.enqueue(0)
      dcb.info
      dcb.enqueue(10)
      dcb.info

    end

    # QueueLinkedList - Individual Topic
    # Source: popular_data_structures/queues/queue_linked_list.rb
    # class Node
    #   attr_accessor :data, :next
    #
    #   def initialize(data)
    #     @data = data
    #     @next = nil
    #   end
    # end
    #
    # class LinkedList
    #   attr_accessor :last_node
    #
    #   alias :pop :dequeue
    #   alias :push :enqueue
    #
    #   def initialize(data=nil)
    #     @last_node = Node.new(data)
    #   end
    #
    #   # O(N) to insert to the end
    #   def insert(value)
    #     new_node = Node.new(value)
    #     curr_node = @last_node
    #     # First Node will be null
    #     return new_node if curr_node.nil?
    #
    #     # Go to the last node then, add the next reference.
    #     curr_node = curr_node.next until curr_node.next.nil?
    #     curr_node.next = new_node
    #     @last_node
    #   end
    #
    #   def display(head = @last_node)
    #     current = head
    #     while current
    #       print current.data, " "
    #       current = current.next
    #     end
    #   end
    # end
    #
    # class Stacks < LinkedList
    # end
    #
    # my_list = Stacks.new(1)
    # [1,2,2,2,3,3,4].each do |data|
    #   my_list.insert_end(data)
    # end
    # my_list.remove_duplicates
    # my_list.display
    # puts
    # my_list.enqueue(5)
    # my_list.display
    #
    #
    # == Related Topics
    # - QueueCircularBuffer
    #
    class QueueLinkedList

      # === Content from popular_data_structures/queues/queue_linked_list.rb ===

      # class Node
      #   attr_accessor :data, :next
      #
      #   def initialize(data)
      #     @data = data
      #     @next = nil
      #   end
      # end
      #
      # class LinkedList
      #   attr_accessor :last_node
      #
      #   alias :pop :dequeue
      #   alias :push :enqueue
      #
      #   def initialize(data=nil)
      #     @last_node = Node.new(data)
      #   end
      #
      #   # O(N) to insert to the end
      #   def insert(value)
      #     new_node = Node.new(value)
      #     curr_node = @last_node
      #     # First Node will be null
      #     return new_node if curr_node.nil?
      #
      #     # Go to the last node then, add the next reference.
      #     curr_node = curr_node.next until curr_node.next.nil?
      #     curr_node.next = new_node
      #     @last_node
      #   end
      #
      #   def display(head = @last_node)
      #     current = head
      #     while current
      #       print current.data, " "
      #       current = current.next
      #     end
      #   end
      # end
      #
      # class Stacks < LinkedList
      # end
      #
      # my_list = Stacks.new(1)
      # [1,2,2,2,3,3,4].each do |data|
      #   my_list.insert_end(data)
      # end
      # my_list.remove_duplicates
      # my_list.display
      # puts
      # my_list.enqueue(5)
      # my_list.display
      #

    end

  end

  # Documentation from popular_data_structures/stacks/Stacks.md
  #
  # ## Stacks
  # The basis of Stacks is the LIFO concept where items that are last "pushed" into
  # store are also the first item to be "popped" out.
  #
  # ## Implementations
  # There are multiple ways to implement Stack. In ruby, the basic "_Array_" standard
  # object already acts like a Stack with its notable methods of "#.pop()" and "#.push()"
  #
  # Another way is via "_LinkedList_" where the "head" of the list is the last object being inserted
  # and constantly updated as the new head when new items are being pushed.
  #
  # ### LinkedList
  # Because a singly-linked list supports O(1) time prepend and delete-first, the cost to push or pop into a linked-list-backed stack is also O(1) worst-case. However, each new element added requires a new allocation, and allocations can be expensive compared to other operations.
  #
  # ### (Dynamic) Array
  # Pushing onto the stack can be implemented by appending a new element to the dynamic array, which takes amortized O(1) time and worst-case O(n) time. Popping from the stack can be implemented by just removing the last element, which runs in worst-case O(1) (or amortized O(1) if you want to try to reclaim unused space). In other words, the most common implementation has best-case O(1) push and pop, worst-case O(n) push and O(1) pop, and amortized O(1) push and O(1) pop.
  #
  # ## Use cases
  # - Testing for symmetry. It can be used in parsers. For example a JSON parser needs to check balancing brackets.
  # - Has a special property of reversing order for a given stream of inputs, and then outputting the same stream.
  # - Can be implemented as "Undo" storing command for systems. (The "Redo" command would be another stack storing the output of the "Undo" stack)
  #
  # rdoc-image:assets/lifo.png Credits to Wikipedia
  #
  #
  # == Table of Contents
  # - SortableStacks
  # - StacksLinkedList
  # - StacksRubyArray
  #
  module Stacks

    # SortableStacks - Individual Topic
    # Source: popular_data_structures/stacks/sortable_stacks.rb
    #
    # == Related Topics
    # - StacksLinkedList
    # - StacksRubyArray
    #
    class SortableStacks

      # === Content from popular_data_structures/stacks/sortable_stacks.rb ===

      require_relative './stacks_linked_list'

      # Sort Stack: Write a program to sort a stack such that the smallest items are on the top.
      # You can use an additional temporary stack,
      # but you may not copy the elements into any other data structure (such as an array).
      # The stack supports the following operations: push, pop, peek, and isEmpty?.

      class SortableStacks < Stacks
        def sort
          # Separate stack would have the sorted stack.
          temp_stack = Stacks.new
          until self.empty?
            node = self.pop
            if temp_stack.empty?
              temp_stack.push(node.data)
            else
              temp_stack_node = temp_stack.head
              compared = compare(node.data, temp_stack_node.data)
              # Scenario where current node is smaller than all of the nodes in the temp stack
              if compared <= 0
                node.next = temp_stack_node
                temp_stack.head = node
              else
                # Scenario where the insert of the temp stack is somewhere in the middle, we keep iterating
                # until current node can be put between this node and next node
                until compare(node.data, temp_stack_node.data) == 1 && compare(node.data, temp_stack_node.next.data) <= 0
                  temp_stack_node = temp_stack_node.next
                end
                temp_stack_node_next = temp_stack_node.next
                temp_stack_node.next = node
                node.next = temp_stack_node_next
              end
            end
          end
          @head = temp_stack.head
        end

        def compare(new_node, temp_stack_node)
          # Compare function can give reverse results if we wanted to sort ASC or DESC
          # result = temp_stack_node <=> new_node
          result = new_node <=> temp_stack_node
          return 0 if result.nil?
          result
        end

        def fancy_sort
          # by Gayle Laakman McDowell
          r = Stacks.new
          s = self
          while !s.empty?
            tmp = s.pop
            # This while loop makes sure tmp variable is smaller than r.peek
            while !r.empty? && r.peek > tmp.data
              s.push(r.pop.data)
            end
            r.push(tmp.data)
          end
          # By this time, the new stack would have all of the sorted data.
          while !r.empty?
            s.push(r.pop.data)
          end
        end
      end

      # [5, 3, 1, 10, 9]
      my_stack = SortableStacks.new
      [3, 1, 5, 10, 9].each do |num|
        my_stack.push(num)
      end
      my_stack.display
      my_stack.fancy_sort
      my_stack.display


      my_stack = SortableStacks.new
      [2,4,7,8,6].each do |num|
        my_stack.push(num)
      end
      my_stack.display
      my_stack.sort
      my_stack.display

    end

    # StacksLinkedList - Individual Topic
    # Source: popular_data_structures/stacks/stacks_linked_list.rb
    #
    # == Related Topics
    # - SortableStacks
    # - StacksRubyArray
    #
    class StacksLinkedList

      # === Content from popular_data_structures/stacks/stacks_linked_list.rb ===

      require_relative '../linked_list'

      class Stacks < LinkedList
        # create common methods in Stacks such as: enqueue, dequeue, push, pop, peek, and isEmpty
        alias :dequeue :remove_front
        alias :enqueue :insert_front

        alias :pop :dequeue
        alias :push :enqueue

        def peek
          return @head.data
        end

        def empty?
          @head.data.nil?
        end
      end

      # my_list = Stacks.new(1)
      # [1,2,2,2,3,3,4].each do |data|
      #   my_list.insert_end(data)
      # end
      # my_list.removeDuplicates
      # my_list.display
      # my_list.enqueue(5)
      # my_list.display
      # my_list.dequeue
      # my_list.dequeue
      # my_list.dequeue
      # my_list.dequeue
      # my_list.display
      # my_list.dequeue
      # my_list.display



    end

    # StacksRubyArray - Individual Topic
    # Source: popular_data_structures/stacks/stacks_ruby_array.rb
    # Best implementation I've done so far.
    #
    #
    # == Related Topics
    # - SortableStacks
    # - StacksLinkedList
    #
    class StacksRubyArray

      # === Content from popular_data_structures/stacks/stacks_ruby_array.rb ===

      # Best implementation I've done so far.

      class Stacks < Array
        alias :enqueue :push
        alias :dequeue :pop
      end

      stacks = Stacks.new
      stacks.enqueue(5)
      stacks.enqueue(4)
      stacks.enqueue(10)

      puts stacks.dequeue
      puts stacks.dequeue
      puts stacks.dequeue

    end

  end

  # Trees module
  #
  # == Table of Contents
  # - Trie
  # - AvlTree
  # - BinarySearchTree
  # - RedBlackTree
  #
  module Trees

    # Trie - Individual Topic
    # Source: popular_data_structures/trees/trie.rb
    # https://leetcode.com/problems/implement-trie-prefix-tree/
    #
    # A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
    #
    #   Implement the Trie class:
    #
    # Trie() Initializes the trie object.
    #   void insert(String word) Inserts the string word into the trie.
    #   boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
    #   boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
    #
    #
    #   Example 1:
    #
    #   Input
    # ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
    # [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
    # Output
    # [null, null, true, false, true, null, true]
    #
    # Explanation
    # Trie trie = new Trie();
    # trie.insert("apple");
    # trie.search("apple");   // return True
    # trie.search("app");     // return False
    # trie.startsWith("app"); // return True
    # trie.insert("app");
    # trie.search("app");     // return True
    #
    #
    # Constraints:
    #
    #   1 <= word.length, prefix.length <= 2000
    # word and prefix consist only of lowercase English letters.
    #   At most 3 * 104 calls in total will be made to insert, search, and startsWith.
    #
    #
    class Trie

      # === Content from popular_data_structures/trees/trie.rb ===

      # https://leetcode.com/problems/implement-trie-prefix-tree/

      # A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
      #
      #   Implement the Trie class:
      #
      # Trie() Initializes the trie object.
      #   void insert(String word) Inserts the string word into the trie.
      #   boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
      #   boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
      #
      #
      #   Example 1:
      #
      #   Input
      # ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
      # [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
      # Output
      # [null, null, true, false, true, null, true]
      #
      # Explanation
      # Trie trie = new Trie();
      # trie.insert("apple");
      # trie.search("apple");   // return True
      # trie.search("app");     // return False
      # trie.startsWith("app"); // return True
      # trie.insert("app");
      # trie.search("app");     // return True
      #
      #
      # Constraints:
      #
      #   1 <= word.length, prefix.length <= 2000
      # word and prefix consist only of lowercase English letters.
      #   At most 3 * 104 calls in total will be made to insert, search, and startsWith.
      #

      class Trie

      # Initialize your data structure here.
        def initialize()
          @root = {}
          @end = "#"
        end

      # Inserts a word into the trie.
      # :type word: String
      # :rtype: Void
        def insert(word)
          node = @root

          0.upto(word.length - 1) do |i|
            char = word[i]
            if not node[char]
              node[char] = {}
            end
            node = node[char]
          end

          node[@end] = true
        end

      # Returns if the word is in the trie.
      # :type word: String
      # :rtype: Boolean
        def search(word)
          node = @root
          0.upto(word.length - 1) do |i|
            char = word[i]
            if not node[char]
              return false
            end
            node = node[char]
          end
          node[@end] == true
        end

      # Returns if there is any word in the trie that starts with the given prefix.
      # :type prefix: String
      # :rtype: Boolean
        def starts_with(prefix)
          node = @root
          0.upto(prefix.length - 1) do |i|
            char = prefix[i]
            if not node[char]
              return false
            end
            node = node[char]
          end
          true
        end

      end

      # Your Trie object will be instantiated and called as such:
      obj = Trie.new()
      obj.insert("apple")
      obj.search("apple")
      obj.search("app")
      obj.starts_with("app")
      obj.insert("app")
      puts param_2 = obj.search("app")
      obj.insert("applachian")
      obj.search("applachian")
      puts obj.search("apple")

    end

    # RedBlackTree - Individual Topic
    # Source: popular_data_structures/trees/red_black_tree/red_black_tree.rb
    # # https://github.com/headius/redblack/blob/master/red_black_tree.rb
    #
    # # frozen_string_literal: true
    #
    # # rubocop:disable Layout/CommentIndentation
    # class Node
    #   attr_accessor :left, :right, :val, :color, :parent
    #
    #   def initialize(val, color=0)
    #     @left = @right = @parent = nil
    #     @val = val
    #     @color = color # zero is black, 1 is red
    #   end
    # end
    #
    # class RedBlackTree
    #   # Properties
    #   # 1. Every node has a colour either red or black.
    #   # 2. The root of the tree is always black.
    #   # 3. There are no two adjacent red nodes (A red node cannot have a red parent or red child).
    #   # 4. Every path from a node (including root) to any of its descendants NULL nodes has the same number of black nodes.
    #
    #   attr_reader :root, :black_height
    #
    #   def initialize
    #     @black_height = 0
    #   end
    #
    #   def insert(val, node = @root)
    #     if self.root.nil?
    #       nd = Node.new(val)
    #       nd.color = 1
    #       self.black_height += 1
    #       return self.root = nd
    #     end
    #     # Step 1 - Perform normal BST
    #     if node.nil?
    #       return Node.new(val)
    #     elsif val < node.val
    #       node.left = insert(val, node.left)
    #       node.left.color = 1
    #       node.left.parent = node
    #       recolor(node.left)
    #     else
    #       node.right = insert(val, node.right)
    #       node.right.color = 1
    #       node.right.parent = node
    #       recolor(node.right)
    #     end
    #
    #   end
    #
    #   def recolor(node)
    #     return if node&.parent&.parent.nil?
    #
    #     grand_parent = node.parent.parent
    #     if uncle_color(node) == 1
    #       grand_parent&.left.color = 0
    #       grand_parent&.right.color = 0
    #       grand_parent.color = 1
    #       node.color = 1
    #     else
    #       rotate_nodes(node)
    #     end
    #   end
    #
    #   def rotate_nodes(node)
    #     ## left left case
    #     grand_parent = node.parent.parent
    #     if node.parent.color == 1
    #
    #     end
    #   end
    #
    #   # input node should be child
    #   def uncle_color(node)
    #     # return 0 if node&.parent&.parent&.nil?
    #     grand_parent = node.parent.parent
    #     [grand_parent.left.color, grand_parent.right.color].max
    #   end
    #
    #   def left_rotate(z)
    #     y = z.right
    #     t2 = y.left
    #
    #     # perform rotation
    #     y.left = z
    #     z.right = t2
    #
    #     # Update heights
    #     z.height = 1 + [get_height(z.left), get_height(z.right)].max
    #     y.height = 1 + [get_height(y.left), get_height(y.right)].max
    #
    #     # return the new root
    #     y
    #   end
    #
    #   #      T1, T2, T3 and T4 are subtrees.
    #   #        z                                      y
    #   #       / \                                   /   \
    #   #      y   T4      Right Rotate (z)          x      z
    #   #     / \          - - - - - - - - ->      /  \    /  \
    #   #    x   T3                               T1  T2  T3  T4
    #   #   / \
    #   # T1   T2
    #
    #   # or in summary
    #   #        z                                      y
    #   #       /                                         \
    #   #      y           Right Rotate (z)                z
    #   #       \          - - - - - - - - ->             /
    #   #        T3                                     T3
    #
    #   def right_rotate(z)
    #     y = z.left
    #     t3 = y.right
    #
    #     # perform rotation
    #     y.right = z
    #     z.left = t3
    #
    #     # Update heights
    #     z.height = 1 + [get_height(z.left), get_height(z.right)].max
    #     y.height = 1 + [get_height(y.left), get_height(y.right)].max
    #
    #     # return the new root
    #     y
    #   end
    #
    #   # Other examples
    #   # Left rotate, right rotate
    #   #      z                               z                           x
    #   #     / \                            /   \                        /  \
    #   #    y   T4  Left Rotate (y)        x    T4  Right Rotate(z)    y      z
    #   #   / \      - - - - - - - - ->    /  \      - - - - - - - ->  / \    / \
    #   # T1   x                          y    T3                    T1  T2 T3  T4
    #   #     / \                        / \
    #   #   T2   T3                    T1   T2
    #
    #   # Right rotate, left rotate
    #   #    z                            z                            x
    #   #   / \                          / \                          /  \
    #   # T1   y   Right Rotate (y)    T1   x      Left Rotate(z)   z      y
    #   #     / \  - - - - - - - - ->     /  \   - - - - - - - ->  / \    / \
    #   #    x   T4                      T2   y                  T1  T2  T3  T4
    #   #   / \                              /  \
    #   #  T2   T3                          T3   T4
    #
    #   def get_height(node = @root)
    #     return 0 if node.nil?
    #
    #     node.height
    #   end
    #
    #   def get_balance(node = @root)
    #     return 0 if node.nil?
    #
    #     get_height(node.left) - get_height(node.right)
    #   end
    #
    #   def pre_order(node = @root)
    #     return if node.nil?
    #
    #     puts "#{node.val} "
    #     pre_order(node.left)
    #     pre_order(node.right)
    #   end
    #
    #   def get_min_value_node(node)
    #     return node if node.nil? || node.left.nil?
    #
    #     get_min_value_node(node.left)
    #   end
    #
    #   # Time Complexity: The rotation operations (left and right rotate) take constant time as only few pointers are being changed there.
    #   # Updating the height and getting the balance factor also take constant time.
    #   # So the time complexity of AVL delete remains same as BST delete which is O(h) where h is height of the tree.
    #   # Since AVL tree is balanced, the height is O(Logn). So time complexity of AVL delete is O(Log n).
    #   def delete(value, node = @root)
    #     # Step 1 - Perform standard BST delete
    #     return node if node.nil?
    #
    #     if value < node.val
    #       node.left = delete(value, node.left)
    #
    #     elsif value > node.val
    #       node.right = delete(value, node.right)
    #
    #     else
    #       if node.left.nil?
    #         temp = node.right
    #         node = nil
    #         return temp
    #
    #       elsif node.right.nil?
    #         temp = node.left
    #         node = nil
    #         return temp
    #       end
    #
    #       temp = get_min_value_node(node.right)
    #       node.val = temp.val
    #       node.right = delete(temp.val, node.right)
    #
    #       # If the tree has only one node,
    #       # simply return it
    #       return node if node.nil?
    #
    #       # Step 2 - Update the height of the
    #       # ancestor node
    #       node.height = 1 + max(get_height(node.left), get_height(node.right))
    #
    #       # Step 3 - Get the balance factor
    #       balance = get_balance(node)
    #
    #       # Step 4 - If the node is unbalanced,
    #       # then try out the 4 cases
    #       # Case 1 - Left Left
    #       if balance > 1 && get_balance(node.left) >= 0
    #         return right_rotate(node)
    #       end
    #
    #       # Case 2 - Right Right
    #       if balance < -1 && get_balance(node.right) <= 0
    #         return left_rotate(node)
    #       end
    #
    #       # Case 3 - Left Right
    #       if balance > 1 && get_balance(node.left) < 0
    #         node.left = left_rotate(node.left)
    #         return right_rotate(node)
    #       end
    #
    #       # Case 4 - Right Left
    #       if balance < -1 && get_balance(node.right) > 0
    #         node.right = right_rotate(node.right)
    #         return left_rotate(node)
    #       end
    #     end
    #     node
    #   end
    #
    # end
    #
    # # Driver program to test above function
    # avl = AVLTree.new
    #
    # root = avl.insert(10)
    # root = avl.insert(20, root)
    # root = avl.insert(30, root)
    # root = avl.insert(40, root)
    # root = avl.insert(50, root)
    # root = avl.insert(25, root)
    #
    # # The constructed AVL Tree would be
    # #             30
    # #            /  \
    # #          20   40
    # #         /  \     \
    # #        10  25    50
    #
    # # Preorder Traversal
    # avl.pre_order(root)
    #
    # # rubocop:enable Layout/CommentIndentation
    #
    # puts "Deleting 10"
    # avl.delete(10, root)
    #
    # avl.pre_order(root)
    #
    class RedBlackTree

      # === Content from popular_data_structures/trees/red_black_tree/red_black_tree.rb ===

      # # https://github.com/headius/redblack/blob/master/red_black_tree.rb
      #
      # # frozen_string_literal: true
      #
      # # rubocop:disable Layout/CommentIndentation
      # class Node
      #   attr_accessor :left, :right, :val, :color, :parent
      #
      #   def initialize(val, color=0)
      #     @left = @right = @parent = nil
      #     @val = val
      #     @color = color # zero is black, 1 is red
      #   end
      # end
      #
      # class RedBlackTree
      #   # Properties
      #   # 1. Every node has a colour either red or black.
      #   # 2. The root of the tree is always black.
      #   # 3. There are no two adjacent red nodes (A red node cannot have a red parent or red child).
      #   # 4. Every path from a node (including root) to any of its descendants NULL nodes has the same number of black nodes.
      #
      #   attr_reader :root, :black_height
      #
      #   def initialize
      #     @black_height = 0
      #   end
      #
      #   def insert(val, node = @root)
      #     if self.root.nil?
      #       nd = Node.new(val)
      #       nd.color = 1
      #       self.black_height += 1
      #       return self.root = nd
      #     end
      #     # Step 1 - Perform normal BST
      #     if node.nil?
      #       return Node.new(val)
      #     elsif val < node.val
      #       node.left = insert(val, node.left)
      #       node.left.color = 1
      #       node.left.parent = node
      #       recolor(node.left)
      #     else
      #       node.right = insert(val, node.right)
      #       node.right.color = 1
      #       node.right.parent = node
      #       recolor(node.right)
      #     end
      #
      #   end
      #
      #   def recolor(node)
      #     return if node&.parent&.parent.nil?
      #
      #     grand_parent = node.parent.parent
      #     if uncle_color(node) == 1
      #       grand_parent&.left.color = 0
      #       grand_parent&.right.color = 0
      #       grand_parent.color = 1
      #       node.color = 1
      #     else
      #       rotate_nodes(node)
      #     end
      #   end
      #
      #   def rotate_nodes(node)
      #     ## left left case
      #     grand_parent = node.parent.parent
      #     if node.parent.color == 1
      #
      #     end
      #   end
      #
      #   # input node should be child
      #   def uncle_color(node)
      #     # return 0 if node&.parent&.parent&.nil?
      #     grand_parent = node.parent.parent
      #     [grand_parent.left.color, grand_parent.right.color].max
      #   end
      #
      #   def left_rotate(z)
      #     y = z.right
      #     t2 = y.left
      #
      #     # perform rotation
      #     y.left = z
      #     z.right = t2
      #
      #     # Update heights
      #     z.height = 1 + [get_height(z.left), get_height(z.right)].max
      #     y.height = 1 + [get_height(y.left), get_height(y.right)].max
      #
      #     # return the new root
      #     y
      #   end
      #
      #   #      T1, T2, T3 and T4 are subtrees.
      #   #        z                                      y
      #   #       / \                                   /   \
      #   #      y   T4      Right Rotate (z)          x      z
      #   #     / \          - - - - - - - - ->      /  \    /  \
      #   #    x   T3                               T1  T2  T3  T4
      #   #   / \
      #   # T1   T2
      #
      #   # or in summary
      #   #        z                                      y
      #   #       /                                         \
      #   #      y           Right Rotate (z)                z
      #   #       \          - - - - - - - - ->             /
      #   #        T3                                     T3
      #
      #   def right_rotate(z)
      #     y = z.left
      #     t3 = y.right
      #
      #     # perform rotation
      #     y.right = z
      #     z.left = t3
      #
      #     # Update heights
      #     z.height = 1 + [get_height(z.left), get_height(z.right)].max
      #     y.height = 1 + [get_height(y.left), get_height(y.right)].max
      #
      #     # return the new root
      #     y
      #   end
      #
      #   # Other examples
      #   # Left rotate, right rotate
      #   #      z                               z                           x
      #   #     / \                            /   \                        /  \
      #   #    y   T4  Left Rotate (y)        x    T4  Right Rotate(z)    y      z
      #   #   / \      - - - - - - - - ->    /  \      - - - - - - - ->  / \    / \
      #   # T1   x                          y    T3                    T1  T2 T3  T4
      #   #     / \                        / \
      #   #   T2   T3                    T1   T2
      #
      #   # Right rotate, left rotate
      #   #    z                            z                            x
      #   #   / \                          / \                          /  \
      #   # T1   y   Right Rotate (y)    T1   x      Left Rotate(z)   z      y
      #   #     / \  - - - - - - - - ->     /  \   - - - - - - - ->  / \    / \
      #   #    x   T4                      T2   y                  T1  T2  T3  T4
      #   #   / \                              /  \
      #   #  T2   T3                          T3   T4
      #
      #   def get_height(node = @root)
      #     return 0 if node.nil?
      #
      #     node.height
      #   end
      #
      #   def get_balance(node = @root)
      #     return 0 if node.nil?
      #
      #     get_height(node.left) - get_height(node.right)
      #   end
      #
      #   def pre_order(node = @root)
      #     return if node.nil?
      #
      #     puts "#{node.val} "
      #     pre_order(node.left)
      #     pre_order(node.right)
      #   end
      #
      #   def get_min_value_node(node)
      #     return node if node.nil? || node.left.nil?
      #
      #     get_min_value_node(node.left)
      #   end
      #
      #   # Time Complexity: The rotation operations (left and right rotate) take constant time as only few pointers are being changed there.
      #   # Updating the height and getting the balance factor also take constant time.
      #   # So the time complexity of AVL delete remains same as BST delete which is O(h) where h is height of the tree.
      #   # Since AVL tree is balanced, the height is O(Logn). So time complexity of AVL delete is O(Log n).
      #   def delete(value, node = @root)
      #     # Step 1 - Perform standard BST delete
      #     return node if node.nil?
      #
      #     if value < node.val
      #       node.left = delete(value, node.left)
      #
      #     elsif value > node.val
      #       node.right = delete(value, node.right)
      #
      #     else
      #       if node.left.nil?
      #         temp = node.right
      #         node = nil
      #         return temp
      #
      #       elsif node.right.nil?
      #         temp = node.left
      #         node = nil
      #         return temp
      #       end
      #
      #       temp = get_min_value_node(node.right)
      #       node.val = temp.val
      #       node.right = delete(temp.val, node.right)
      #
      #       # If the tree has only one node,
      #       # simply return it
      #       return node if node.nil?
      #
      #       # Step 2 - Update the height of the
      #       # ancestor node
      #       node.height = 1 + max(get_height(node.left), get_height(node.right))
      #
      #       # Step 3 - Get the balance factor
      #       balance = get_balance(node)
      #
      #       # Step 4 - If the node is unbalanced,
      #       # then try out the 4 cases
      #       # Case 1 - Left Left
      #       if balance > 1 && get_balance(node.left) >= 0
      #         return right_rotate(node)
      #       end
      #
      #       # Case 2 - Right Right
      #       if balance < -1 && get_balance(node.right) <= 0
      #         return left_rotate(node)
      #       end
      #
      #       # Case 3 - Left Right
      #       if balance > 1 && get_balance(node.left) < 0
      #         node.left = left_rotate(node.left)
      #         return right_rotate(node)
      #       end
      #
      #       # Case 4 - Right Left
      #       if balance < -1 && get_balance(node.right) > 0
      #         node.right = right_rotate(node.right)
      #         return left_rotate(node)
      #       end
      #     end
      #     node
      #   end
      #
      # end
      #
      # # Driver program to test above function
      # avl = AVLTree.new
      #
      # root = avl.insert(10)
      # root = avl.insert(20, root)
      # root = avl.insert(30, root)
      # root = avl.insert(40, root)
      # root = avl.insert(50, root)
      # root = avl.insert(25, root)
      #
      # # The constructed AVL Tree would be
      # #             30
      # #            /  \
      # #          20   40
      # #         /  \     \
      # #        10  25    50
      #
      # # Preorder Traversal
      # avl.pre_order(root)
      #
      # # rubocop:enable Layout/CommentIndentation
      #
      # puts "Deleting 10"
      # avl.delete(10, root)
      #
      # avl.pre_order(root)
      #

    end

  end

  # DoublyLinkedList - Individual Topic
  # Source: popular_data_structures/doubly_linked_list.rb
  #
  # == Related Topics
  # - LinkedList
  # - MinHeap
  #
  class DoublyLinkedList

    # === Content from popular_data_structures/doubly_linked_list.rb ===

    class Node
      attr_accessor :data, :next, :prev

      def initialize(data)
        @data = data
        @next = nil
        @prev = nil
      end
    end


    # Uses of doubly linked list
    # - A music player which has next and prev buttons.
    # - Represent a deck of cards in a game.
    # - The browser cache which allows you to hit the BACK-FORWARD pages.
    # - Applications that have a Most Recently Used list (a linked list of file names)
    # - Undo-Redo functionality

    # This implementation is memory intensive
    class DoublyLinkedList
      attr_accessor :head, :last_node

      def initialize(data)
        # You can imagine of @head is the node all the way to the left
        # @last_node is all the way to the right.
        @head = Node.new(data)
        @last_node = @head
      end

      def initial_populate(value)
        new_node = Node.new(value)
        curr_node = @head
        # First Node will be null
        return new_node if curr_node.nil?

        # Go to the last node then, add the next reference.
        curr_node = curr_node.next until curr_node.next.nil?
        curr_node.next = new_node
        new_node.prev = curr_node
        @last_node = new_node
        @head
      end


      def insert_head(data)
        new_node = Node.new(data)
        curr_node = @head
        curr_node.prev = new_node
        new_node.next = curr_node
        @head = new_node
      end

      def insert_tail(data)
        new_node = Node.new(data)
        curr_node = @last_node
        curr_node.next = new_node
        new_node.prev = curr_node
        @last_node = new_node
      end

      def display_next(node = @head)
        current = node
        while current
          print "-(#{current.data})-"
          current = current.next
        end
      end

      def display_reverse(node = @last_node)
        current = node
        while current
          print "-(#{current.data})-"
          current = current.prev
        end
      end

    end

    my_list = DoublyLinkedList.new(0)
    [1,2,3].each do |data|
      my_list.initial_populate(data)
    end

    my_list.insert_head(33)
    my_list.display_next(my_list.head)
    puts
    my_list.insert_tail(66)
    my_list.display_next(my_list.head)

  end

  # LinkedList - Individual Topic
  # Source: popular_data_structures/linked_list.rb
  # Singly LinkedList
  #
  # Typically implementing LinkedList needs two class.
  # One is the Node class that holds the information
  # The other is the LinkedList class that is more of a orchestrator that holds the nodes together
  #
  # == Related Topics
  # - DoublyLinkedList
  # - MinHeap
  #
  class LinkedList

    # === Content from popular_data_structures/linked_list.rb ===

    # Singly LinkedList

    # Typically implementing LinkedList needs two class.
    # One is the Node class that holds the information
    # The other is the LinkedList class that is more of a orchestrator that holds the nodes together
    class Node
      attr_accessor :data, :next

      def initialize(data)
        @data = data
        @next = nil
      end
    end

    # This implementation is memory intensive
    class LinkedList
      attr_accessor :head

      def initialize(data = nil)
        @head = Node.new(data)
      end

      def reverse_loop(node = head)
        cur, prev = node, nil
        while cur
          cur.next, prev, cur = prev, cur, cur.next
        end
        self.head = prev
      end

      def reverse_recursive(node = head)
        return node if node.nil? || node.next.nil?
        p = reverse_recursive(node.next)
        node.next.next = node
        node.next = nil
        self.head = p
      end

      # O(N) to insert to the end
      def insert_end(value)
        new_node = Node.new(value)
        curr_node = @head
        # First Node will be null
        return new_node if curr_node.nil?

        # Go to the last node then, add the next reference.
        curr_node = curr_node.next until curr_node.next.nil?
        curr_node.next = new_node
        @head
      end

      # O(1)
      def insert_front(value)
        new_node = Node.new(value)
        new_node.next = @head
        @head = new_node
        @head
      end

      # O(1)
      def remove_front
        node = @head
        @head = @head.next
        node
      end

      def display(head = @head)
        puts
        current = head
        while current
          print(current.data, " ")
          current = current.next
        end
        puts
      end

      def remove_duplicates
        head = @head
        array = []
        return if head.nil?
        node = head
        prev_node = nil
        while !node.nil?
          if array.include?(node.data)
            prev_node.next = node.next
          else
            array << node.data
            prev_node = node
          end
          node = node.next
        end
        return head
      end

      def merge_list(l2)
        self.head = _merge_list(head, l2)
      end


      def _merge_list(l1, l2)
        if l1.nil? || l2.nil?
          return l1 || l2
        end
        if l1.val < l2.val
          l1.next = _merge_list(l1.next, l2)
          l1
        else
          l2.next = _merge_list(l1, l2.next)
          l2
        end
      end
    end

    # my_list = LinkedList.new(1)
    # [1,2,2,2,3,3,4].each do |data|
    #   my_list.insert_end(data)
    # end
    # my_list.display
    # puts "reversing now:::"
    # my_list.reverse_recursive
    # my_list.display

    # https://learning.oreilly.com/library/view/a-common-sense-guide/9781680502794/f_0093.xhtml
    # Linked Lists in Action
    # One case where linked lists shine is when we examine a single list and delete many elements from
    # it. Let’s say, for example, that we’re building an application that combs through lists
    # of email
    # addresses and removes any email address that has an invalid format. Our algorithm
    # inspects each and
    # every email address one at a time, and uses a regular expression (a specific pattern for
    # identifying certain types of data) to determine whether the email address is invalid. If
    # it’s
    # invalid, it removes it from the list.
    #
    # No matter whether the list is an array or a linked list, we need to comb through the
    # entire list
    # one element at a time to inspect each value, which would take N steps. However, let’s
    # examine what
    # happens when we actually delete email addresses.
    #
    # With an array, each time we delete an email address, we need another O(N) steps to shift
    # the
    # remaining data to the left to close the gap. All this shifting will happen before we can
    # even
    # inspect the next email address.
    #
    # So besides the N steps of reading each email address, we need another N steps multiplied
    # by invalid
    # email addresses to account for deletion of invalid email addresses.
    #
    # Let’s assume that one in ten email addresses are invalid. If we had a list of 1,000 email
    # addresses, there would be approximately 100 invalid ones, and our algorithm would take
    # 1,000 steps
    # for reading plus about 100,000 steps for deletion (100 invalid email addresses * N).
    #
    # With a linked list, however, as we comb through the list, each deletion takes just one
    # step, as we
    # can simply change a node’s link to point to the appropriate node and move on. For our
    # 1,000 emails,
    # then, our algorithm would take just 1,100 steps, as there are 1,000 reading steps, and
    # 100 deletion
    # steps.


  end

  # MinHeap - Individual Topic
  # Source: popular_data_structures/min_heap.rb
  # Heap is a data structure that has efficient insertion (usually n(logN)) and retrieval O(1)
  # Heaps are commonly implemented using arrays in many programming languages.
  # The array-based representation provides a more space-efficient and cache-friendly implementation compared to a tree-based representation.
  #
  #
  # In an array-based implementation:
  #
  # The root of the heap is at index 0.
  # For any element at index i:
  # Its left child is at index 2i + 1.
  # Its right child is at index 2i + 2.
  # Its parent is at index (i - 1) / 2.
  #
  #
  #
  # == Related Topics
  # - DoublyLinkedList
  # - LinkedList
  #
  class MinHeap

    # === Content from popular_data_structures/min_heap.rb ===

    # Heap is a data structure that has efficient insertion (usually n(logN)) and retrieval O(1)
    # Heaps are commonly implemented using arrays in many programming languages.
    # The array-based representation provides a more space-efficient and cache-friendly implementation compared to a tree-based representation.


    # In an array-based implementation:
    #
    # The root of the heap is at index 0.
    # For any element at index i:
    # Its left child is at index 2i + 1.
    # Its right child is at index 2i + 2.
    # Its parent is at index (i - 1) / 2.


    class MinHeap
      attr_accessor :heap

      def initialize
        @heap = []
      end

      def insert(key)
        @heap << key
        heapify_up(@heap.length - 1)
      end

      def extract_min(heap)
        return nil if heap.empty?

        min_value = heap[0]
        last_value = heap.pop

        unless heap.empty?
          heap[0] = last_value
          heapify_down(0)
        end

        min_value
      end


      def show_heap_sorted
        sorted_array = []
        heap_copy = @heap.dup

        until heap_copy.empty?
          sorted_array << extract_min(heap_copy)
        end

        sorted_array
      end

      private

      def heapify_up(index)
        parent_index = (index - 1) / 2

        while index > 0 && @heap[index] < @heap[parent_index]
          # Swap values
          @heap[index], @heap[parent_index] = @heap[parent_index], @heap[index]

          # Move up to the parent
          index = parent_index
          parent_index = (index - 1) / 2 # find next parent
        end
      end

      def heapify_down(index)
        left_child_index = 2 * index + 1
        right_child_index = 2 * index + 2
        smallest = index

        if left_child_index < @heap.length && @heap[left_child_index] < @heap[smallest]
          smallest = left_child_index
        end

        if right_child_index < @heap.length && @heap[right_child_index] < @heap[smallest]
          smallest = right_child_index
        end

        if smallest != index
          # Swap values
          @heap[index], @heap[smallest] = @heap[smallest], @heap[index]

          # Move down to the smallest child
          heapify_down(smallest)
        end
      end
    end

    # Example usage:
    min_heap = MinHeap.new
    min_heap.insert(4)
    min_heap.insert(2)
    min_heap.insert(7)
    min_heap.insert(1)

    puts min_heap.heap.to_s # Output: [1, 2, 7, 4]

    min_value = min_heap.extract_min(min_heap.heap)
    puts min_value # Output: 1
    puts min_heap.heap # Output: [2, 4, 7]

  end

end

# Snippets module for organizing snippets implementations
module Snippets

  # BinaryConversions - Individual Topic
  # Source: snippets/binary_conversions.rb
  class BinaryConversions

    # === Content from snippets/binary_conversions.rb ===

    def bin_num_to_num(binary_num)
      # simple binary number to number
      binary_num.to_i(2)
    end

    def bin_ascii_to_str(binary_ascii_str)
      # "01001000" ==  49, or "H" in ascii
      binary_ascii_str.to_i(2).chr
    end

    def ascii_to_bin(ascii)
      # "a" ==> 97 ==> "1100001"
      ascii.ord.to_s(2)
    end

  end

end

# SupportTools module for organizing supporttools implementations
module SupportTools

  # EasyBenchmark - Individual Topic
  # Source: support_tools/easy_benchmark.rb
  class EasyBenchmark

    # === Content from support_tools/easy_benchmark.rb ===

    require 'benchmark'

    module EasyBenchmark
      @iterations = 50000
      class << self
        def iterations
          @iterations
        end

        def iterations=(iter)
          @iterations=iter
        end

        def benchmark_time(test_cases, *input)
          Benchmark.bm do |bm|
            test_cases.each do |test|
              description = test.to_s
              test_method = test.to_sym
              bm.report(description) do
                iterations.times do
                  send(test_method, *input)
                end
              end
            end
          end
        end
      end
    end

  end

end

# Tcp module for organizing tcp implementations
module Tcp

  # ChatroomClient - Individual Topic
  # Source: tcp/chatroom_client.rb
  #
  # == Related Topics
  # - ChatroomServer
  # - HttpServer
  # - SocketClient
  # - SocketServer
  # - TlsClient
  #
  class ChatroomClient

    # === Content from tcp/chatroom_client.rb ===

    require 'socket'

    class ChatroomClient
      class << self
        attr_accessor :host, :port
      end

      def self.pid
        @pid ||= Process.pid
      end

      def self.request
        @client = TCPSocket.new(host, port)
        listen
        send
      end

      def self.listen
        Thread.new do
          loop do
            puts "#{@client.gets}"
          end
        end
      end

      def self.send
        Thread.new do
          loop do
            msg = $stdin.gets.chomp
            @client.puts("PID #{pid} says: #{msg}")
          end
        end.join
      end
    end


    ChatroomClient.host = '127.0.0.1'
    ChatroomClient.port = 4002
    ChatroomClient.request

  end

  # ChatroomServer - Individual Topic
  # Source: tcp/chatroom_server.rb
  #
  # == Related Topics
  # - ChatroomClient
  # - HttpServer
  # - SocketClient
  # - SocketServer
  # - TlsClient
  #
  class ChatroomServer

    # === Content from tcp/chatroom_server.rb ===

    require 'socket'

    class ChatroomServer
      def initialize(port)
        @server = TCPServer.new(port)
        @server.listen(Socket::SOMAXCONN)
        @connections = []
        puts "Listening on port #{port}"
      end

      def start
        Socket.accept_loop(@server) do |connection|
          @connections << connection
          puts @connections
          Thread.new do
            loop do
              handle(connection)
            end
          end
        end
      end


      def handle(connection)
        begin
          message = connection.read_nonblock(4096)
        rescue Errno::EAGAIN
          IO.select([connection])
          retry
        rescue EOFError, IOError # IOError - when client self disconnected #EOFError
          connection.close
          return
        end
        broadcast(connection, message) unless message.nil?
      end

      def broadcast(sender_connection, message)
        @connections.delete_if do |connection|
          if connection.closed?
            true
          else
            connection.puts(message) if connection != sender_connection && !connection.closed?
          end
        end
      end
    end

    server = ChatroomServer.new(4002)
    server.start

  end

  # HttpServer - Individual Topic
  # Source: tcp/http_server.rb
  # or use this https://gist.github.com/tedmiston/5935757
  #
  #
  # == Related Topics
  # - ChatroomClient
  # - ChatroomServer
  # - SocketClient
  # - SocketServer
  # - TlsClient
  #
  class HttpServer

    # === Content from tcp/http_server.rb ===

    # or use this https://gist.github.com/tedmiston/5935757

    require 'socket'

    server = TCPServer.new('0.0.0.0', 3000)

    response = <<-HEREDOC
    HTTP/1.1 200 OK
    Content-Type: application/json

    {"message":"Hello world from http_server.rb"}
    HEREDOC

    server.listen(Socket::SOMAXCONN)
    loop do
      socket = server.accept
      verb, path, _http_version = socket.gets&.split(' ') || nil
      next if verb.nil?
      puts "Received verb: #{verb} path: #{path} http_version: #{_http_version}"
      while (request = socket.gets) && (request.chomp.length > 0)
        puts "Incoming request headers -- \"#{request.chomp}\"" # the server logs each response
      end
      socket.write(response)
      socket.close
    end


  end

  # SocketClient - Individual Topic
  # Source: tcp/socket_client.rb
  #
  # == Related Topics
  # - ChatroomClient
  # - ChatroomServer
  # - HttpServer
  # - SocketServer
  # - TlsClient
  #
  class SocketClient

    # === Content from tcp/socket_client.rb ===

    require 'socket'

    # 1. create
    # 2. bind
    # 3. connect
    # 4. close


    socket = Socket.new(:INET, :STREAM)
    # Initiate a connection to google.com on port 80.
    remote_addr = Socket.pack_sockaddr_in(4002, '0.0.0.0')
    socket.connect(remote_addr)
    socket.close

  end

  # SocketServer - Individual Topic
  # Source: tcp/socket_server.rb
  #
  # == Related Topics
  # - ChatroomClient
  # - ChatroomServer
  # - HttpServer
  # - SocketClient
  # - TlsClient
  #
  class SocketServer

    # === Content from tcp/socket_server.rb ===

    require 'socket'

    # Server life cycle
    # 1. create
    # 2. bind
    # 3. listen
    # 4. accept
    # 5. close
    #
    # Create a TCP socket
    socket = Socket.new(:INET, :STREAM)
    # Create a C struct to hold the address for listening.
    addr = Socket.pack_sockaddr_in(3000, '0.0.0.0')
    # Bind to it.
    socket.bind(addr)
    socket.listen(Socket::SOMAXCONN)

    loop do
      connection, addr_info = socket.accept # socket.accept is blocking. If there are more connections in the queue, it should pop it off individually.
      puts "Connection class: #{connection.class}"
      puts "Connection Fil no: #{connection.fileno}" # Sockets are file, in Unix, everything is file
      puts "Server Filno: #{socket.fileno}"
      puts "Local Address: #{connection.local_address}"
      puts "Remote address: #{connection.remote_address}"
      connection.close
    end

    ########## Alternatively:
    # Create the listener socket.

    # servers = Socket.tcp_server_sockets(3000)
    # # Enter an endless loop of accepting and
    # # handling connections.
    # Socket.accept_loop(servers) do |connection|
    #   # handle connection
    #   connection.close
    # end

  end

  # TlsClient - Individual Topic
  # Source: tcp/tls_client.rb
  #
  # == Related Topics
  # - ChatroomClient
  # - ChatroomServer
  # - HttpServer
  # - SocketClient
  # - SocketServer
  #
  class TlsClient

    # === Content from tcp/tls_client.rb ===

    require 'socket'
    require 'openssl'

    myXML = 'my_sample_data'
    host = 'my_host.com'
    port = 30000

    socket = TCPSocket.open(host,port)
    ssl_context = OpenSSL::SSL::SSLContext.new()
    ssl_context.cert = OpenSSL::X509::Certificate.new(File.open("certificate.crt"))
    ssl_context.key = OpenSSL::PKey::RSA.new(File.open("certificate.key"))
    ssl_context.ssl_version = :SSLv23
    ssl_socket = OpenSSL::SSL::SSLSocket.new(socket, ssl_context)
    ssl_socket.sync_close = true
    ssl_socket.connect

    ssl_socket.puts(myXML)
    while line = ssl_socket.gets
      p line
    end
    ssl_socket.close

  end

end

