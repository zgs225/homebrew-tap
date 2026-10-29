class Pi2d < Formula
  desc "Web console daemon for pi2.nvim"
  homepage "https://github.com/zgs225/pi2d"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgs225/pi2d/releases/download/v0.1.7/pi2d-0.1.7-darwin-arm64.tar.gz"
      sha256 "6a404dc5804e5c9139ee4cc3ce0ff90dea3e434b6ce789e184b034b73f1e85da"
    end
    on_intel do
      url "https://github.com/zgs225/pi2d/releases/download/v0.1.7/pi2d-0.1.7-darwin-x64.tar.gz"
      sha256 "be67c110620a40367231a6170d9091179d2c080faa0b2a0112817a72b2fd6ec9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgs225/pi2d/releases/download/v0.1.7/pi2d-0.1.7-linux-arm64.tar.gz"
      sha256 "f26cbf060373f28fcc14625122426fa847b6fef05357f8c45fbf370941fe27ea"
    end
    on_intel do
      url "https://github.com/zgs225/pi2d/releases/download/v0.1.7/pi2d-0.1.7-linux-x64.tar.gz"
      sha256 "381a0eef8996ecc97a851c48fa308a327db798b04b4f22647dd61c46f557c12c"
    end
  end

  def install
    bin.install "bin/pi2"
    (share/"pi2d").install "share/pi2d/web"
  end

  def caveats
    <<~EOS
      To run pi2d as a background service:
        pi2 install-service --write
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pi2 --version")
  end
end
