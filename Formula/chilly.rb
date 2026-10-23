# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.16/chilly_2.6.16_darwin_amd64.tar.gz"
      sha256 "4d76f4e807683c00906667c485a692b456dc127df7f89ab93bf0160b77016499"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.16/chilly_2.6.16_darwin_arm64.tar.gz"
      sha256 "e34cf95409ded8ac4959b0a7e5ad465d272b062de59519622b0a0f9f74885720"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.16/chilly_2.6.16_linux_amd64.tar.gz"
      sha256 "8faebf34890ea13a9467bad52448d608097d570d8b35f9a23c025b9e76408f3d"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.16/chilly_2.6.16_linux_arm64.tar.gz"
      sha256 "ea0b5c4ee7b7aa60554bdaa9b44651e54f708b11757cdf97acb6ed27971f7c52"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
