# Prime Factors

Compute the prime factors of a given natural number.

A prime number is only evenly divisible by itself and 1.

Note that 1 is not a prime number.

## Example

What are the prime factors of 60?

- Our first divisor is 2. 2 goes into 60, leaving 30.
- 2 goes into 30, leaving 15.
- 2 doesn't go cleanly into 15. So let's move on to our next divisor, 3.
- 3 goes cleanly into 15, leaving 5.
- 3 does not go cleanly into 5. The next possible factor is 4.
- 4 does not go cleanly into 5. The next possible factor is 5.
- 5 does go cleanly into 5.
- We're left only with 1, so now, we're done.

Our successful divisors in that computation represent the list of prime
factors of 60: 2, 2, 3, and 5.

You can check this yourself:

- 2 * 2 * 3 * 5
- = 4 * 15
- = 60
- Success!

## Setup

There are two different methods of getting set up to run the tests with Objective-C:

- Create an Xcode project with a test target which will run the tests.
- Use the ruby gem `objc` as a test runner utility.

Both are described in more detail here: http://exercism.io/languages/objective-c

### Submitting Exercises

When submitting an exercise, make sure your solution file is in the same directory as the test code.

The submit command will look something like:

```shell
exercism submit <path-to-exercism-workspace>/objective-c/all-your-base/AllYourBase.m
```

You can find the Exercism workspace by running `exercism debug` and looking for the line beginning
with Workspace.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

## Source
The Prime Factors Kata by Uncle Bob [http://butunclebob.com/ArticleS.UncleBob.ThePrimeFactorsKata](http://butunclebob.com/ArticleS.UncleBob.ThePrimeFactorsKata)
