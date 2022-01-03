# MCG - Map Code Getter

The map code getter utility allow you to get the compressed code
in base64 of a map

## Examples

In the root folder I put two files for sample, the file `sample-base64.txt`
and the file `sample-payload.json`, you can get the code of a sample file
with mcg with this command:

**NOTE**: This sample command only is tested in bash

```sh
mcg "$(cat ./sample-base64.txt)" 'jsx'
```

Where 'jsx' is the extension of the file and the first argument
is the base64 to analyze

> The default extension is `txt`, it's not required, but the base64 argument
is required

the common structure of a uncompressed map base64 is like in the file
`sample-payload.json`:

```json
{
  "version": 3,
  "mappings": ";;;;;;;;;;;;;;;AAAA;AACA;AACA;AACA;AACA;;AAEO,aAAMA,gBAAgBC;AAEtB,aAAMC,wBAAwB,CAAC;AAAA,EAAEC;AAAAA,MAAe;AAAA;AACrD,QAAM;AAAA,IAAEC;AAAAA,IAAMC;AAAAA,IAAaC;AAAAA,MAAaC;AACxC,QAAM;AAAA,IAAEC;AAAAA,IAAaC;AAAAA,IAAcC;AAAAA,MAAeC;AAClD,QAAM;AAAA,IAAEC;AAAAA,MAAeC;AACvB,QAAM;AAAA,IAAEC;AAAAA,IAAaC;AAAAA,IAAcC;AAAAA,MAAeC;AAElD,SACE,wBAAC,cAAc,UAAf;AAAA,IAAwB,OAAO;AAAA,MAC7Bb;AAAAA,MACAC;AAAAA,MACAC;AAAAA,MACAE;AAAAA,MACAC;AAAAA,MACAC;AAAAA,MACAE;AAAAA,MACAE;AAAAA,MACAC;AAAAA,MACAC;AAAAA;AAAAA,IAVF;AAAA;AAAA;AAAA;AAAA;AAAA;AAAA;GAPSd;UAC6BK,SACUI,eAC3BE,eAC2BI;AAAAA;KAJvCf;;;;;;;;;;;;;",
  "names": [
    "globalContext",
    "createContext",
    "GlobalContextProvider",
    "children",
    "todo",
    "loadingTodo",
    "getTodos",
    "useTodo",
    "createdTodo",
    "creatingTodo",
    "createTodo",
    "useCreateTodo",
    "deleteTodo",
    "useDeleteTodo",
    "updatedTodo",
    "updatingTodo",
    "updateTodo",
    "useUpdateTodo"
  ],
  "sources": [
    "/home/gabriel/Code/javascript/todo-app/app/src/context/global.context.jsx"
  ],
  "sourcesContent": [
    "import React, { createContext } from 'react'\nimport { useTodo } from '../hooks/use-todo.hook'\nimport { useCreateTodo } from '../hooks/use-create-todo.hook'\nimport { useDeleteTodo } from '../hooks/use-delete-todo.hook'\nimport { useUpdateTodo } from '../hooks/use-update-todo.hook'\n\nexport const globalContext = createContext()\n\nexport const GlobalContextProvider = ({ children }) => {\n  const { todo, loadingTodo, getTodos } = useTodo()\n  const { createdTodo, creatingTodo, createTodo } = useCreateTodo()\n  const { deleteTodo } = useDeleteTodo()\n  const { updatedTodo, updatingTodo, updateTodo } = useUpdateTodo()\n\n  return (\n    <globalContext.Provider value={{\n      todo,\n      loadingTodo,\n      getTodos,\n      createdTodo,\n      creatingTodo,\n      createTodo,\n      deleteTodo,\n      updatedTodo,\n      updatingTodo,\n      updateTodo,\n    }}>\n      {children}\n    </globalContext.Provider>\n  )\n}\n"
  ]
}
```

