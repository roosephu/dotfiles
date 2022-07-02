import re

regexp = re.compile(r'^\\newcommand\{\\(.*)\}(\[.*\])?\{(.*)\}$')

print('''
MathJax.Hub.Register.StartupHook('TeX Jax Ready', function () {
  MathJax.InputJax.TeX.Definitions.Add({
    macros: {''')

with open("default.latex") as f:
    for line in f:
        if line.startswith(r'\newcommand'):
            line = line[:-1]
            m = regexp.match(line)
            name, impl = m.group(1, 3)
            print(f"      {name}: ['Macro', {repr(impl)}],")

print('''    }
  })
})

MathJax.Ajax.loadComplete('[MathJax]/extensions/custom.js')
''')
