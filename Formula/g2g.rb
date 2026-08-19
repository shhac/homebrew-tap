class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.18.0/g2g-darwin-arm64.tar.gz"
      sha256 "4a3a75154ba8bfde199bfa9b89ff48eab9915083aed38aa6b6f9fc504f7f8c0b"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.18.0/g2g-darwin-amd64.tar.gz"
      sha256 "1b9906b1c8da518ccd3a7ebe78d97c19ced5c6048d399e43494ea01409ef2579"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.18.0/g2g-linux-arm64.tar.gz"
      sha256 "24a6f9e9ba1f0e85b7e74c229b888d5e2007bdb0f6c256fee4c38048f76d371b"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.18.0/g2g-linux-amd64.tar.gz"
      sha256 "d7add0e6a299af1a338a6b28a6a1f6ae5e8c01a79306846570e909ab2956f024"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
