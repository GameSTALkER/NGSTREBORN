local author = "GameSTALkER"
local repo = "NGSTREBORN"
local path = "libs/"

local github_api = loadstring(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/NGSTREBORN/main/libs/github-api.lua"))()
local cached_libs = {}

local function loader(lib_name)
    local response = github_api.Repo(author, repo, path .. tostring(lib_name))
    
    if cached_libs[tostring(lib_name)] then
        return cached_libs[tostring(lib_name)]
    
    elseif response and response.download_url then
        cached_libs[tostring(lib_name)] = loadstring(game:HttpGet(response.download_url))
        return cached_libs[tostring(lib_name)]
        
    else
        return false, "Not found."
        
    end
    
end

return loader
