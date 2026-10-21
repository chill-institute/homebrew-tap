# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.15/chilly_2.6.15_darwin_amd64.tar.gz"
      sha256 "6f50e6a829f176d5a35cf767dce051fc7ad7366e47dc06d9cae858f511b9b82a"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.15/chilly_2.6.15_darwin_arm64.tar.gz"
      sha256 "4a2f066d089adc77dc342949ce92fe4e7f4657ee1f1ff6679b43bf75936eed07"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.15/chilly_2.6.15_linux_amd64.tar.gz"
      sha256 "9e4413216a5a89d46a2f67e1c05183a6f9381106260777404169d58a14af315c"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.15/chilly_2.6.15_linux_arm64.tar.gz"
      sha256 "7663014d0d863dc526ad88fe5ff698c376cf6f780bb52833d97e6cc3b585b4c3"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
