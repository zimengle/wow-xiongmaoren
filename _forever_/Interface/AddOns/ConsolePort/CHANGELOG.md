# Console Port

## [3.3.10](https://github.com/seblindfors/ConsolePort/tree/3.3.10) (2026-10-07)
[Full Changelog](https://github.com/seblindfors/ConsolePort/compare/3.3.9...3.3.10) [Previous Releases](https://github.com/seblindfors/ConsolePort/releases)

- Bump version to 3.3.10  
- Merge pull request #260 from seblindfors/feature/dim-unbound-glyph  
    Dim the button glyph on unbound slots  
- Dim the button glyph on unbound slots  
- Merge pull request #259 from seblindfors/fix/layout-tolerance  
    Render the layout elements a definition knows and skip the rest  
- Render the layout elements a definition knows and skip the rest  
    A layout saved by a newer build can carry fields and element types this  
    build has no definition for. Nested Table.Set now honours the silent  
    flag the interface already passes at the top level, unknown element  
    types are skipped, and each element upgrades under pcall so one bad  
    entry never blanks the whole bar. Skipped elements are logged.  
- Merge pull request #255 from Daemeron/feature/rename-loadout-elements  
    Rename loadout elements in the bar designer  
- Merge pull request #256 from Daemeron/feature/multiple-pet-rings  
    Allow more than one pet ring  
- Merge pull request #257 from Daemeron/feature/art-strata-level  
    Expose strata and level for artwork  
- Alias a blocked chord to the tap key the engine dispatches it as  
    A chord holding a button's own modifier never fires; the engine emits the  
    button's tap without that modifier. The bar already registers the  
    complement action under the blocked key, but the row swap on a modifier  
    press released the plain tap claim before the engine dispatched the tap,  
    so it fell through to the stored ACTIONBUTTON binding on Blizzard's  
    hidden button. Claims and releases now map blocked keys to their tap key.  
    (cherry picked from commit d29066cba62c83a86e3ea2da4e9d862b618dd0b9)  
- Expose strata and level for artwork  
    Art used the simple position type, so its strata and level couldn't be  
    set in the designer, unlike dividers and glyphs which share the same  
    frame setup. Artwork in MEDIUM strata covers other addons' frames placed  
    over it, such as a detached unit frame portrait; with the complex  
    position type it can be moved to a lower strata or level.  
    Saved layouts are filled with interface defaults on load, so Art  
    defaults to level 1, where it sits today (one below group bars), instead  
    of the complex type's level 2.  
    Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>  
- Rename loadout elements in the bar designer  
    Elements in the Loadout list could only be copied or deleted, so  
    reorganizing a layout meant copying an element to the new name and  
    deleting the old one. A rename button on every element does both in one  
    step, using the copy popup's name validation. Unique elements get it too,  
    since a rename doesn't duplicate them.  
    The element is stored as a copy under the new name, like Copy does:  
    widgets listen to their props table, so moving the same table would keep  
    the released frame subscribed and the designer would highlight it too.  
    Bars are named after their element, so a renamed bar gets a new frame  
    name. Bindings and action slots don't depend on it.  
    Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>  
- Allow more than one pet ring  
    The pet ring was the only unique element besides the toolbar, and its  
    factory always returned one global frame whatever the element ID, so a  
    second entry would have driven the same ring. Each element now gets its  
    own frame. The first ring keeps the ConsolePortBarPetRing name; further  
    rings are named after their element, like group bars. The toolbar stays  
    unique.  
    Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>  
- Merge pull request #254 from seblindfors/fix/forever-menu-ring  
    Forever: fix menu ring Character, Inventory and Friends  
- Menu: open the friends list on Forever clients  
- Menu: open the character panel on Forever clients  
- Menu: point the inventory button at the client bag button on Forever  
