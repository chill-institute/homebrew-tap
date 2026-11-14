# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.8.1/chilly_2.8.1_darwin_amd64.tar.gz"
      sha256 "37512e3836b72ba2768b4d4e34cededeb09891ff95b9c03be928b1c8b29d7535"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.8.1/chilly_2.8.1_darwin_arm64.tar.gz"
      sha256 "cf49b4fe625ba36098f21b9acb3d35d639455e3d6f600e45ac04a1d052032b91"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.8.1/chilly_2.8.1_linux_amd64.tar.gz"
      sha256 "9bd4ab3af7e0d54557e2f613103c00ec55b363528feed3a2bb783e4b524f2399"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.8.1/chilly_2.8.1_linux_arm64.tar.gz"
      sha256 "7b5595e156b01cccb180fccc799cf4fbca91b6dbf8493554874e6b7d49a1fbe9"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
