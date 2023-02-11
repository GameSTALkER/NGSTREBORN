local author = "GameSTALkER"
local repo = "NGSTREBORN"
local path = "libs/"

local github_api = loadstring(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/NGSTREBORN/main/libs/github.lua"))()

local function loader(lib_name)
    local response = github_api.Repo(author, repo, path .. tostring(lib_name))
    
    if response and response.download_url then
        return loadstring(game:HttpGet(response.download_url))
        
    else
        return false, "Not found."
        
    end
    
end

return loader
