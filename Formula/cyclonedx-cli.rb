class CyclonedxCli < Formula
  desc "CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions."
  homepage "https://cyclonedx.org"
  version "0.25.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.1/cyclonedx-osx-x64", :using => :nounzip
      sha256 "4b47bd00b3526ed6049f04d3009abf5b103a8f24c002652022255444988bea39"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.1/cyclonedx-osx-arm64"
      sha256 "77c1bb26bd45dc0c26d013ac6769c755f7154c69f23b520bf7b83df5aee99492"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.1/cyclonedx-linux-arm64", :using => :nounzip
      sha256 "2086abf3182237d4349ae580ad27bd4f2f57bd0e8457cc92770cf35bd1c829df"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.1/cyclonedx-linux-arm", :using => :nounzip
      sha256 "27c1c1176daa9c9c7df354a684504d329309d2bdd23d69831355cd4d443b2fa1"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.1/cyclonedx-linux-x64", :using => :nounzip
      sha256 "f7f17434b6448d735f9fd91d6f72a1364c233f78a1587941cc26e9ecf33806e7"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system "#{bin}/cyclonedx" "--version"
  end
end
