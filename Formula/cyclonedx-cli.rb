class CyclonedxCli < Formula
  desc "CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions."
  homepage "https://cyclonedx.org"
  version "0.24.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.0/cyclonedx-osx-x64", :using => :nounzip
      sha256 "f27e1cf8251417eb34e838ee79e1c0ebf297587b9630ba747798ab19beb1a59d"

      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.0/cyclonedx-osx-arm64"
      sha256 "2e1cb1dc9142fc8e779b854d8b4d1c3f6d92c58158476843842c9f557269cafb"

      def install
        bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.0/cyclonedx-linux-arm64", :using => :nounzip
      sha256 "6f0148d71890ef63095b1fa5e539eefa28326bada7cda24c5082fb306969ecbe"

      def install
        bin.install "cyclonedx-linux-arm64" => "cyclonedx"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.0/cyclonedx-linux-arm", :using => :nounzip
      sha256 "7722469f799e4b66ea94ce9e47091c2e005edade8454769a9333f35bd8bcba11"

      def install
        bin.install "cyclonedx-linux-arm" => "cyclonedx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.0/cyclonedx-linux-x64", :using => :nounzip
      sha256 "691cf7ed82ecce1f85e6d21bccd1ed2d7968e40eb6be7504b392c8b3a0943891"

      def install
        bin.install "cyclonedx-linux-x64" => "cyclonedx"
      end
    end
  end

  test do
    system "#{bin}/cyclonedx" "--version"
  end
end
