# Package

version       = "0.3.0"
author        = "Threatfender, LLC"
description   = "argv and argc for command line arguments"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.0"

task test, "Run all tests":
  exec("nim c --hints:off src/args.nim")
  var result: (string, int)

  # Run just the executable
  result = system.gorgeEx("./src/args")
  assert result[1] == 0
  assert result[0] == "1 @[\"args\"]"

  # Run the executable with CLI args
  result = system.gorgeEx("./src/args 1 2 3")
  assert result[1] == 0
  assert result[0] == "4 @[\"args\", \"1\", \"2\", \"3\"]"

  rmFile("./src/args")
  echo "All tests passed"

