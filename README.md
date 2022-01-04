# RoR Apprenticeship Day 4

## Introduction

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
  <tr>
    <td>Ruby</td>
    <td> > 2.5.0</td>
  </tr>
</table>

NOTE: You can install Ruby through [Homebrew](https://brew.sh/) as well if you have not done it yet. To do that, type in your terminal:

> $ brew install ruby

## File system Practice

This part of the course is intended to show the mentees how to work with files inside a Ruby context, the file handling methods will be shown as listed below. The practice for this part will be pushed to this repo.

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

## Homework Algorithms Practice

The following [CodeSignal challenge](https://app.codesignal.com/public-test/uQGqyC8RAYmt6pNyc/Dg8RbmM8cBJaSQ) is intended to be done as homework.
