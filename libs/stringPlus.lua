
local lib = {}

lib.split = function(text, sep)
	if sep == nil then
		sep = "%s"
	end

	local t = {}
	for str in string.gmatch(text, "([^"..sep.."]+)") do
		table.insert(t, str)

	end

	return t

end
lib.random = setmetatable({
	length = 6;
	seed = os.time();
	char_set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

}, {
	__call = function(root, length)
		length = length or root.length

		math.randomseed(root.seed)

		local random_string = {}

		for int = 1, length do
			local random_number = math.random(1, #root.char_set)
			local character = string.sub(root.char_set, random_number, random_number)

			random_string[#random_string + 1] = character
		end
		return table.concat(random_string)

	end;

})
lib.json = function(data)
	local generated;
	if type(data) == "table" then -- convert to json string
		generated = HttpService:JSONEncode(data)

	else -- convert to table
		local r = pcall(function()
			generated = HttpService:JSONDecode(tostring(data))

		end)
		if not r then
			return false

		end

	end
	return generated

end

return lib
