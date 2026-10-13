# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.14/chilly_2.6.14_darwin_amd64.tar.gz"
      sha256 "aa21f82d2e1d5ba5ddf230192f0c4e9178b33eb6a92474d19f558120a13ba979"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.14/chilly_2.6.14_darwin_arm64.tar.gz"
      sha256 "dc797dcd951ee9242c4010784b742ba815f67495eee82464d3514864b87acf7e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.14/chilly_2.6.14_linux_amd64.tar.gz"
      sha256 "25fd20ca04b4813233b16a0647b235545c8764c5718f1a6c8bff0b8e0a61ae15"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.14/chilly_2.6.14_linux_arm64.tar.gz"
      sha256 "95f6ca024ca2849d25bc269f789f4c0907b83ee0f1374bfb9dd5f0d32ea475b1"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
