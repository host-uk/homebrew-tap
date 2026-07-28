# typed: strict
# frozen_string_literal: true

# Pinned by hand rather than generated. go-build can write tap formulae, and
# would overwrite this one; core is the binary that runs go-build, so it is the
# one formula worth keeping out of that loop.
class Core < Formula
  desc "Developer CLI for CoreGO — build, lint, QA and packaging"
  homepage "https://github.com/dAppCore/cli"
  version "0.12.5"
  license "EUPL-1.2"

  # Release assets are zips holding the binary under its own name, so there is
  # nothing to rename on install.
  on_macos do
    on_arm do
      url "https://github.com/dAppCore/cli/releases/download/v#{version}/core-darwin-arm64.zip"
      sha256 "ab2d973886d30d1bc9da7cd6d78a5fcd03d18f416c39ac55ce46c91a0445687d"
    end
    # No on_intel branch: the release matrix runs macos-latest, which is Apple
    # silicon, so no darwin/amd64 asset is published. Homebrew reports "no
    # available formula" on an Intel Mac, which is the truth — better than a
    # url pointing at a 404.
  end

  on_linux do
    on_intel do
      url "https://github.com/dAppCore/cli/releases/download/v#{version}/core-linux-amd64.zip"
      sha256 "efe4c83fc6e6d0943f9a7d6b54d65b32216708bfab28323b3e518ed76883506b"
    end
    # linux/arm64 is likewise unpublished. Debian users have the .deb; that is
    # amd64 only for the same reason.
  end

  def install
    bin.install "core"
  end

  test do
    # The version, not just the exit code: a stamp aimed at a symbol that does
    # not exist is discarded silently, which is how v0.12.3 shipped reporting
    # 0.0.0 with everything green.
    assert_match "core v#{version}", shell_output("#{bin}/core --help")

    # The surfaces are the reason to install it. core composes
    # dappco.re/go/build and dappco.re/go/lint; if those did not register, the
    # binary is present and the tooling is not.
    catalog = shell_output("#{bin}/core --help")
    assert_match(/^\s+build\s/, catalog)
    assert_match(/^\s+go qa\s/, catalog)
  end
end
