
local request = (syn and syn.request) or (http and http.request) or http_request

if not request then
    print("[github] use another exploit.")
    return false
    
end

local lib = {}

lib.Repo = function(author, repo, path)
    local response = request({
        Url = "https://api.github.com/repos/" .. tostring(author) .. "/" .. tostring(repo) .. "/contents/" .. path;
        Method = "GET";
        
    })
    if response.Body ~= "404: Not Found" then
        local converted = {}
        pcall(function()
            converted = HttpService:JSONDecode(response.Body)
        
        end)
        return converted
        
    end
    return false, "404"
    
end

return lib
