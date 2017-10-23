define hook-stop
  handle SIGSEGV stop print pass
end
define hook-run
  handle SIGSEGV nostop noprint pass
end
define hook-continue
  handle SIGSEGV nostop noprint pass
end

# boost pretty printers
python
import sys
import gdb
print("Setting up Boost pretty printers")
sys.path.insert(0, '/usr/local/share/boost-gdb-printers')
import boost.v1_57 as boost
boost.register_pretty_printers(gdb)
end
