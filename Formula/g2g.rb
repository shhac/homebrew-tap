class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.15.0/g2g-darwin-arm64.tar.gz"
      sha256 "d1348ebd1e24c5020d5a00220bd32f65e2993fb59fdd06845d2a52a8b11dda99"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.15.0/g2g-darwin-amd64.tar.gz"
      sha256 "32e1c9a59df5a4b572681ffc448f9d71edc4b8ec49dfb6961cb6765de3aaddac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.15.0/g2g-linux-arm64.tar.gz"
      sha256 "184cdb6364ebe8da23db15a3402f435af98dc50f08c6f73fbc106f313ade8300"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.15.0/g2g-linux-amd64.tar.gz"
      sha256 "0186a9a221770b0acebaf3b6dd563295cb4da62cb889c61326cc6c284374159b"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
