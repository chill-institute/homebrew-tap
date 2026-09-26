# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.11/chilly_2.6.11_darwin_amd64.tar.gz"
      sha256 "a048116f5678dfc3d4ac1976cd27bd2cd8ff8db6cf44f607c1d5b8103f20f5de"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.11/chilly_2.6.11_darwin_arm64.tar.gz"
      sha256 "2521fb67ec7f9873d9f6baeead0b526a09d76b7dcf1691a19c7c4ab0bd2c5c27"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.11/chilly_2.6.11_linux_amd64.tar.gz"
      sha256 "ef52d1d388ce4dd0761362b4ed1456e3a4df1d45995ac8847b3f989f1a8b30c0"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.11/chilly_2.6.11_linux_arm64.tar.gz"
      sha256 "6a674b838b945f3878f41143977db774d708cbb6cd90530ffc0b2f7d0afc45a9"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
