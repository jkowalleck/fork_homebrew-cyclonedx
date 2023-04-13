class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules."
  homepage "https://cyclonedx.org"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.4.0/cyclonedx-gomod_1.4.0_darwin_amd64.tar.gz"
      sha256 "8c4dd35d6ff07b04a8610192519cc5e9b1c8c15452f0e2d546daf837bd546e4a"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.4.0/cyclonedx-gomod_1.4.0_darwin_arm64.tar.gz"
      sha256 "a98c1b95a3c2266f645b182ef3b2768ca21fa9b7f8184ac0179405889872dfe3"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.4.0/cyclonedx-gomod_1.4.0_linux_arm64.tar.gz"
      sha256 "c387ccc487f787fc47772bed1d0804d84d63e84dc0eb30ea4629401f3a97304b"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.4.0/cyclonedx-gomod_1.4.0_linux_amd64.tar.gz"
      sha256 "b80982b7903b63b00f8ee7703528a58560b90890cdaff46419430d6c57d18321"

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
