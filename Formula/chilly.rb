# typed: false
# frozen_string_literal: true

class Chilly < Formula
  desc "Search chill.institute and send transfers from the terminal"
  homepage "https://chill.institute"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.13/chilly_2.6.13_darwin_amd64.tar.gz"
      sha256 "bae2d408d40c6260e1c9655e8fc3f374211ff781cf44bbb34a2e3e89272672b0"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.13/chilly_2.6.13_darwin_arm64.tar.gz"
      sha256 "752e2bfbc87fd78aafc7d29d5ded501f0c0fa898c3c957d750d7af12150c3722"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.13/chilly_2.6.13_linux_amd64.tar.gz"
      sha256 "460a744cdaa407fba30549788bdba295b05b0dd5ae6e38486ebd849d7bd19160"
    end
    on_arm do
      url "https://github.com/chill-institute/chill-cli/releases/download/v2.6.13/chilly_2.6.13_linux_arm64.tar.gz"
      sha256 "72ed40f7dd76dd9e293d134cf68889777d133d4b017d68700290ac5d91743b02"
    end
  end

  def install
    bin.install "chilly"
  end

  test do
    system bin/"chilly", "version", "--output", "json"
  end
end
