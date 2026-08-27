class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.29.0/g2g-darwin-arm64.tar.gz"
      sha256 "477b68c7b09e462eed1ee6cf3068ac27ced8b7042d390dc8fcf63d1a54b80f6b"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.29.0/g2g-darwin-amd64.tar.gz"
      sha256 "1b1e562c1a2542da82b9170ec51e820de16b5be153d50d94a82f691f55943b0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.29.0/g2g-linux-arm64.tar.gz"
      sha256 "be1c0f05b4832243c9802c162903a5a56104f84ad3234284c43191e13e8e7a35"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.29.0/g2g-linux-amd64.tar.gz"
      sha256 "702b9d4855b51115f850a8851f977620873fd377077801cf3f83b036175c9e33"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.29.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
