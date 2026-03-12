class Wifictl < Formula
  desc "Manage macOS network service IP and DNS settings"
  homepage "https://github.com/aruis/wifictl"
  version "1.26.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aruis/wifictl/releases/download/v1.26.7/wifictl_v1.26.7_Darwin_arm64.tar.gz"
      sha256 "ef7dffb1075e498e0a8b7e1bd57d29e5a58a0ce9a7ca6de60b5846df5a00750e"
    end

    if Hardware::CPU.intel?
      url "https://github.com/aruis/wifictl/releases/download/v1.26.7/wifictl_v1.26.7_Darwin_x86_64.tar.gz"
      sha256 "cf068447613abe619af35f3f17f6d99a712317d1110e8e4b69043cd5756180b7"
    end
  end

  def install
    binary = ["wifictl", *Dir["*/wifictl"]].find { |path| File.file?(path) }
    raise "wifictl binary not found in extracted archive" if binary.nil?

    bin.install binary
  end

  test do
    output = shell_output("#{bin}/wifictl version")
    assert_match version.to_s, output
  end
end
