# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.17/chilly_2.6.17_darwin_amd64.tar.gz"
      sha256 "58b49311a2e071201b3cd5627d3c7f648c211476f83f9984e6a249afe1e83d55"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.17/chilly_2.6.17_darwin_arm64.tar.gz"
      sha256 "5d8fb564b5ab1481485c7e1da44060d5037c0afd73075a4fd3c05143da985a01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.17/chilly_2.6.17_linux_amd64.tar.gz"
      sha256 "11109c537ae2c2bb5a0bbc95e543606402ca6c87a84febe19d25145a6e92a782"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.17/chilly_2.6.17_linux_arm64.tar.gz"
      sha256 "333e7bcba9a142112d9d168c8b54a7faa4d8150718cc12af3bd19420af0d5a3f"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
