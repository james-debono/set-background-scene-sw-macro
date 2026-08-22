# Set Background - Scene

A SOLIDWORKS macro that restores the graphics area background to the document's
own scene background from a toolbar button.

Works with SOLIDWORKS 2022, 2024 and 2025.

## What it does

Sets the background appearance back to **use the document scene background**,
undoing a plain colour set by either of the colour macros. It deliberately
leaves the plain background **colour** alone, so switching back to Colour Light
or Colour Dark afterwards restores whichever colour you last used.

It writes a **system option**, not a document property. Nothing is saved into
any part, assembly or drawing, and the setting persists across documents and
sessions until changed again.

## Install

**The macro on its own:** download `Set-Background-Scene.swp` from the [latest
release](../../releases/latest), then run it with **Tools > Macro > Run**, or
add it to a toolbar with **Tools > Customize > Commands > Macro**. **Tools >
Customize > Keyboard** assigns a keyboard shortcut instead.

**With [MacroDeck](https://github.com/james-debono/macrodeck-sw-addin):** get
the [MacroDeck
Collection](https://github.com/james-debono/macrodeck-collection-sw-macro-library/releases/latest),
which packages this macro with its icon and hover text alongside every other
macro in the set. The five theme macros appear together as a Themes drop-down.

## Related macros

- [Set Background - Colour Dark](https://github.com/james-debono/set-background-colour-dark-sw-macro)
- [Set Background - Colour Light](https://github.com/james-debono/set-background-colour-light-sw-macro)

## Building from source

`src/Set-Background-Scene.vba` is the source. A `.swp` is a binary VBA project,
so it has to be created from inside SOLIDWORKS — there is no build step:

1. **Tools > Macro > New…**, and save it with the matching name.
2. The VBA editor opens on an empty `Sub main()`. Select all and delete.
3. Paste in the whole contents of the `.vba`.
4. Save and close the editor.

Nothing needs adding under **Tools > References** — a new SOLIDWORKS macro
already references the `SldWorks` and `swconst` type libraries, which is what
supplies the enum names the source uses.

## Licence

MIT — see [LICENSE](LICENSE). Free to use, modify and share. The full licence
text is also carried inside the macro itself, so a `.swp` passed on by itself
still carries its licence.

Written by James Debono.

## Trademarks

SOLIDWORKS is a registered trademark of Dassault Systèmes SolidWorks
Corporation. This project is independent: it is not affiliated with, endorsed
by, or sponsored by Dassault Systèmes, and uses only the published SOLIDWORKS
API.