#
#             (c) Copyright 2025 Threatfender, LLC

##                        args.nim
##                      (since: 0.1)
##
## `argv` and `argc` for working with command line arguments.
##

when NimMajor < 2:
  import std/[os, options]
else:
  import std/[os, options, cmdline]

var argvCache: Option[seq[string]]
var argcCache: Option[int]

proc argv*(): seq[string] =
  ## Return the sequence of command line arguments
  ## including the executable/script name
  if argvCache.isNone:
    var vals: seq[string] = @[]
    vals.add(os.getAppFilename().extractFilename())

    when NimMajor < 2:
      vals.add(os.commandLineParams())
    else:
      vals.add(cmdline.commandLineParams())

    argvCache = some(vals)

  return argvCache.get()

proc argc*(): int =
  ## Return the count of command line arguments including the name
  ## of the executable/script.
  if argcCache.isNone:
    argcCache = some(argv().len)
  return argcCache.get()

when isMainModule:
  echo argc(), " ", argv()
