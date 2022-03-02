class CyclonedxCli < Formula
    desc "CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions."
    homepage "https://cyclonedx.org"
    version "0.22.0"
    license "Apache-2.0"
  
    on_macos do
      url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.22.0/cyclonedx-osx-x64", :using => :nounzip
      sha256 "70d35b6077549f87a67057f428afd37586c67b8e480043e47e53685133fb974e"
  
      def install
        bin.install "cyclonedx-osx-x64" => "cyclonedx"
      end
      
      # if Hardware::CPU.intel?
      #   url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.22.0/cyclonedx-osx-x64", :using => :nounzip
      #   sha256 "70d35b6077549f87a67057f428afd37586c67b8e480043e47e53685133fb974e"
  
      #   def install
      #     bin.install "cyclonedx-osx-x64" => "cyclonedx"
      #   end
      # end
      # if Hardware::CPU.arm?
      #   url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.22.0/cyclonedx-osx-arm64"
      #   sha256 "70d35b6077549f87a67057f428afd37586c67b8e480043e47e53685133fb974e"
  
      #   def install
      #     bin.install "cyclonedx-osx-arm64" => "cyclonedx"
      #   end
      # end
    end
  
    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.22.0/cyclonedx-linux-arm64", :using => :nounzip
        sha256 "d17b3ed1a03c75960dfa15572ca8b239f27b9d7a7dd342a0069a41f34b927242"
  
        def install
          bin.install "cyclonedx-linux-arm64" => "cyclonedx"
        end
      end
      if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
        url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.22.0/cyclonedx-linux-arm", :using => :nounzip
        sha256 "a6d2c0e4540c09eddc71eee560aadbd10e924f3a7cf1ed966b8e25a631d0680e"
  
        def install
          bin.install "cyclonedx-linux-arm" => "cyclonedx"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.22.0/cyclonedx-linux-x64", :using => :nounzip
        sha256 "ae39404a9dc8b2e7be0a9559781ee9fe3492201d2629de139d702fd4535ffdd6"
  
        def install
          bin.install "cyclonedx-linux-x64" => "cyclonedx"
        end
      end
    end
  
    test do
      system "#{bin}/cyclonedx" "--version"
    end
  end