The script get with [json-parser](https://github.com/AlphaTechnolog/json-parser)
the `sourcesContent` with the command `json-parser --stdin '.sourcesContent[0]'`
and then show it with batcat

## OS

The required os for the perfectly work of this script is a gnu linux based
distribution, it's only tested in Arch Linux, but you can test it with
Ubuntu or another linux distribution, and all will be works too, if not
please open an issue.

The script is writted in bash, because it, it not works in windows.

## Requirements

To install mcg, the requirements are:

- [json-parser](https://github.com/AlphaTechnolog/json-parser)
- bat: In arch linux you can install it with `pacman`: sudo pacman -S bat
- base64: It's installed by default in some linux distributions

## Installing

First clone the project

```sh
mkdir -p ~/repo
cd ~/repo
git clone https://github.com/AlphaTechnolog/mcg mcg
cd mcg
```

Then install with the `install.sh` script:

```sh
sudo ./install.sh
```

Or with make:

```sh
sudo make install
```

> It read the rules in the `Makefile`, in `Arch Linux` check if `make` and `gcc` in some cases it's not installed (like my case, I install it manually `sudo pacman -S gcc make`)

## Uninstalling

If you want to uninstall it, you can remove the binary in `/usr/bin`:

```sh
sudo rm /usr/bin/mcg
```

Done!

## Real usage

If you have a base64 like this:

```
ewogICJ2ZXJzaW9uIjogMywKICAibWFwcGluZ3MiOiAiOzs7Ozs7Ozs7Ozs7Ozs7QUFBQTtBQUNB
O0FBQ0E7QUFDQTtBQUNBOztBQUVPLGFBQU1BLGdCQUFnQkM7QUFFdEIsYUFBTUMsd0JBQXdCLENB
QUM7QUFBQSxFQUFFQztBQUFBQSxNQUFlO0FBQUE7QUFDckQsUUFBTTtBQUFBLElBQUVDO0FBQUFB
LElBQU1DO0FBQUFBLElBQWFDO0FBQUFBLE1BQWFDO0FBQ3hDLFFBQU07QUFBQSxJQUFFQztBQUFB
QSxJQUFhQztBQUFBQSxJQUFjQztBQUFBQSxNQUFlQztBQUNsRCxRQUFNO0FBQUEsSUFBRUM7QUFB
QUEsTUFBZUM7QUFDdkIsUUFBTTtBQUFBLElBQUVDO0FBQUFBLElBQWFDO0FBQUFBLElBQWNDO0FB
QUFBLE1BQWVDO0FBRWxELFNBQ0Usd0JBQUMsY0FBYyxVQUFmO0FBQUEsSUFBd0IsT0FBTztBQUFB
LE1BQzdCYjtBQUFBQSxNQUNBQztBQUFBQSxNQUNBQztBQUFBQSxNQUNBRTtBQUFBQSxNQUNBQztB
QUFBQSxNQUNBQztBQUFBQSxNQUNBRTtBQUFBQSxNQUNBRTtBQUFBQSxNQUNBQztBQUFBQSxNQUNB
QztBQUFBQTtBQUFBQSxJQVZGO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0dBUFNkO1VB
QzZCSyxTQUNVSSxlQUMzQkUsZUFDMkJJO0FBQUFBO0tBSnZDZjs7Ozs7Ozs7Ozs7OzsiLAogICJu
YW1lcyI6IFsKICAgICJnbG9iYWxDb250ZXh0IiwKICAgICJjcmVhdGVDb250ZXh0IiwKICAgICJH
bG9iYWxDb250ZXh0UHJvdmlkZXIiLAogICAgImNoaWxkcmVuIiwKICAgICJ0b2RvIiwKICAgICJs
b2FkaW5nVG9kbyIsCiAgICAiZ2V0VG9kb3MiLAogICAgInVzZVRvZG8iLAogICAgImNyZWF0ZWRU
b2RvIiwKICAgICJjcmVhdGluZ1RvZG8iLAogICAgImNyZWF0ZVRvZG8iLAogICAgInVzZUNyZWF0
ZVRvZG8iLAogICAgImRlbGV0ZVRvZG8iLAogICAgInVzZURlbGV0ZVRvZG8iLAogICAgInVwZGF0
ZWRUb2RvIiwKICAgICJ1cGRhdGluZ1RvZG8iLAogICAgInVwZGF0ZVRvZG8iLAogICAgInVzZVVw
ZGF0ZVRvZG8iCiAgXSwKICAic291cmNlcyI6IFsKICAgICIvaG9tZS9nYWJyaWVsL0NvZGUvamF2
YXNjcmlwdC90b2RvLWFwcC9hcHAvc3JjL2NvbnRleHQvZ2xvYmFsLmNvbnRleHQuanN4IgogIF0s
CiAgInNvdXJjZXNDb250ZW50IjogWwogICAgImltcG9ydCBSZWFjdCwgeyBjcmVhdGVDb250ZXh0
IH0gZnJvbSAncmVhY3QnXG5pbXBvcnQgeyB1c2VUb2RvIH0gZnJvbSAnLi4vaG9va3MvdXNlLXRv
ZG8uaG9vaydcbmltcG9ydCB7IHVzZUNyZWF0ZVRvZG8gfSBmcm9tICcuLi9ob29rcy91c2UtY3Jl
YXRlLXRvZG8uaG9vaydcbmltcG9ydCB7IHVzZURlbGV0ZVRvZG8gfSBmcm9tICcuLi9ob29rcy91
c2UtZGVsZXRlLXRvZG8uaG9vaydcbmltcG9ydCB7IHVzZVVwZGF0ZVRvZG8gfSBmcm9tICcuLi9o
b29rcy91c2UtdXBkYXRlLXRvZG8uaG9vaydcblxuZXhwb3J0IGNvbnN0IGdsb2JhbENvbnRleHQg
PSBjcmVhdGVDb250ZXh0KClcblxuZXhwb3J0IGNvbnN0IEdsb2JhbENvbnRleHRQcm92aWRlciA9
ICh7IGNoaWxkcmVuIH0pID0+IHtcbiAgY29uc3QgeyB0b2RvLCBsb2FkaW5nVG9kbywgZ2V0VG9k
b3MgfSA9IHVzZVRvZG8oKVxuICBjb25zdCB7IGNyZWF0ZWRUb2RvLCBjcmVhdGluZ1RvZG8sIGNy
ZWF0ZVRvZG8gfSA9IHVzZUNyZWF0ZVRvZG8oKVxuICBjb25zdCB7IGRlbGV0ZVRvZG8gfSA9IHVz
ZURlbGV0ZVRvZG8oKVxuICBjb25zdCB7IHVwZGF0ZWRUb2RvLCB1cGRhdGluZ1RvZG8sIHVwZGF0
ZVRvZG8gfSA9IHVzZVVwZGF0ZVRvZG8oKVxuXG4gIHJldHVybiAoXG4gICAgPGdsb2JhbENvbnRl
eHQuUHJvdmlkZXIgdmFsdWU9e3tcbiAgICAgIHRvZG8sXG4gICAgICBsb2FkaW5nVG9kbyxcbiAg
ICAgIGdldFRvZG9zLFxuICAgICAgY3JlYXRlZFRvZG8sXG4gICAgICBjcmVhdGluZ1RvZG8sXG4g
ICAgICBjcmVhdGVUb2RvLFxuICAgICAgZGVsZXRlVG9kbyxcbiAgICAgIHVwZGF0ZWRUb2RvLFxu
ICAgICAgdXBkYXRpbmdUb2RvLFxuICAgICAgdXBkYXRlVG9kbyxcbiAgICB9fT5cbiAgICAgIHtj
aGlsZHJlbn1cbiAgICA8L2dsb2JhbENvbnRleHQuUHJvdmlkZXI+XG4gIClcbn1cbiIKICBdCn0K
```

> It's a base64 with a code like this:

```json
{
  "version": 3,
  "mappings": ";;;;;;;;;;;;;;;AAAA;AACA;AACA;AACA;AACA;;AAEO,aAAMA,gBAAgBC;AAEtB,aAAMC,wBAAwB,CAAC;AAAA,EAAEC;AAAAA,MAAe;AAAA;AACrD,QAAM;AAAA,IAAEC;AAAAA,IAAMC;AAAAA,IAAaC;AAAAA,MAAaC;AACxC,QAAM;AAAA,IAAEC;AAAAA,IAAaC;AAAAA,IAAcC;AAAAA,MAAeC;AAClD,QAAM;AAAA,IAAEC;AAAAA,MAAeC;AACvB,QAAM;AAAA,IAAEC;AAAAA,IAAaC;AAAAA,IAAcC;AAAAA,MAAeC;AAElD,SACE,wBAAC,cAAc,UAAf;AAAA,IAAwB,OAAO;AAAA,MAC7Bb;AAAAA,MACAC;AAAAA,MACAC;AAAAA,MACAE;AAAAA,MACAC;AAAAA,MACAC;AAAAA,MACAE;AAAAA,MACAE;AAAAA,MACAC;AAAAA,MACAC;AAAAA;AAAAA,IAVF;AAAA;AAAA;AAAA;AAAA;AAAA;AAAA;GAPSd;UAC6BK,SACUI,eAC3BE,eAC2BI;AAAAA;KAJvCf;;;;;;;;;;;;;",
  "names": [
    "globalContext",
    "createContext",
    "GlobalContextProvider",
    "children",
    "todo",
    "loadingTodo",
    "getTodos",
    "useTodo",
    "createdTodo",
    "creatingTodo",
    "createTodo",
    "useCreateTodo",
    "deleteTodo",
    "useDeleteTodo",
    "updatedTodo",
    "updatingTodo",
    "updateTodo",
    "useUpdateTodo"
  ],
  "sources": [
    "/home/gabriel/Code/javascript/todo-app/app/src/context/global.context.jsx"
  ],
  "sourcesContent": [
    "import React, { createContext } from 'react'\nimport { useTodo } from '../hooks/use-todo.hook'\nimport { useCreateTodo } from '../hooks/use-create-todo.hook'\nimport { useDeleteTodo } from '../hooks/use-delete-todo.hook'\nimport { useUpdateTodo } from '../hooks/use-update-todo.hook'\n\nexport const globalContext = createContext()\n\nexport const GlobalContextProvider = ({ children }) => {\n  const { todo, loadingTodo, getTodos } = useTodo()\n  const { createdTodo, creatingTodo, createTodo } = useCreateTodo()\n  const { deleteTodo } = useDeleteTodo()\n  const { updatedTodo, updatingTodo, updateTodo } = useUpdateTodo()\n\n  return (\n    <globalContext.Provider value={{\n      todo,\n      loadingTodo,\n      getTodos,\n      createdTodo,\n      creatingTodo,\n      createTodo,\n      deleteTodo,\n      updatedTodo,\n      updatingTodo,\n      updateTodo,\n    }}>\n      {children}\n    </globalContext.Provider>\n  )\n}\n"
  ]
}
```

> I extract it from my projects, and put it as samples

You can extract the code with this command:

```sh
mcg 'ewogICJ2ZXJzaW9uIjogMywKICAibWFwcGluZ3MiOiAiOzs7Ozs7Ozs7Ozs7Ozs7QUFBQTtBQUNB O0FBQ0E7QUFDQTtBQUNBOztBQUVPLGFBQU1BLGdCQUFnQkM7QUFFdEIsYUFBTUMsd0JBQXdCLENB QUM7QUFBQSxFQUFFQztBQUFBQSxNQUFlO0FBQUE7QUFDckQsUUFBTTtBQUFBLElBQUVDO0FBQUFB LElBQU1DO0FBQUFBLElBQWFDO0FBQUFBLE1BQWFDO0FBQ3hDLFFBQU07QUFBQSxJQUFFQztBQUFB QSxJQUFhQztBQUFBQSxJQUFjQztBQUFBQSxNQUFlQztBQUNsRCxRQUFNO0FBQUEsSUFBRUM7QUFB QUEsTUFBZUM7QUFDdkIsUUFBTTtBQUFBLElBQUVDO0FBQUFBLElBQWFDO0FBQUFBLElBQWNDO0FB QUFBLE1BQWVDO0FBRWxELFNBQ0Usd0JBQUMsY0FBYyxVQUFmO0FBQUEsSUFBd0IsT0FBTztBQUFB LE1BQzdCYjtBQUFBQSxNQUNBQztBQUFBQSxNQUNBQztBQUFBQSxNQUNBRTtBQUFBQSxNQUNBQztB QUFBQSxNQUNBQztBQUFBQSxNQUNBRTtBQUFBQSxNQUNBRTtBQUFBQSxNQUNBQztBQUFBQSxNQUNB QztBQUFBQTtBQUFBQSxJQVZGO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0dBUFNkO1VB QzZCSyxTQUNVSSxlQUMzQkUsZUFDMkJJO0FBQUFBO0tBSnZDZjs7Ozs7Ozs7Ozs7OzsiLAogICJu YW1lcyI6IFsKICAgICJnbG9iYWxDb250ZXh0IiwKICAgICJjcmVhdGVDb250ZXh0IiwKICAgICJH bG9iYWxDb250ZXh0UHJvdmlkZXIiLAogICAgImNoaWxkcmVuIiwKICAgICJ0b2RvIiwKICAgICJs b2FkaW5nVG9kbyIsCiAgICAiZ2V0VG9kb3MiLAogICAgInVzZVRvZG8iLAogICAgImNyZWF0ZWRU b2RvIiwKICAgICJjcmVhdGluZ1RvZG8iLAogICAgImNyZWF0ZVRvZG8iLAogICAgInVzZUNyZWF0 ZVRvZG8iLAogICAgImRlbGV0ZVRvZG8iLAogICAgInVzZURlbGV0ZVRvZG8iLAogICAgInVwZGF0 ZWRUb2RvIiwKICAgICJ1cGRhdGluZ1RvZG8iLAogICAgInVwZGF0ZVRvZG8iLAogICAgInVzZVVw ZGF0ZVRvZG8iCiAgXSwKICAic291cmNlcyI6IFsKICAgICIvaG9tZS9nYWJyaWVsL0NvZGUvamF2 YXNjcmlwdC90b2RvLWFwcC9hcHAvc3JjL2NvbnRleHQvZ2xvYmFsLmNvbnRleHQuanN4IgogIF0s CiAgInNvdXJjZXNDb250ZW50IjogWwogICAgImltcG9ydCBSZWFjdCwgeyBjcmVhdGVDb250ZXh0 IH0gZnJvbSAncmVhY3QnXG5pbXBvcnQgeyB1c2VUb2RvIH0gZnJvbSAnLi4vaG9va3MvdXNlLXRv ZG8uaG9vaydcbmltcG9ydCB7IHVzZUNyZWF0ZVRvZG8gfSBmcm9tICcuLi9ob29rcy91c2UtY3Jl YXRlLXRvZG8uaG9vaydcbmltcG9ydCB7IHVzZURlbGV0ZVRvZG8gfSBmcm9tICcuLi9ob29rcy91 c2UtZGVsZXRlLXRvZG8uaG9vaydcbmltcG9ydCB7IHVzZVVwZGF0ZVRvZG8gfSBmcm9tICcuLi9o b29rcy91c2UtdXBkYXRlLXRvZG8uaG9vaydcblxuZXhwb3J0IGNvbnN0IGdsb2JhbENvbnRleHQg PSBjcmVhdGVDb250ZXh0KClcblxuZXhwb3J0IGNvbnN0IEdsb2JhbENvbnRleHRQcm92aWRlciA9 ICh7IGNoaWxkcmVuIH0pID0+IHtcbiAgY29uc3QgeyB0b2RvLCBsb2FkaW5nVG9kbywgZ2V0VG9k b3MgfSA9IHVzZVRvZG8oKVxuICBjb25zdCB7IGNyZWF0ZWRUb2RvLCBjcmVhdGluZ1RvZG8sIGNy ZWF0ZVRvZG8gfSA9IHVzZUNyZWF0ZVRvZG8oKVxuICBjb25zdCB7IGRlbGV0ZVRvZG8gfSA9IHVz ZURlbGV0ZVRvZG8oKVxuICBjb25zdCB7IHVwZGF0ZWRUb2RvLCB1cGRhdGluZ1RvZG8sIHVwZGF0 ZVRvZG8gfSA9IHVzZVVwZGF0ZVRvZG8oKVxuXG4gIHJldHVybiAoXG4gICAgPGdsb2JhbENvbnRl eHQuUHJvdmlkZXIgdmFsdWU9e3tcbiAgICAgIHRvZG8sXG4gICAgICBsb2FkaW5nVG9kbyxcbiAg ICAgIGdldFRvZG9zLFxuICAgICAgY3JlYXRlZFRvZG8sXG4gICAgICBjcmVhdGluZ1RvZG8sXG4g ICAgICBjcmVhdGVUb2RvLFxuICAgICAgZGVsZXRlVG9kbyxcbiAgICAgIHVwZGF0ZWRUb2RvLFxu ICAgICAgdXBkYXRpbmdUb2RvLFxuICAgICAgdXBkYXRlVG9kbyxcbiAgICB9fT5cbiAgICAgIHtj aGlsZHJlbn1cbiAgICA8L2dsb2JhbENvbnRleHQuUHJvdmlkZXI+XG4gIClcbn1cbiIKICBdCn0K' 'jsx'
```

> If you want to skip the `jsx` argument, you can, but the syntax highlighting does not works, it highlight for a txt file by default

## Generating the base64 from a payload

I generate the files `sample-base64.txt` and the file `sample-payload.json`
with some simple commands:

> I have a file with the json, in this example it's named `payload.json`

```sh
cat payload.json | jq -M > sample-payload.json
base64 sample-payload.json > sample-base64.txt
```

Or with the automation script:

```sh
./mkb64.frompayload ./sample-payload.json ./sample-base64.txt
```

Then test it:

```sh
mcg "$(cat ./sample-base64.txt)" "jsx"
```

Done!
