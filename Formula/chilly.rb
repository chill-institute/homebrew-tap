# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.7.0/chilly_2.7.0_darwin_amd64.tar.gz"
      sha256 "e3c65f8736dbdf8ba70f13b06e62c5d8ff03418afedbd0d553f24ad9483b625c"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.7.0/chilly_2.7.0_darwin_arm64.tar.gz"
      sha256 "d0764e4331ad9ca16d4fa6ee76dbc0101a0880ccf88e187221fe28d54d139fee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.7.0/chilly_2.7.0_linux_amd64.tar.gz"
      sha256 "edc8f55952e23a86300ca666d146c6d7c4b0fad18f2500b598cb8c4766564b0c"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.7.0/chilly_2.7.0_linux_arm64.tar.gz"
      sha256 "4ddc6a9f6d0497749ca2667eaac4b56912a57a9668706de59b42ed9e8032667c"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
