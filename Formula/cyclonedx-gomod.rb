class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules."
  homepage "https://cyclonedx.org"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.3.0/cyclonedx-gomod_1.3.0_darwin_amd64.tar.gz"
      sha256 "761d148626ac5fa88813e36ec3ff7fb092711d4bce160c609a33d56c0f2386bb"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.3.0/cyclonedx-gomod_1.3.0_darwin_arm64.tar.gz"
      sha256 "fd3b073fb9a41308ca10f984473ff5c60b45146f0c1d75805d85b5e6faa1bc7c"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.3.0/cyclonedx-gomod_1.3.0_linux_arm64.tar.gz"
      sha256 "92233644d11e1c54888e3b77414aa2926729eb7d0acf70ce87ab16df56beb087"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.3.0/cyclonedx-gomod_1.3.0_linux_amd64.tar.gz"
      sha256 "4099ea5446aa59f6745d45ed0a1e4d2dcda6b1ad0e56d00b7489cac78a12492a"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  depends_on "go" => :optional
  depends_on "git" => :optional

  test do
    system "#{bin}/cyclonedx-gomod" "version"
  end
end
