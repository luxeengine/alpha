things that need to happen

ResourceManager needs to change to use snow types for assets

for snow :
    asset.cache = true/false - keep the data cached when loading for subsequent requests
    asset.persist = true/false - keep the item cached when assets.clear() is called
    asset.reload() - refresh the data object from disk/etc
    asset.clear() - clear up data to free memory etc, use reload to refill

{ strict:true/false } flags for loading outside of the asset list

loadTexture/s, loadFont, loadShader etc needs to be centralized and redundant code removed, and some migrated into snow itself 
    - handling existing images/shaders/fonts returning the existing instances unless asked not to
    - handling storing the live list for clearing/uncaching, perhaps with a persist flag like assets.clear() will 
    - handling absolute paths that aren't in the asset list i.e "strict" flag
