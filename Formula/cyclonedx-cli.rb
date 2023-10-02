class CyclonedxCli < Formula
  desc "CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions."
  homepage "https://cyclonedx.org"
  version "0.25.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.0/cyclonedx-osx-x64", :using => :nounzip
      sha256 "83ba4871298db3123dbea23f425cf23316827abcdaded16824b925f1bc69446d"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.0/cyclonedx-osx-arm64"
      sha256 "826c21a2ad146e0542c22fa3bf31f4a744890d89052d597c4461ec6e2302ff2d"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.0/cyclonedx-linux-arm64", :using => :nounzip
      sha256 "eaac307ca4d7f3ee2a10e5fe898d7ff16c4b8054b10cc210abe6f6d703d17852"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.0/cyclonedx-linux-arm", :using => :nounzip
      sha256 "d094e59f74bca280e8b3521512fb99d0af5d8d0dcd85a78164fa12abaf405ec0"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.25.0/cyclonedx-linux-x64", :using => :nounzip
      sha256 "bd26ccba454cc9f12b6860136e1b14117b829a5f27e993607ff526262c5a7ff0"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system "#{bin}/cyclonedx" "--version"
  end
end
