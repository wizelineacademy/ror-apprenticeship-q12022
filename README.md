<<<<<<< HEAD
# RoR Apprenticeship Day 5
=======
# RoR Apprenticeship Day 3 
>>>>>>> practice-day3

## Introduction

Welcome to the *Third Practice Day of the RoR Apprenticeship*. This readme is intended to guide you about today's activities; the *do's* and *dont's* and how to get the best from them. Please ask in the *Slack* channel `#ror_apprenticeship` in case you have not cleared something or if you have any doubts.

## Getting Started

To get started, follow these steps:

1. [Fork this project](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
2. Commit periodically
3. Have fun!

## Submitting the deliverables

For submitting your work, you should follow these steps:

1. Create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork) with your code. Make sure your PRs name follows this name convention "#{your-name}--#{number of deliverable}" ex: "ivanreyes--practice1".
2. Make sure you are adding Apostat23, hivanreyes, Rikard189 as reviewers and post your link in the slack channel
3. Stay tune for feedback

## Prerequisites

<table>
    <thead>
        <tr>
            <th>Dependency</th>
            <th>Version</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Ruby</td>
            <td> > 2.5.0</td>
        </tr>
    </tbody>
</table>

NOTE: You can install Ruby through [Homebrew](https://brew.sh/) as well if you have not done it yet. To do that, type in your terminal:

> $ brew install ruby

<<<<<<< HEAD
# Practice

As this day will be dedicated to handle errors, you will be required to add a new file named `error_test.rb` to the Day 3 [repository](https://github.com/wizelineacademy/ror-apprenticeship-q12022/tree/practice-day3), this file will work with the elements of the `Environment` class, we will set some of the methods we did in the last practice in the `Game.rb` file, but this time adding error handling.

# File

Create a new file in the same folder where the `Environment.rb` is; this file must contain a class named `ErrorTest` and require the `Environment` module, then initialize it as you did before adding the methods that you will use. Below there is a good example of the  `error_test.rb` file with a method using error handling. Add a couple of more methods by yourself.

```
require_relative 'environment.rb'

class ErrorTest
  include Environment
  attr_accessor :board, :depot, :control, :dictionary, :poker

  def initialize
    @board = { players: Hash.new, control: Hash.new, status: nil }
    @control = Environment::Control.new
  end

  def new_worker name: nil
    begin
      @board[:players].store name, Environment::Worker.new(name)
    rescue NoMethodError
      puts 'No name for worker given'
    end
  end
end
```
=======
## Mandatory Practice

In this section, you will be required to accomplish the next tasks. Please push your files to the forked repository and then make a pull request into this one once finished.

**1)** Read [this](http://ruby-for-beginners.rubymonstas.org/advanced/modules.html) document and learn about [Ruby Modules](https://ruby-doc.org/core-3.0.2/Module.html).

**2)** Take some time to check the [RubyDocs](https://ruby-doc.org/) and keep them for reference. Check the latest version on the [CoreAPI](https://ruby-doc.org/) section. At the time of the publication of this document, it was [Version 3.0.2](https://ruby-doc.org/core-3.0.2/). Pay special attention to the [String](https://ruby-doc.org/core-3.0.2/String.html), [Array](https://ruby-doc.org/core-3.0.2/Array.html), [Hash](https://ruby-doc.org/core-3.0.2/Hash.html), [Enumerable](https://ruby-doc.org/core-3.0.2/Enumerable.html), [Class](https://ruby-doc.org/core-3.0.2/Class.html) and [Module](https://ruby-doc.org/core-3.0.2/Module.html) sections and check their methods out.

**3)** On the branch folder create two Ruby files `environment.rb` and `game.rb`.

**4)** On the `environment.rb` file create a module named `Environment` and then create on it three empty classes called `Depot`, `Control` and `Human`. These classes and their methods will be described below, develop them according to those descriptions.

