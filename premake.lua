solution "EmptyProject"
	
	platforms { "x64" }
	configurations { "Debug", "Release" }
	startproject "EmptyProject"

	project "EmptyProject"

        kind "ConsoleApp"
        symbols "On"
        editandcontinue "On"
        dpiawareness "HighPerMonitor"
        
        defines
        {
            "_CRT_SECURE_NO_WARNINGS",
            "STR_DEFINE_STR32",
            "STR_SUPPORT_STD_STRING=0",
        }

        filter { "toolset:msc*" }
            disablewarnings
            {
                "4244", -- 'return': conversion from '__int64' to 'int', possible loss of data
                "4267", -- 'initializing': conversion from 'size_t' to 'int', possible loss of data
            }

        filter { "configurations:Debug" }
            defines "EA_DEBUG" -- Enables EA_ASSERT

        filter {}
        
		files 
		{
            "src/.clang-format",
			"src/**.h",
            "src/**.cpp",
            "src/**.natvis",
            "thirdparty/imgui/*.h",
            "thirdparty/imgui/*.cpp",
            "thirdparty/imgui/**.natvis",
            "thirdparty/imgui/examples/imgui_impl_dx11.cpp",
            "thirdparty/imgui/examples/imgui_impl_dx11.h",
            "thirdparty/imgui/examples/imgui_impl_win32.cpp",
            "thirdparty/imgui/examples/imgui_impl_win32.h",
            "thirdparty/Str/**.h",
            "thirdparty/Str/**.cpp",
            "thirdparty/Str/**.natvis",
            "thirdparty/icons/**.h",
            "thirdparty/rapidjson/**.cpp",
            "thirdparty/rapidjson/**.h",
			"thirdparty/flat_hash_map/**.h",
            "thirdparty/EASTL/include/**.h",
            "thirdparty/EASTL/source/**.cpp",
            "thirdparty/EASTL/test/packages/EAAssert/include/eaassert/*.h",
            "thirdparty/EASTL/test/packages/EAAssert/source/*.cpp",
            "thirdparty/EASTL/test/packages/EAStdC/source/**.cpp",
            "thirdparty/EASTL/test/packages/EAThread/include/eathread/*.h",
            "thirdparty/EASTL/test/packages/EAThread/source/*.cpp",
            "thirdparty/EASTL/doc/**.natvis",
        }
		
		includedirs 
		{
            "src",
            "thirdparty",
            "thirdparty/imgui",
            "thirdparty/imgui/examples/",
            "thirdparty/EASTL/include",
            "thirdparty/EASTL/test/packages/EAAssert/include",
            "thirdparty/EASTL/test/packages/EABase/include/Common",
            "thirdparty/EASTL/test/packages/EAStdC/include",
            "thirdparty/EASTL/test/packages/EAThread/include",
        }
        
        links
        {
            "D3D11.lib",
        }
