solution "EmptyProject"
	
	platforms { "x64" }
	configurations { "Debug", "DebugASAN", "DebugOpt", "Release" }
	startproject "EmptyProject"

	project "EmptyProject"

		kind "WindowedApp"
		symbols "On"
		cppdialect "C++latest"
		exceptionhandling "Off"
		rtti "Off"
		dpiawareness "HighPerMonitor"
		flags
		{
			"MultiProcessorCompile",
			"FatalWarnings"
		}

		filter { "toolset:msc*" }
			buildoptions
			{
				"/utf-8" 
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
			editandcontinue "Off"	  -- incompatible with ASAN
			flags "NoIncrementalLink" -- incompatible with ASAN
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
			"thirdparty/Bedrock/Bedrock/*.h",
			"thirdparty/Bedrock/Bedrock/*.cpp",
			"thirdparty/Bedrock/Bedrock/*.natvis",
			"thirdparty/icons/**.h",
		}
		
		includedirs 
		{
			"src",
			"thirdparty",
			"thirdparty/Bedrock",
			"thirdparty/imgui",
			"thirdparty/imgui/backends",
		}
		
		links
		{
			"D3D11.lib",
		}
