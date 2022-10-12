class CyclonedxCli < Formula
  desc "CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions."
  homepage "https://cyclonedx.org"
  version "0.24.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.2/cyclonedx-osx-x64", :using => :nounzip
      sha256 "567f11d59fcfb6c9462f6dc4556c3bc06938d06ad9bc99425cd301693ab57d70"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.2/cyclonedx-osx-arm64"
      sha256 "a1697e85b1aef616dfd0cf62283b50cd7cbe4edbcd638dddba0c2189bbf5cd7a"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.2/cyclonedx-linux-arm64", :using => :nounzip
      sha256 "e781d32266ec89cb2c477f27c399f022f420db2e2b595818087e1d5bccbff9d4"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.2/cyclonedx-linux-arm", :using => :nounzip
      sha256 "58fa5f25c7cb522ad6883da539de6213218208cd1263ff675291ebe6c6770165"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.2/cyclonedx-linux-x64", :using => :nounzip
      sha256 "ef0d3b31d176e02bc594f83e19cfcea053c6bc5b197351f71696e189390f851d"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system "#{bin}/cyclonedx" "--version"
  end
end
