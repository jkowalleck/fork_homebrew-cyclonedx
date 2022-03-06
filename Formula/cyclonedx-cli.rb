class CyclonedxCli < Formula
  desc "CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions."
  homepage "https://cyclonedx.org"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.23.0/cyclonedx-osx-x64", :using => :nounzip
      sha256 "61270a28f1547eef94a166998ac2e5645bdb2c67ad74f89817b13469238842e5"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.23.0/cyclonedx-osx-arm64"
      sha256 "161807e7acf6a165ec57f4008e7d0093ddf45436f63989269f899136cf45f496"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.23.0/cyclonedx-linux-arm64", :using => :nounzip
      sha256 "70e727a9822de3db5f9ffb3fc67150a0ce200e376137014f3700f5d9389f5cc0"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.23.0/cyclonedx-linux-arm", :using => :nounzip
      sha256 "9b5e45c0ff37fdd10767f1996323e15f10fef5bad941fb4bbd92a38ba134e72f"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.23.0/cyclonedx-linux-x64", :using => :nounzip
      sha256 "895947cc3bb46c938b911f31c383938da3eb02e7da61167f35c98c59a8ede5e5"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system "#{bin}/cyclonedx" "--version"
  end
end
