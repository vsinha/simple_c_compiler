#!/usr/bin/python
import sys
import os

if (len(sys.argv) < 2):
    print "Usage: runtest.py <dir that contains scc> <list of specific files to test (optional)>"
    raise SystemExit(0)

basedir = sys.argv[1]
if basedir[-1] == '/':
    basedir = basedir[:-1]
testfiles = {}

for root, dirs, files in os.walk(basedir):
    for f in files:
        if f.endswith(".c"):
            if not f.endswith(".tab.c") and not f.endswith(".yy.c"):
                testfiles[f] = os.path.join(root, f)

files_to_run = []
if len(sys.argv) > 2:
    for target in sys.argv[2:]:
        if not target.endswith(".c"):
            target += ".c"
        if target not in testfiles:
            print "File not found: %s" % target
            if raw_input("Ignore and continue? (y/n): ") == "y":
                continue
            else:
                raise SystemExit(0)
        files_to_run.append(testfiles[target])

else:
    for key, value in testfiles:
        files_to_run.append(value)

for path in files_to_run:
    print "\n*** Running test for: %s\n" % (path)
    command = """
    rm -f *.out &&
    %(base)s/scc %(in_file)s &&
    gcc -o c_test.scc %(com_file)s && 
    gcc -w -o g_test.gcc %(in_file)s && 
    (c_test.scc > scc.out;	g_test.gcc > gcc.out; echo) && 
    diff scc.out gcc.out && echo "%(in_file)s passed..." || 
    (echo "%(in_file)s failed..." && 
     echo ---------scc.out----- && 
     cat scc.out && 
     echo ---------gcc.out----- &&
    cat gcc.out
        )""" % {'in_file': path, 'com_file' : path[:-1] + 's', 'base' : basedir}

    os.system(command)
    print "*** Test complete for: %s\n" % (path)
