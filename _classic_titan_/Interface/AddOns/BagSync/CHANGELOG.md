# BagSync

## [v20.23](https://github.com/Xruptor/BagSync/tree/v20.23) (2026-04-15)
[Full Changelog](https://github.com/Xruptor/BagSync/compare/v20.22...v20.23) [Previous Releases](https://github.com/Xruptor/BagSync/releases)

- Reverted the LibDBIcon Update  
    * Apparently the updated LibDBIcon library was causing issues, so I reverted it back to the older version.  (Fixes #467)  
- Revert "Fixed Login Stutter Issue  
    * There was a slight stutter on login if users had a LOT of recipes from across dozens of characters.  To minimize this it's been pushed to only cache the classic professions only.  (Fixes #466)"  
