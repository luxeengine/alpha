## Luxe core code style guide

### Overall file structure

- All files should end in a new line
- All files should use spaces, 4 spaces
- All files should use unix line endings only
- One class per file unless it significantly improves the API and code clarity

### Class structure

- Declared on the same line, `class Name extends Other {` 
- Public members first, separated by properties/members
- Private members second, without `private` in front (unnecessary)
- Public members that are not public API require @:noCompletion
- After `class Name {`, two empty lines before the first variable and
- After members, two empty lines before constructor (if any), `public function new`
- After constructor, public API functions
- After public API, internal API functions and helpers
- After internal API, other helper code and internal types
- At the end of the file, a new line after the closing class brace