class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.0/git-wt-darwin-arm64.tar.gz"
      sha256 "517080cb77ebde66f9f993a559731fe58a7648cf790d1ece4eac09befe01cf17"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.0/git-wt-darwin-amd64.tar.gz"
      sha256 "240d8423a89f83c722318b40ec5ffd1840a8c8b46c175469c31a759426961795"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.0/git-wt-linux-arm64.tar.gz"
      sha256 "253e09cbef53e8f0d44909f49848dd974ebfb74072935b2eeb8e4941dd5e730e"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.0/git-wt-linux-amd64.tar.gz"
      sha256 "4383d413a5b5e90cfef4ed8a8c87dcc392fc6a4be8e8c2976d3b6dcde0b33e6f"
    end
  end

  def install
    bin.install "git-wt"
    # Installs shell completions via `git-wt completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"git-wt", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
    assert_match "#compdef git-wt", shell_output("#{bin}/git-wt completion zsh")
  end
end
