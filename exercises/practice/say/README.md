# Say

Given a number from 0 to 999,999,999,999, spell out that number in English.

## Step 1

Handle the basic case of 0 through 99.

If the input to the program is `22`, then the output should be
`'twenty-two'`.

Your program should complain loudly if given a number outside the
blessed range.

Some good test cases for this program are:

- 0
- 14
- 50
- 98
- -1
- 100

### Extension

If you're on a Mac, shell out to Mac OS X's `say` program to talk out
loud.

## Step 2

Implement breaking a number up into chunks of thousands.

So `1234567890` should yield a list like 1, 234, 567, and 890, while the
far simpler `1000` should yield just 1 and 0.

The program must also report any values that are out of range.

## Step 3

Now handle inserting the appropriate scale word between those chunks.

So `1234567890` should yield `'1 billion 234 million 567 thousand 890'`

The program must also report any values that are out of range.  It's
fine to stop at "trillion".

## Step 4

Put it all together to get nothing but plain English.

`12345` should give `twelve thousand three hundred forty-five`.

The program must also report any values that are out of range.

### Extensions

Use _and_ (correctly) when spelling out the number in English:

- 14 becomes "fourteen".
- 100 becomes "one hundred".
- 120 becomes "one hundred and twenty".
- 1002 becomes "one thousand and two".
- 1323 becomes "one thousand three hundred and twenty-three".

## Setup

There are two different methods of getting set up to run the tests with Objective-C:

- Create an Xcode project with a test target which will run the tests.
- Use the ruby gem `objc` as a test runner utility.

Both are described in more detail here: http://exercism.io/languages/objective-c

### Submitting Exercises

When submitting an exercise, make sure your solution file is in the same directory as the test code.

The submit command will look something like:

```shell
exercism submit <path-to-exercism-workspace>/objective-c/say/Say.m
```

You can find the Exercism workspace by running `exercism debug` and looking for the line beginning
with Workspace.

## Source

A variation on JavaRanch CattleDrive, exercise 4a [http://www.javaranch.com/say.jsp](http://www.javaranch.com/say.jsp)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
