#!/usr/bin/env bash

# (The absolute path to the program is provided as the first and only argument.)
CALCULATOR=$1

echo "We've set up a GitHub Actions Workflow that will run all"
echo "of the shell scripts in this directory as a series of tests."
echo
echo "To fail any test, you should use the exit 1 command;"
echo "To end a test early as a success, you should use the exit 0 command."

echo "Invoke your program with the \$CALCULATOR variable; an example is below"


# Test 01: Ensure the program runs without error with a simple, valid invocation.
if ! $CALCULATOR 1 + 1; then  # If the return code of $PROGRAM is non-zero (i.e. error)...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed!'
  exit 1
fi

# Test 02: Ensure simple case has correct output...
if [[ $($CALCULATOR 1 + 1) -ne 2 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed to produce 2 as an output!'
  exit 1
fi

# Test 03: Ensure program errors with an invalid operand
if $CALCULATOR 3 @ 2; then  # If the return code of $PROGRAM is zero (i.e. success)...
  echo 'ERROR! An invalid run of the application (3 @ 2) apparently succeeded?!'
  exit 1
fi

# Test 04: Division 1
if [[ $($CALCULATOR 10 / 2) -ne 5 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (10 / 2) failed to produce 5 as an output!'
  exit 1
fi

# Test 05: Division 2
if [[ $($CALCULATOR 0 / 2) -ne 0 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (0 / 2) failed to produce 0 as an output!'
  exit 1
fi

# Test 06: Subtraction 1
if [[ $($CALCULATOR 10 - 2) -ne 8 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (10 - 2) failed to produce 8 as an output!'
  exit 1
fi

# Test 07: Subtraction 2
if [[ $($CALCULATOR 10 - 15) -ne -5 ]]; then  # If the output of the program is not -5...
  echo 'ERROR! A valid run of the calculator (10 - 15) failed to produce -5 as an output!'
  exit 1
fi

# Test 08: Addition 1
if [[ $($CALCULATOR 10 + 10) -ne 20 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (10 + 10) failed to produce 20 as an output!'
  exit 1
fi

# Test 09: Addition 2
if [[ $($CALCULATOR 0 + 0) -ne -0 ]]; then  # If the output of the program is not -5...
  echo 'ERROR! A valid run of the calculator (0 + 0) failed to produce 0 as an output!'
  exit 1
fi

# Test 10: Multiplication 1
if [[ $($CALCULATOR 10 '*' 10) -ne 100 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (10 * 10) failed to produce 100 as an output!'
  exit 1
fi

# Test 11: Multiplication 2
if [[ $($CALCULATOR 0 '*' 200) -ne -0 ]]; then  # If the output of the program is not -5...
  echo 'ERROR! A valid run of the calculator (200 * 0) failed to produce 0 as an output!'
  exit 1
fi
