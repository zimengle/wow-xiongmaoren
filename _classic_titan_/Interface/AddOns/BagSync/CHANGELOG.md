# BagSync

## [v20.0](https://github.com/Xruptor/BagSync/tree/v20.0) (2026-02-01)
[Full Changelog](https://github.com/Xruptor/BagSync/compare/v19.82...v20.0) [Previous Releases](https://github.com/Xruptor/BagSync/releases)

- Final Cleanup (BagSync Rehaul)  
    * This is it!  I have cleaned up BagSync to be much more efficient and optimized. I'm still working on a complete rewrite, but I wanted to cleanup the existing code as I continue on the BagSync Rewrite.  This version of BagSync should feel zippy and more fluid then the previous code. I made some improvements everywhere!  Enjoy!  
    * I cleaned up the coreui.xml.  I really disliked how all the script code was using chains of GetParent() with parenthandlers.  To resolve this I just forced everything that is code into the actual LUA files and just left the XML to be the graphical construct.  All handler calls are now handled internally by core.lua.  This is MUCH cleaner then what I had before and allows me more flexibility.  
    * Fixed several issues with LibItemScout that was preventing some of the conditional calls not to function properly.  
- Small Update  
- Cleaned Up Search Filters Logic  
    *Search Filters didn't really respect blacklists/factions so I added checks for that.  
    * apparently I forgot to add guild banks to the possible filters, well that was fixed lol.  
    * I made the tooltip only display the filtered tooltips when Search Filters is opened.  Otherwise it defaults to normal tooltips when it's closed.  
- Advanced Search Rename  
    * I decided to rename Advanced Search to just plain Search Filters.  This makes much more sense to me since you're filtering your current search anyways.  
- Major Config Changes  
    * Went ahead and changed the color options to rows instead to make it easier to add in the future new colors.  Also it lets me add that small color swatch box.  
    * Cleaned up the gametooltip group bordering on many of the options and fixed the scaling.  
    * Fixed an issue where the text on the ExtTip wasn't being applied.  I forgot to rescan the tooltip to make it apply the font... duh.  
    * Fixed several issues with sizing on many of the controls.  I really hate how blizzard has changed the UI scaling options across clients.  What a pain!  So I have to adjust for that.  Which is why there are so many "dirty" processors everywhere.  Because it's dirty having to go from client to retail constantly.  
    * Fixed an issue where the stupid dropdowns didn't adjust with selection text width.  
- More Config Cleanup  
    * Cleaned up the Config a bit more.  I had some locales that were from legacy stuff that I never removed.  
- Huge Config Rehaul  
    * I really didn't like how the config system used to do a cascading get/set method for the configuration processing.  So I switched to a new schema method that is a bit smoother.  
    * I think I made some bugs here and there, but I'll figure it out as I go.  That wrapper.lua is beginning to test my patience as well and I may rewrite that too LOL.  
- Deprecated and Fallback Cleanup for Functions  
    * Added several fallbacks to functions and tripple checks because of backwards compatibility.  
    * Did some cleanup in LibItemScout.  
    * Added MouseOver checks all over the place to make sure the correct function is used.  
    * Tooltips were being reset all over the place.  I added a spam check for this and cleaned this up as well.  
    * There was no cap limit for the tooltip cache.  So I added one and it will always try to keep the latest in the cache rather then wipe the entire thing.  
    * Added a fix for guilds not being blacklisted like they should from tooltips (Fixes #440)  
- Condensed UI Creation a Bit  
    * Had the same UI creation across multiple modules.  I figured it would be better just to create a function that does it for me without having to spam the same frame creation code in every module.  This goes for Scroll Frames as well.  It's not perfect, but it is a bit cleaner.  
    * Fixed a bug in Blacklist as there was unused guild variables that weren't being used for comparison in the guild list.  
- LibItemScout Updates  
    * LibItemScout has been updated to be a more better on caching.  I've been meaning to do this and just never got around to it.  
    * It will now compile searches and filter the compiled searches through the items, first through cache then the actual item.  
    * Once everything is done it adds it to a cache for current searches.  
    * Added a public method to allow users to utilize LibItemScout in their addons.  
    * Updated the locales to add missing support for not logic operators.  I can't believe I forgot those lol.  
    * Added some apperance transmog tooltip checks.  Though those aren't really used outside of Retail.  
- ExtTip Enhancements  
    * Wowzers!  Apparently trying to enumerate the frames to get the bottom tooltip was a huge mistake.  Soooooo much lag!  
    * Instead I just used the old method that I had and made sure certain addons and tooltips aren't being shown.  
    * Since stupid OnTooltipCleared gets SPAMMED like crazy by Blizzard in the bags, I added a cache check for the ExtTip anchors.  
    * Hopefully it doesn't bug out, but I tried to add a bogus signature id to each cache.  If it matches then great, otherwise recalculate.  
- Removed LibQTip  
    * I didn't want to rely on this old Library.  Using a custom Extended Tooltip for BagSync now.  It still does checks for other addons, just in case.  
- Tooltip Module Enhancements  
    * Just minor cleanup on the tooltip module.  I realized that I was processing in loops more often then I should.  So I added a cache check for the grand totals.  
    * Trying to use table.concat more.  It's a bit better then what I was doing before by joining strings.  
- SaveCurreny Updates  
    * Updated the SaveCurrency to be more efficient.  I'm an idiot and never realized it was scanning twice for certain currencies.  I fixed that.  LOL  
    * Blizzard has added more ways to check for headers and expanded rows, so I've added checks for that.  
    * Since the return can be a data table or variables it gets tricky for backwards compatibility.  I make sure to check for that.  
- Optimizations to Scanner Wireframe  
    * Cleaned up scanning the professions, it was a mess.  I added some checks for parsed professions and recipes so they only get scanned once.  
    * Added some cleanup cache stuff for the pet scans.  
    * Removed a bunch of old table.insert() crap, it wasn't needed.  
- Optimized the Item Cache Gathering Routines  
- Code Cleanup  
    * Fall back to Blizzards built in timers if detected.  Otherwise use our standard timers.  
    * Cleanup of the DecodeOpts and EncodeOpts it was a little sloppy.  
    * Apparently Blizzard no longer shows battle pet details in guild banks anymore.  They are always treated as Pet Cages as 82800 itemid now.  So there is no way to get battle pet info even with a tooltip.  I had to alter the findBattlePet code to take this into consideration and delete it if it still stays 82800.  IconText was returning 160 which is wrong because there is a pet that uses the pet cage icon but it isn't he actual pet we have.  So it defaulted to it, now it will check and if its 82800 it will ignore it.  
    * Removed some old code  
- Removed some more Libraries  
    * Added upport for LibSharedMedia if detected.  Otherwise default to Blizzard fonts.  
    * I'm cleaning house as I don't really want to rely on libraries anymore.  
- Even more Localization Fixes  
    * Fixed frFR, koKR, zhCN and zhTW with missing locales and translations.  
- Updated Localizations  
    * Updated esES, esMX, itIT, ptBR and zhTW translations.  
- Minimap Converted and Libraries Removed  
    * Removed some more unneeded libraries and just did the minimap myself.  
    * Added support for Databroker IF it's loaded and or detected.  
    * Added some missing locales that I'm going to translate when I get a chance.  Made enGB just default to enUS.  
    * Fixed a few issues with the new minimap in config panel.  
- Start of Major Cleanup  
    * Removing all Ace3 references and libraries.  Trying to reduce dependency on libraries.  
    * Cleaned up code all over the place.  
- Added new Tooltip Sorting Options  
    * Added new tooltip sorting options (Fixed #435)  
- Ace3 Update and Tooltip Optimization  
    * Updated the Ace3 libraries  
    * Added additional optimization to the tooltip module.  
- Minor options validation checks  
- Options check fix  
    * Small fix for some option checks  
