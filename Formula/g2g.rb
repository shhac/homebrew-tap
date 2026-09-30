class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.39.0/g2g-darwin-arm64.tar.gz"
      sha256 "88c92044d23b6e642cd1a98d03980a33b23d26aeb2ecf27ae3000bfa8408617d"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.39.0/g2g-darwin-amd64.tar.gz"
      sha256 "6b323bd8e8480f064844fb7fe5af298c8db9d3b6568d76be11ef7d7744ff402f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.39.0/g2g-linux-arm64.tar.gz"
      sha256 "40e8117157762b48822636734f38f1d5ba0b494c7581656b0c4d65d8c329aafb"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.39.0/g2g-linux-amd64.tar.gz"
      sha256 "efc40fe70fd5aedf69c902044c8b4bf604d7ba7ca61114af6d8dc6ff753c1cdb"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.39.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
