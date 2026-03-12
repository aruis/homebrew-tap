class Wifictl < Formula
  desc "Manage macOS network service IP and DNS settings"
  homepage "https://github.com/aruis/wifictl"
  version "1.26.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aruis/wifictl/releases/download/v1.26.3/wifictl_v1.26.3_Darwin_arm64.tar.gz"
      sha256 "dd49714318ed018ce8b5db1ef5464a4e2d2888b25223c484cea9a8e7b257a080"
    end

    if Hardware::CPU.intel?
      url "https://github.com/aruis/wifictl/releases/download/v1.26.3/wifictl_v1.26.3_Darwin_x86_64.tar.gz"
      sha256 "a09fc6a6ec58e70cf3b615d0cc3a5acec2ddb7791448972e2943becfc97d4030"
    end
  end

  def install
    bin.install "wifictl"
  end

  test do
    output = shell_output("#{bin}/wifictl version")
    assert_match version.to_s, output
  end
end
