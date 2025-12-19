project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/**.h",
        "src/**.c"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "Off"

        links { "gdi32" }

        defines
        {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter { "configurations:Debug" }
        runtime "Debug"

    filter { "configurations:Release" }
        runtime "Release"

    filter { "configurations:Dist" }
        runtime "Release"