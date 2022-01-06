# RoR Apprenticeship Day 4

Welcome to the *Fourth Practice Day of the RoR Apprenticeship*. This readme is intended to guide you about today's activities; the *do's* and *dont's* and how to get the best from them. Please ask in the *Slack* channel `#ror_apprenticeship` in case you have not cleared something or if you have any doubts.

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

## File system Practice

This part of the course is intended to show the mentees how to work with files inside a Ruby context, the file handling methods will be shown as listed below. The practice for this part will be uploaded to this [repository](https://github.com/wizelineacademy/ror-apprenticeship-q12022/tree/practice-day4), it is recommended to overview the [File Class](https://ruby-doc.org/core-3.1.0/File.html) documentation when possible.

The [Archiver Class](https://docs.google.com/document/d/1w7r70w0_78n43E3OJTe4ydXEyEL5jL1W1UlpSu8wK_0/edit#heading=h.hxrvoaq1om85) will be implemented. The methods [tempfile](https://rubyreferences.github.io/rubyref/builtin/system-cli/filesystem.html#tempfile), [utils](https://rubyreferences.github.io/rubyref/builtin/system-cli/filesystem.html#fileutils) and [find](https://rubyreferences.github.io/rubyref/builtin/system-cli/filesystem.html#find) will be referenced and used in comparison with self written methods. Create a new file named `archiver.rb`, then implement three methods for opening files for reading, writing and both modes; methods for reading all the contents of a file and line by line and finally methods for writing the full content of a file or appending what we want to add at the end. This is the file that should be pushed to the repo.

## Algorithms

The following codes are intended to be shown at the workshop.

### card_game

Jack likes card games, he likes to collect decks of different kinds. He wants to write a method that emulates Spanish, French and Swiss decks on demand using as few code as possible using the following schema. Can you help him?

French kind, sorted by hearts, clubs, diamonds and spades; and cards from one to ten plus a jack, a queen, a king and an ace.
Spanish kind, sorted by coins, cups, swords and batons; and cards from one to ten and a knave, a knight and a king.
Swiss kind, sorted by shields, roses, bells and acorns; and cards from six to ten and a knave, a knight and a king.
The method should receive an argument to set the kind of deck such as 'french', 'spanish' or 'swiss', the output must be an array of strings containing elements named such as "one_of_clubs", "two_of_clubs", etc..., according to the given argument kind and using underscores instead spaces.

The method must return an array of strings with values such as 'one_of_clubs', 'two_of_clubs', etc.bs', 'two_of_clubs', etc.

[CodeSignal Challenge](https://app.codesignal.com/task/DBjrLSitKQyYy4RXz/description).

### us_number

Jack needs to validate 1,000,000 US phone numbers. He needs to write a method which validates the numbers following the next conditions.

Can or not to start with '+1' or '1' according to the US internationalization code.
Has at least 10 digits plus the last condition's ones.
The first 3 digits belong to the area code and their numeric value all together must not be under 300.

The method must return arrays as it follows.

With valid numbers:
if given "+16355099108", ["+16355099108", "valid"].
if given "14278522328", ["14278522328", "valid"].
if given "8995557262", ["8995557262", "valid"].

With non-valid numbers:
If given "+11719104212", ["+11719104212", "invalid", "areaCode"].
If given "+1040135946", ["+1040135946", "invalid", "numberTooShort areaCode"]
If given "11663640182", ["11663640182", "invalid", "areaCode"]
If given "112282378", ["112282378", "invalid", "numberTooShort areaCode"]

[CodeSignal Challenge](https://app.codesignal.com/task/aFNKZjnpKmspjJADQ/description)

## Homework

The following [CodeSignal challenge](https://app.codesignal.com/public-test/uQGqyC8RAYmt6pNyc/Dg8RbmM8cBJaSQ) is intended to be done as homework.

## References

<table>
  <tr>
    <td>Opening a file</td>
    <td>fileobject = File.open("sample.txt", "r");</td>
  </tr>
  <tr>
    <td>Reading the first n characters from a file</td>
    <td>puts(fileobject.sysread(21));</td>
  </tr>
  <tr>
    <td>Closing a file</td>
    <td>fileobject.close();</td>
  </tr>
  <tr>
    <td>Opening a file</td>
    <td>fileobject = File.open("sample.txt", "r");</td>
  </tr>
  <tr>
    <td>Read the values as an array of lines</td>
    <td>print(fileobject.readlines); puts</td>
  </tr>
  <tr>
    <td>Closing a file</td>
    <td>fileobject.close();</td>
  </tr>
  <tr>
    <td>Opening a file</td>
    <td>fileobject = File.open("sample.txt", "r");</td>
  </tr>
  <tr>
    <td>Read the entire content from a file</td>
    <td>print(fileobject.read());</td>
  </tr>
  <tr>
    <td>Closing a file</td>
    <td>fileobject.close();</td>
  </tr>
</table>
