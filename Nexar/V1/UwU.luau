if not getgenv().hooked then
	local _game = cloneref and cloneref(game) or game;

	-- requested by cropw
	-- ~~~cwacked~~~ by catter UwU

	getgenv().game = setmetatable({}, {
		__index = function(_, key)
			if key == "HttpGet" then
				return function(self, url)
					local ret = _game.HttpGet(_game, url);
					if url:find'check_key' then
						-- verification_data = token x 13 + 5 
						-- math reversed in 0.1s
						return '{"blacklisted":false,"key_valid":true,"token":"thisAuthIsSoProOmgJoin .gg/25ms x0","whitelisted":false}';
					elseif url:find'verify_session' then
						print'b'
						return '{"verification_data":5}'
					elseif url:find'Orion.lua' then
						return _game.HttpGet(_game, "https://raw.githubusercontent.com/cattercatty/Scripts/refs/heads/main/UIS/Orion.luau")
					end;
					print(url);
					return ret;
				end
			elseif key == "HttpPost" then
				return function() end;
			end;
			local index = _game[key];
			if typeof(index) == "function" then
				return function(_, ...)
					return index(_game, ...);
				end;
			else
				return index;
			end;
		end,
		__newindex = function(_, k, v)
			error();
		end,
		__metatable = "The metatable is protected"
	});

	local oldType = clonefunction(typeof);
	getgenv().typeof = function(object)
		if object == game then
			return 'Instance'
		end;
		return oldType(object);
	end
	getgenv().hooked = true;
end;

local scripts = {
	[7711635737] = "https://raw.githubusercontent.com/cattercatty/Cats/refs/heads/main/Nexar/V1/EH.luau",
	[126884695634066] = "https://raw.githubusercontent.com/cattercatty/Cats/refs/heads/main/Nexar/V1/GAG.luau";
}

loadstring(game:HttpGet(scripts[game.PlaceId]))()

-- hi
