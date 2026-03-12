class Wifictl < Formula
  desc "Manage macOS network service IP and DNS settings"
  homepage "https://github.com/aruis/wifictl"
  version "1.26.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aruis/wifictl/releases/download/v1.26.6/wifictl_v1.26.6_Darwin_arm64.tar.gz"
      sha256 "3a11cc151dffb06e7da9bc60c08242a3e362aab17471d3a5d9d9c14d32915f04"
    end

    if Hardware::CPU.intel?
      url "https://github.com/aruis/wifictl/releases/download/v1.26.6/wifictl_v1.26.6_Darwin_x86_64.tar.gz"
      sha256 "1a7c87350bdea813a3c5e89087532ded60b0bbda5fd3054960d01ca0c5c21327"
    end
  end

  def install
    bin.install Dir["*/wifictl"].fetch(0)
  end

  test do
    output = shell_output("#{bin}/wifictl version")
    assert_match version.to_s, output
  end
end
