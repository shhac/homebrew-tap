class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.19.0/g2g-darwin-arm64.tar.gz"
      sha256 "36d28953feab8ca90cb521162daaa3142da22919d7847033f2f3c4247efc23d2"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.19.0/g2g-darwin-amd64.tar.gz"
      sha256 "6dc6c600215e30121c3d3a0430e0ed0fd56a4db45516cc7a40dffa64ae92cc30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.19.0/g2g-linux-arm64.tar.gz"
      sha256 "748d3ff59f55be47e5f5dcff5cf18d2261c5367c920e3e787a4c82f8a971543e"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.19.0/g2g-linux-amd64.tar.gz"
      sha256 "d4dce7a7181e81217ee68a847eadaff3db28072f44092ef5948d19f7112f9c24"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.19.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
