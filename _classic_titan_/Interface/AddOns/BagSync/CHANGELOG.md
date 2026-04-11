# BagSync

## [v20.18](https://github.com/Xruptor/BagSync/tree/v20.18) (2026-04-08)
[Full Changelog](https://github.com/Xruptor/BagSync/compare/v20.17...v20.18) [Previous Releases](https://github.com/Xruptor/BagSync/releases)

- Search Fixes  
    * Fixed an issue with LibItemScout was not properly returning the cache list of found items.  
    * Fixed an issue where the Search window was not returning items alphabetically.  
    * Fixed an issue with the Search Filters where characters were not properly being parsed when selected from the Filters list.  
- Old Code Cleanup and Profiles Fix  
    * Fixed a bug with the profiles module in which trying to delete a profile was not working properly.  You should be able to delete profiles now.  (Fixed #460)  
    * Updated the LibItemScout library.  It now has been cleaned up and will cache searches straight from the BagSync search window.  
    * Cleaned up some old classic server checks that aren't needed anymore.  
    * Removed a few dead or unused code references.  
    * Changed the BagSync Search window to now use the compiled cache from LibItemScout instead of doing a separate find each time.  This is much more efficient as it no longer does a loop to search each time for a string.  
    * Cleaned up SortOrder removed some unused function calls.  
    * Fixed Unit module.  It now properly has the Debug working.  It was incorrectly being mapped to an old Debug code.  
    * Cleaned up ExtraTooltip (ExtTip).  It should have proper failsafes now in case a tooltip is secured by Blizzard.  
