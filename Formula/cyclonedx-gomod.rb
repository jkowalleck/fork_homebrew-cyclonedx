class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules."
  homepage "https://cyclonedx.org"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.7.0/cyclonedx-gomod_1.7.0_darwin_amd64.tar.gz"
      sha256 "942372cd1970530d3b5a6f1797d9d1ee5645ca36482d7484e88804e1709cdaa8"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.7.0/cyclonedx-gomod_1.7.0_darwin_arm64.tar.gz"
      sha256 "8931c16c3342c1b54507d7b3a589f3613c0f7407f8b607cc7c86325db1131d18"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.7.0/cyclonedx-gomod_1.7.0_linux_arm64.tar.gz"
      sha256 "71d6694d3b1ca18c4f3fd1dfa1af5c7bbcd3253ccf95ed9009bf88399c701c76"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.7.0/cyclonedx-gomod_1.7.0_linux_amd64.tar.gz"
      sha256 "aa8d0e7628cc7fefbbcb849b9b96e71d6828db1719ddadfc8796a38f244bfca3"

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
