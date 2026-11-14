# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.8.0/chilly_2.8.0_darwin_amd64.tar.gz"
      sha256 "4236ab200c894469d9c6d02011e157a643c22597d5cf2dc876bafc28d1f43011"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.8.0/chilly_2.8.0_darwin_arm64.tar.gz"
      sha256 "c2ca6a4c8f08df7a59965d5251521784e1809510bd7358108e0a9e0a67db6583"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.8.0/chilly_2.8.0_linux_amd64.tar.gz"
      sha256 "5cea953e8f0526752ed100089f3ad4bebb6fbcfc6e58ea9b3bf5aa1bfa28058a"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.8.0/chilly_2.8.0_linux_arm64.tar.gz"
      sha256 "b9be825849c9255c5e6fc7f05e176964c97538184085726a84b190b79d702435"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
