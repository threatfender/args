#
#             (c) Copyright 2025 Threatfender, LLC

##                        args.nim
##                      (since: 0.1)
##
## `argv` and `argc` for working with command line arguments.
##

when NimMajor < 2:
  import std/[os]
else:
  import std/[os, cmdline]


proc initialize(): seq[string] =
  result.add(os.getAppFilename().extractFilename())

  when NimMajor < 2:
    result.add(os.commandLineParams())
  else:
    result.add(cmdline.commandLineParams())

let argv*: seq[string] = initialize()
  ## Sequence of command line arguments
  ## starting with the executable/script name

let argc*: int = argv.len
  ## Count of command line arguments including the name
  ## of the executable/script.


when isMainModule:
  echo argc, " ", argv
