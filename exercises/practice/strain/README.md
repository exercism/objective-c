# Strain

Implement the keep and discard operation on collections. Given a collection and a predicate on the collection's elements, keep returns a new collection containing those elements where the predicate is true, while discard returns a new collection containing those elements where the predicate is false.

For example, given the collection of numbers:

1, 2, 3, 4, 5
And the predicate:

is the number even?
Then your keep operation should produce:

2, 4
While your discard operation should produce:

1, 3, 5
Note that the union of keep and discard is all the elements.

The functions may be called keep and discard, or they may need different names in order to not clash with existing functions or concepts in your language.

Restrictions -

The  filter/reject/whatchamacallit functionality provided by the standard library should not be used! This should be solved using other basic tools instead.

## Setup

There are two different methods of getting set up to run the tests with Objective-C:

- Create an Xcode project with a test target which will run the tests.
- Use the ruby gem `objc` as a test runner utility.

Both are described in more detail here: http://exercism.io/languages/objective-c

### Submitting Exercises

When submitting an exercise, make sure your solution file is in the same directory as the test code.

The submit command will look something like:

```shell
exercism submit <path-to-exercism-workspace>/objective-c/strain/Strain.m
```

You can find the Exercism workspace by running `exercism debug` and looking for the line beginning
with Workspace.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
