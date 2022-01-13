# RoR Apprenticeship Day 5

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
