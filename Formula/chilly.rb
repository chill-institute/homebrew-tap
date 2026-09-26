# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.9/chilly_2.6.9_darwin_amd64.tar.gz"
      sha256 "8da77f3095f31d8647149dab7af62ba81533ae553cb19d57180d839f1d26e5b2"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.9/chilly_2.6.9_darwin_arm64.tar.gz"
      sha256 "5de2a1adbc5c0b7ed631cd0b37784486c47a6a82c70a42f47837e115547f20f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.9/chilly_2.6.9_linux_amd64.tar.gz"
      sha256 "f6baaa36f53196ac0dd623d1a9b26554d9015aec987762eb6697f5c7a71dd75b"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.9/chilly_2.6.9_linux_arm64.tar.gz"
      sha256 "8898e4d9d57be90afbec8d7ea4b44ec4ad1519aad0a3636c881c08f49aaaf81b"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
