# RoR Apprenticeship Day 3

## Introduction

Please read this document carefully.

Welcome to the *Third Practice Day of the RoR Apprenticeship*. This document is intended to guide you about today's activities; the *do's* and *dont's* and how to get the best from them. Please ask in the *Slack* channel **_#ror_apprenticeship_** in case you have not cleared something or if you have any doubts.

## Getting Started

To get started, follow these steps:

1. [Fork this project](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
2. Commit periodically
3. Have fun!

## Submitting the deliverables

For submitting your work, you should follow these steps:

1. Create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork) with your code, targeting the main branch of your fork, make sure your PRs name includes your name to easily identify them
2. Make sure you are adding Apostat23, hivanreyes, Rikard189 as reviewers and post your link in the slack channel
3. Stay tune for feedback

## Setup

For Ruby installation you will be required to use your Mac’s Admin password, ask your *Discipline Lead* in case you do not know it. You need to install [Homebrew](https://brew.sh/) as well if you have not done it yet. Then type in your terminal to install Ruby:

> $ brew install ruby

To set your [Github](https://github.com/) credentials; just sign up through the [Okta System](https://wizeline.okta.com/), when done, login in the same way again. Once you are positive you got Github valid credentials, check if you have not received the contributor's invitation to the [repository](https://github.com/wizelineacademy/ror-apprenticeship-q12022), ask your *Discipline Lead* if not. Once received, login, fork the repo, clone and work with the forked repository so you can push your files there. This is the repo’s [URL](https://github.com/wizelineacademy/ror-apprenticeship-q12022).

## Mandatory Practice

In this section, you will be required to accomplish the next tasks. Please push your files to the forked repository and then make a pull request into this one once finished.

Activity 1) Read [this](http://ruby-for-beginners.rubymonstas.org/advanced/modules.html) document and learn about [Ruby Modules](https://ruby-doc.org/core-3.0.2/Module.html).

Activity 2) Take some time to check the [RubyDocs](https://ruby-doc.org/) and keep them for reference. Check the latest version on the [CoreAPI](https://ruby-doc.org/) section. At the time of the publication of this document, it was [Version 3.0.2](https://ruby-doc.org/core-3.0.2/). Pay special attention to the [String](https://ruby-doc.org/core-3.0.2/String.html), [Array](https://ruby-doc.org/core-3.0.2/Array.html), [Hash](https://ruby-doc.org/core-3.0.2/Hash.html), [Enumerable](https://ruby-doc.org/core-3.0.2/Enumerable.html), [Class](https://ruby-doc.org/core-3.0.2/Class.html) and [Module](https://ruby-doc.org/core-3.0.2/Module.html) sections and check their methods out.

Activity 3) On the branch folder create two Ruby files **_environment.rb_** and **_game.rb_**.

Activity 4) On the _environment.rb_ file create a module named _Environment_ and then create on it three empty classes called _Depot_, _Control_ and _Human_. These classes and their methods will be described below, develop them according to those descriptions.

The Depot class contains a [Hash](https://ruby-doc.org/core-3.0.2/Hash.html) called @packs which is fully accessible for other classes with the following data.

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

All references must be managed as Symbol type. This data must be accessible from the game.rb file with calls like:

<table>
  <tr>
    <td><center>game.depot.packs[:simple_transportation_pack]
    <br>game.depot.packs[:standard_mission_pack]
    <br>game.depot.packs[:standard_mission_pack][:items]</center></td>
  </tr>
</table>

## The Challenge

The purpose of the challenge is for you to demonstrate your Ruby on Rails skills. This is your chance to show off everything you've learned during the course!

You will build and deliver a whole Ruby on Rails project on your own. We don't want to limit you by providing some fill-in-the-blanks exercises, but instead request you to build it from scratch. We hope you find this exercise challenging and engaging.

The goal is to build a RoR application which must include:

- Create an application that
  - Is connected to a PostgreSQL
  - Fetches data from Api (PokeApi) and save into a DB
  - Create a dashboard that is showing all pokemons saved
  - Create a form to save/edit/delete custom pokemons
  - API exposed to be consumed as JSON
- Adds authentication
- Unit, integration and system testing of happy/golden paths
- Follow conventions and good practices

Nice to have:

- Responsiveness
- Way to export all data to a CSV
- Search feature
- Application deployed, automated or manual deployment (Heroku, Digital Ocean, AWS)

## Requirements

- Use all that you've learned in the course:
  - Best practices
  - RoR basics
  - Error handling
  - Ruby gems
  - Design Patterns
  - Unit Test (RSpec, matchers, mocks)
  - E2E

## Deliverables
Please take this challenge seriously and try to make progress constantly, we will be providing feedback so if you are struggling with something, contact the mentors and peers to get help on time. Feel free to use the slack channel available.

Based on the self-study material is expected to have at the end of the modulo 2

- Runnable application
- Database model definitions
- Seeds to populate DB with custom pokemons
- Way to get the data from Api and push it to Database
- Tests of the current implementation
- Dashboard to see all pokemons
- Form to create/edit pokemons
- Database and model validations
- Authentication
- Tests
- Clean code
