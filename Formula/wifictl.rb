class Wifictl < Formula
  desc "Manage macOS network service IP and DNS settings"
  homepage "https://github.com/aruis/wifictl"
  version "1.26.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aruis/wifictl/releases/download/v1.26.1/wifictl_v1.26.1_Darwin_arm64.tar.gz"
      sha256 "deb62dcd157a8e54aacd1a39d25ffe54e1ba5729176fb41355cf2b9daf90cfa6"
    end

    if Hardware::CPU.intel?
      url "https://github.com/aruis/wifictl/releases/download/v1.26.1/wifictl_v1.26.1_Darwin_x86_64.tar.gz"
      sha256 "6f6d50c1208cb660361cb865fbb2d2c1b88d24b7a180f64efe73050fd3a48beb"
    end
  end

  def install
    bin.install "wifictl"
  end

  test do
    output = shell_output("#{bin}/wifictl --help")
    assert_match "wifictl", output
  end
end