The Depot class contains a [Hash](https://ruby-doc.org/core-3.0.2/Hash.html) called `@packs` which is fully accessible for other classes with the following data.

<table>
  <tr>
    <td>simple_transportation_pack</td>
    <td>intelligence => [:cellphone]
    <br>items => [:medipack, :chevy_versa]</td>
  </tr>
  <tr>
    <td>standard_transportation_pack</td>
    <td>intelligence => [:cellphone, :antenna]
    <br>arsenal => [:colt_1911]
    <br>items => [:handcuffs, :medipack, :chemistry, :chevy_versa]</td>
  </tr>
  <tr>
    <td>simple_mission_pack</td>
    <td>intelligence => [:infopack, :laptop, :cellphone, :antenna]
    <br>arsenal => [:colt_1911]
    <britems => [:handcuffs, :medipack, :chemistry, :financial]</td>
  </tr>
  <tr>
    <td>standard_mission_pack</td>
    <td>intelligence => [:infopack, :laptop, :cellphone, :antenna]
    <br>arsenal => [:remington_870, :colt_1911, :machete, :hatchet]
    <br>items => [:handcuffs, :medipack, :chemistry, :financial]</td>
  </tr>
</table>

All references must be managed as [Symbol](https://ruby-doc.org/core-2.5.0/Symbol.html) type. This data must be accessible from the `game.rb` file with calls like:

```
game.depot.packs[:simple_transportation_pack]
game.depot.packs[:standard_mission_pack]
game.depot.packs[:standard_mission_pack][:items]
```
The `Control` class contains a [Hash](https://ruby-doc.org/core-3.0.2/Hash.html) named `@missions` which is fully accessible for other classes.

The class has a `new_mission` method which receives three parameters called `name`, `objective` and `pack`; then stores these parameters in `@missions` where `name` is the key and the rest of the data the values, a new variable _status_ must be added and must be set to `:active`, all these must be saved as a [Hash](https://ruby-doc.org/core-3.0.2/Hash.html) itself. This method should be able to respond to such calls as in the chart below and `@missions` should be able to display info as shown.

```
$ name = :alpha and objective = 'Get Alpha to the base' and pack = :simple_transportation_pack
$ game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
$ puts game.control.missions[:alpha]
# => {:objective=>"Get Alpha to the base", :status=>:active, :pack=>{:intelligence=>[:cellphone], :items=>[:medipack, :chevy_versa]}}
```

Then make use of the Metaprogramming techniques to dynamically generate methods corresponding to each mission state (tip: have an array of states and iterate over it). The method names will be:
```
set_mission_to_paused
set_mission_to_aborted
set_mission_to_accomplished
set_mission_to_failed
```
The methods will receive a symbol as argument corresponding to the name of the mission to update and they will be updating the mission status (`@missions[mission][:status]`) accordingly. See the following use example:

```
$ game.control.set_mission_to_accomplished(:alpha) and puts game.control.missions[:alpha]
# => {:objective=>"Get Alpha to the base", :status=>:accomplished, :pack=>{:intelligence=>[:cellphone], :items=>[:medipack, :chevy_versa]}}
```

Note: Use [define_method](https://apidock.com/ruby/Module/define_method) as described on the [Udemy's Comprehensive Ruby Programming](https://wizeline.udemy.com/course/comprehensive-ruby-programming-tutorial/learn/lecture/4424294#overview) course you have just taken on [Section 15](https://wizeline.udemy.com/course/comprehensive-ruby-programming-tutorial/learn/lecture/4424220#overview).

The `Human` class contains fully accessible variables as listed below.

<table>
  <tr>
    <td>@id</td>
    <td>Id of the object when created.</td>
  </tr>
  <tr>
    <td>@name</td>
    <td>Name given by user when instantiated.</td>
  </tr>
  <tr>
    <td>@personal_data</td>
    <td>Hash. surname: String, age: Integer, country: String, language: String, marital_status: String, children: Integer</td>
  </tr>
  <tr>
    <td>@professional_data</td>
    <td>position: String, occupation: String, skills: String, observations: String</td>
  </tr>
</table>

It has two [Dynamic Methods](https://medium.com/@camfeg/dynamic-method-definition-with-rubys-define-method-b3ffbbee8197) called `set_personal_data` and `set_professional_data` each of them set the values of the hashes of an instance of `@human`, `personal_data` and `professional_data`. These methods must be created _on the fly_ using [define_method]((https://medium.com/@camfeg/dynamic-method-definition-with-rubys-define-method-b3ffbbee8197)) and be used by the `game.rb` file.

The `Human` class has another child class called `Worker`, this new class fully inherits from it, has two fully accessible variables named `@standard_shift` and `@extra_shift` and contains a simple method which initializes both variables as follows:

<table>
  <tr>
    <td>@standard_shift</td>
    <td>id => Id of the object when created.<br>
    :hours => 8<br>
    :payment => 8<br>
    :facility => String.new (or nil)<br>
    :status => nil (will be of type )
    </td>
  </tr>
  <tr>
    <td>@extra_shift</td>
    <td>:id => Id of the object when created.<br>
    :hours => Integer.new<br>
    :payment => Float.new<br>
    :facility => String.new (or nil)<br>
    :status => nil (will be of type Symbol)
    </td>
  </tr>
</table>

The three classes must be placed on the `environment.rb` file and then this file pushed to the repository. This will be all for Activity 4.

**5)** On the `game.rb` file a new class named `Game` will be created, this class will include the `Environment` module located on the `environment.rb` file; once done, three new fully accessible variables will be generated, these are `@board`, `@depot` and `@control`. `@board` will be a [Hash](https://ruby-doc.org/core-3.0.2/Hash.html) type variable with three values, two hashes again called `players` and `control`, and a _nil_ variable called `status`. `@depot` and `@control` will instantiate `Environment::Depot` and `Environment::Control` objects themselves.

A simple method called `new_worker` will be created on the `Game` class; this method will receive a [String](https://ruby-doc.org/core-3.0.2/String.html) as argument and instantiate a new `Environment::Worker` object; then store it on `@board[:players]` where the key is the name variable and the values the `Environment::Worker` variable itself.

Another method called `new_mission` will be created. This method will use the `new_mission` method created on the `Control` class. In this new method, `@control.new_mission` is called with its variables in order to save its result on the `Environment::Control` object that was just created above. On the same method the `@board[:control]` hash will be updated and stored with `:missions` as key and `@control.missions` as value. The methods created should respond to calls such as:

```
diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data
```
With outputs similar to:

```
# => Diego, Environment::Worker
# => {:surname=>Mota”, :age=>40, :country=>:mx, :language=>:es, :marital_status=>:single, :children=>0}
# =>{:position=>"SE", :occupation=>"IT", :skills=>[:ruby, :blender], :observations=>"none"}
```

You will be required to create an instance of `Game` named game. Then call to the `game.new_mission` method. The call should look like this:

```
name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha) and puts game.control.missions[:alpha]
```

With similar outputs to:

```
# => {:objective=>"Get Alpha to the base", :status=>:active, :pack=>{:intelligence=>[:cellphone], :items=>[:medipack, :chevy_versa]}}
# => {:objective=>"Get Alpha to the base", :status=>:accomplished, :pack=>{:intelligence=>[:cellphone], :items=>[:medipack, :chevy_versa]}}
```

This is the end of the _Mandatory Practice_, check the next section in order to know the _Optional Practice_.

## Optional Practice.

In this section you will be required to create two simple classes, the first called `Dictionary` and the second called `Poker`.

**1)** The `Dictionary` class contains a fully accessible [Hash](https://ruby-doc.org/core-3.0.2/Hash.html) variable named `@expressions`, This hash has as keys, English expressions such as hello or goodbye in [Symbol](https://ruby-doc.org/core-2.5.0/Symbol.html) format. Its values are hashes as well, with the language codes [:es, :en, :cz] as keys in [Symbol](https://ruby-doc.org/core-2.5.0/Symbol.html) format as well and the values of those keys are the expression itself in the objective language. The below lines can help to understand this.

```
@expressions[Hash]
:hello => { :en => ‘hello’, :es => ‘hola’, :cz => ‘ahoj’ }
:goodbye => { :en => ‘goodbye’, :es => ‘adios’, :cz => ‘nashledanou’ }
:my_name_is => { :en => ‘my name is’, :es => ‘mi nombre es’, :cz => ‘jmenuju se’ }
:i_come_from => { :en => ‘i come from’, :es => ‘yo vengo de’, :cz => ‘ja odchazim od’ }
```

Then a [dynamic method](https://medium.com/@camfeg/dynamic-method-definition-with-rubys-define-method-b3ffbbee8197) will be created. This method will generate four different methods called `say_hello`, `say_goodbye`, `say_my_name_is` and `say_i_come_from`. These methods should respond to such calls as:

```
hello = game.dictionary.say_hello(language)
my_name_is = game.dictionary.say_my_name_is(language)
i_come_from = game.dictionary.say_i_come_from(language)
```

**2)** The `Poker` class will be implemented as you decide. It contains a fully accessible variable called `@deck` with all the classic cards in the format `:one_of_swords`, `:two_of_swords`. etc.
>>>>>>> practice-day3
