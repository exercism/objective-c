# Exercism Objective-C Track

Exercism exercises in Objective-C

## Try it!
If you've downloaded the [command-line client](https://exercism.org/docs/using/solving-exercises/working-locally) and have Objective-C installed on your machine, then go ahead and fetch the first problem.

```bash
exercism fetch objective-c
```

In order to be able to submit your solution, you'll need to configure the client with your [Exercism API key](http://exercism.org/account/key).
```bash
exercism configure --key=YOUR_EXERCISM_KEY
```

When you've written a solution, submit it to the site. You'll have to configure the command-line client with your exercism API key before you can submit.

```bash
exercism submit PATH_TO_FILE
```

## Running the tests
Exercism will only download a test file. You will need to manually create the header and the source file associated with the exercise. You will need to generate an Xcode Project file with the test file, the header file (.h) and the source file (.m). Alternatively, you can use a test runner utility that's described below.

### Creating the project in XCode
- Start Xcode and create a new project.
- Select OS X > Application and then Command Line Tool.
- Click Next and give it a project name using the ExerciseName is advised.
- Click Next and save the project in exercism's exercise directory.
- Now that the project is created click on Editor > Add Target.
- Select OS X > Test and select OS X Unit Testing Bundle.
- Name the target ExerciseName Tests.
- In the left pane (known as the navigator), open the Project navigator and expand the folder ExerciseName Tests and open the file ExerciseName_Tests.m.
- Replace its contents with the test file you got from exercism.
- In that file, replace all instances of "test_suite" with "ExerciseName_Tests".
- Navigate to the File Template library in the right pane (or use CTRL+OPTION+CMD+1) and drag the Cocoa Class template into the ExerciseName_Tests folder in the Project navigator.
- Name it ExerciseName and select ExerciseName Tests as its target.
- You will now have two new files in your ExerciseName_Tests directory: ExerciseName.h and ExerciseName.m.
- Click on your project in the Project navigator.
- Click on ExerciseName Tests in the targets list.
- Select Build Phases in the editor's navigation.
- Confirm that both your .m files are in the compile sources list.
- Use CMD+5 to navigate to the Test navigator.
- Right click the bundle named ExerciseName Tests and click Enable ExerciseName_Tests.
- Run the tests by clicking on the right pointing triangle that appears when hovering over the bundle in the Test navigator or use CMD+U.

Tests will be run through Xcode.

Note: If you receive the error "No visible `@interface` for ExerciseName declares the selector ExerciseSelector," you followed the steps correctly, but haven't written anything in your header/implementation file(s). After you declare your method in the .h file and define it in the .m file, your tests should raise more helpful errors that will lead you towards completing the exercise. Read this [primer on Objective-C Classes](http://blog.teamtreehouse.com/beginners-guide-objective-c-classes-objects) for more in-depth information.

### Using a test runner
An alternative to manually generating the project file is to use a test runner utility written in ruby, [objc](https://rubygems.org/gems/objc/), that will create a project file for you with the test file, header file and source file.

```bash
$ gem install objc
```

Run the tests with
```bash
$ objc -x ExerciseName
```

(Note the `-x`/`--xcodebuild` flag, which specifies using `xcodebuild` instead of `xctool`. The latter does not work with Xcode's latest releases.)

The `objc` utility uses the exercise name to find the test file, ExerciseNameTest.m, the header file, ExerciseName.h and source file ExerciseName.m. The files are inserted into a temporary Xcode Project and then xcodebuild is used to run the tests for the project.

While `objc` makes it so you never have to launch Xcode to complete these exercises, the error messages and feedback through the command-line are not as clear as through the Xcode user interface.


## Help Us Improve the Objective-C Track!

Did you find a typo in the README? Is the test suite missing an edge case? We want to know about it.

We always welcome GitHub issues and pull requests.

If you are new to open source, or are looking for an easy way in, feel free to check out the [good first patch](https://github.com/exercism/objective-c/labels/good%20first%20patch) issues.

### Help Add More Objective-C Exercises

The easiest way to add new exercises is to translate existing exercises from other language tracks on Exercism. Here's the [full list of unimplemented exercises in Objective-C](http://exercism.org/languages/objective-c/todo) along with links to all the existing implementations.

If you have an idea for a completely new exercise, you can follow [this guide](https://github.com/exercism/docs/blob/master/you-can-help/make-up-new-exercises.md) to add it to the site.

The xcode project uses [OCLint](https://github.com/oclint/homebrew-formulae).
Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

