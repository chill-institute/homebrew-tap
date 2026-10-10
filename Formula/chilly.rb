# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.12/chilly_2.6.12_darwin_amd64.tar.gz"
      sha256 "ec8efd71e399a7667d1053b4d3d0c3708aa6835c27565a7467f7cbdf9ec90779"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.12/chilly_2.6.12_darwin_arm64.tar.gz"
      sha256 "543982195e0cef817319eda4e89beafa376837a7827b7c3631e8f32f68c3a199"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.12/chilly_2.6.12_linux_amd64.tar.gz"
      sha256 "da6a825e9e6ac9a71c61b499c67329606992d52e8d077a6146d2ca29012cecd6"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.12/chilly_2.6.12_linux_arm64.tar.gz"
      sha256 "1c55e464c1fc7a396c1c85119b8d75b2015ef9614742aec28893d3f8e122bb0c"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
