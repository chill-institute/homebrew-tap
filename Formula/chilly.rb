# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.10/chilly_2.6.10_darwin_amd64.tar.gz"
      sha256 "0211cffe3d2769da8bf78bbffd55cad675c665a7e424d37e0964fee8643f7dac"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.10/chilly_2.6.10_darwin_arm64.tar.gz"
      sha256 "5b252df06a404d11258919097c3324070be5863c9116c190d73341e7c2bccaef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.10/chilly_2.6.10_linux_amd64.tar.gz"
      sha256 "1450356df9349904a6dbf170eaa72b1bfdc3c50a544f06820da781af97708257"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.10/chilly_2.6.10_linux_arm64.tar.gz"
      sha256 "a19dcb90ed2e98091aebcd1d3c7aa36e7f1200b0b28f08babe6ab7f33d57c402"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
