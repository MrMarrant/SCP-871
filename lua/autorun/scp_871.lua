-- Functions
scp_871 = {}
-- Global Variable
SCP_871_CONFIG = {}
-- Lang
SCP_871_LANG = {}
-- Root path
SCP_871_CONFIG.RootFolder = "scp_871/"
-- Actual lang server
--! Not used
SCP_871_CONFIG.LangServer = GetConVar("gmod_language"):GetString()

--[[
* Load the file set in the parameters.
* @string File The name of the file to load.
* @string directory The path of the directory to load.
--]]
local function AddFile( File, directory )
	local prefix = string.lower( string.Left( File, 3 ) )

	if SERVER and prefix == "sv_" then
		include( directory .. File )
	elseif prefix == "sh_" then
		if SERVER then
			AddCSLuaFile( directory .. File )
		end
		include( directory .. File )
	elseif prefix == "cl_" then
		if SERVER then
			AddCSLuaFile( directory .. File )
		elseif CLIENT then
			include( directory .. File )
		end
	end
end

--[[
* Allows you to load all the files in a folder.
* @string directory The path of the directory to load.
--]]
local function LoadDirectory( directory )
	directory = directory .. "/"

	local files, directories = file.Find( directory .. "*", "LUA" )

	for _, v in ipairs( files ) do
		if string.EndsWith( v, ".lua" ) then
			AddFile( v, directory )
		end
	end

	for _, v in ipairs( directories ) do
		LoadDirectory( directory .. v )
	end
end

print("SCP-871 Loading . . .")
LoadDirectory(SCP_871_CONFIG.RootFolder .. "config")
LoadDirectory(SCP_871_CONFIG.RootFolder .. "modules")
print("SCP-871 Loaded!")