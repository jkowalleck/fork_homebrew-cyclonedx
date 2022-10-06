class CyclonedxCli < Formula
  desc "CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions."
  homepage "https://cyclonedx.org"
  version "0.24.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.1/cyclonedx-osx-x64", :using => :nounzip
      sha256 "60e172eafb49fef36eea29153d42d10990e90631aa92516eb6e80408dccd2362"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.1/cyclonedx-osx-arm64"
      sha256 "7e17f81c95cfa978c798079ec70033be1ca6d600b1d38eb0b87bf74b96672353"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.1/cyclonedx-linux-arm64", :using => :nounzip
      sha256 "810f99f43750c42ad3607dac5cdbcfe9be1ba2624e9c7bace1d4541ef9741691"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.1/cyclonedx-linux-arm", :using => :nounzip
      sha256 "1678322302c36bfb920305e82e62872dd3e47850185ee73ada955a223676d8ed"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.1/cyclonedx-linux-x64", :using => :nounzip
      sha256 "ad736b1443aa6527fc8bffdca1f632414908d21a631f33c60f439f6942a47d3c"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system "#{bin}/cyclonedx" "--version"
  end
end
