from conan import ConanFile
from conan.tools.cmake import CMakeToolchain


class CompressorRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"

    def requirements(self):
        self.requires("gtest/1.11.0")
        self.requires("spdlog/1.15.3")

    def generate(self):
        tc = CMakeToolchain(self,generator="Ninja")
        tc.user_presets_path = False
        tc.generate()
