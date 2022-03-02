class CyclonedxGomod < Formula
  desc "Creates CycloneDX Software Bill of Materials (SBOM) from Go modules."
  homepage "https://cyclonedx.org"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.2.0/cyclonedx-gomod_1.2.0_darwin_amd64.tar.gz"
      sha256 "73d556a3f0830fae35e8b08fc95d86e65a5238b21085b672768dbc04315e8d2d"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.2.0/cyclonedx-gomod_1.2.0_darwin_arm64.tar.gz"
      sha256 "05574378fa33a4f64a1e4e93bcf4d75e8801bbde0e7fbad8e48efa1b7f639b8f"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.2.0/cyclonedx-gomod_1.2.0_linux_arm64.tar.gz"
      sha256 "dcdd2fde4132fa57809b6cfa122a86649bb530a08382545ac55c8184918b906c"

      def install
        bin.install "cyclonedx-gomod"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CycloneDX/cyclonedx-gomod/releases/download/v1.2.0/cyclonedx-gomod_1.2.0_linux_amd64.tar.gz"
      sha256 "91f21599d3615dc35856d093604440252665f64069a994e7156d7cebb10c184c"

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
