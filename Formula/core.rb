# typed: false
# frozen_string_literal: true

class Core < Formula
  desc "Host UK development CLI"
  homepage "https://github.com/host-uk/core"
  version "0.0.4-alpha.19"
  license "EUPL-1.2"

  on_macos do
    url "https://github.com/host-uk/core/releases/download/v0.0.4-alpha.19/core-darwin-arm64.tar.gz"
    sha256 "PLACEHOLDER"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/host-uk/core/releases/download/v0.0.4-alpha.19/core-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/host-uk/core/releases/download/v0.0.4-alpha.19/core-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "core"
  end

  test do
    system "#{bin}/core", "--version"
  end
end