# typed: false
# frozen_string_literal: true

class Core < Formula
  desc "Host UK development CLI"
  homepage "https://github.com/host-uk/core"
  version "0.0.4-alpha.21"
  license "EUPL-1.2"

  on_macos do
    url "https://github.com/host-uk/core/releases/download/v0.0.4-alpha.21/core-darwin-arm64.tar.gz"
    sha256 "0250c1e96a9845bc98869dd07269306774a2776e85c50ba9eadbf1ddecbda62e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/host-uk/core/releases/download/v0.0.4-alpha.21/core-linux-arm64.tar.gz"
      sha256 "129a515fcfadd1eac6bee61e32052f25a7f23ffa38d322328a78aa16e0ac2116"
    else
      url "https://github.com/host-uk/core/releases/download/v0.0.4-alpha.21/core-linux-amd64.tar.gz"
      sha256 "084167ddff6d3e3ff53889169c9ae545232d1ff2f6ee97902d350ff085ad1564"
    end
  end

  def install
    bin.install "core"
  end

  test do
    system "\#{bin}/core", "--version"
  end
end
