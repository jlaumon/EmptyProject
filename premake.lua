solution "EmptyProject"
	
	platforms { "x64" }
	configurations { "Debug", "DebugASAN", "DebugOpt", "Release" }
	startproject "EmptyProject"

	project "EmptyProject"

		kind "ConsoleApp"
		symbols "On"
		cppdialect "C++20"
		dpiawareness "HighPerMonitor"
		flags 
		{
			"MultiProcessorCompile",
			"FatalWarnings"
		}
		
		defines
		{
			"_CRT_SECURE_NO_WARNINGS",
			"STR_DEFINE_STR32",
			"STR_SUPPORT_STD_STRING=0",
		}

		filter { "toolset:msc*" }
			buildoptions
			{
				"/utf-8" 
			}
			disablewarnings
			{
				"4244", -- 'return': conversion from '__int64' to 'int', possible loss of data
				"4267", -- 'initializing': conversion from 'size_t' to 'int', possible loss of data
			}

		filter { "configurations:Debug" }
			targetsuffix "Debug"
			defines "ASSERTS_ENABLED"
			optimize "Debug"
			editandcontinue "On"
			
		filter { "configurations:DebugASAN" }
			targetsuffix "DebugASAN"
			defines "ASSERTS_ENABLED"
			optimize "Debug"
			editandcontinue "Off"	  -- incompatble with ASAN
			flags "NoIncrementalLink" -- incompatble with ASAN
			sanitize "Address"
			
		filter { "configurations:DebugOpt" }
			targetsuffix "DebugOpt"
			defines "ASSERTS_ENABLED"
			optimize "Full"
			editandcontinue "On"
			
		filter { "configurations:Release" }
			optimize "Full"
			
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
			"thirdparty/imgui/backends/imgui_impl_dx11.cpp",
			"thirdparty/imgui/backends/imgui_impl_dx11.h",
			"thirdparty/imgui/backends/imgui_impl_win32.cpp",
			"thirdparty/imgui/backends/imgui_impl_win32.h",
			"thirdparty/Str/**.h",
			"thirdparty/Str/**.cpp",
			"thirdparty/Str/**.natvis",
			"thirdparty/icons/**.h",
		}
		
		includedirs 
		{
			"src",
			"thirdparty",
			"thirdparty/imgui",
			"thirdparty/imgui/backends",
		}
		
		links
		{
			"D3D11.lib",
		}
