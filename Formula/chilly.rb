# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.8/chilly_2.6.8_darwin_amd64.tar.gz"
      sha256 "af9c16300761efaae84215014debcecb23c965dcd5a3f03630ba7de19dc3e662"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.8/chilly_2.6.8_darwin_arm64.tar.gz"
      sha256 "bdafb3eb0f4ad3903851be8c7df09fdca8a4f90ae36228aa5f613f0ed5c386f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.8/chilly_2.6.8_linux_amd64.tar.gz"
      sha256 "62f78bd8ebbf6aa992a9a14e9b979d755f8dc0c23fc89de73fb5b11df3b7acab"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.8/chilly_2.6.8_linux_arm64.tar.gz"
      sha256 "d2f1fc7c6e3b0300dd789d86ba6ba9bb2ac027be20483149a8f9764928533ef0"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
