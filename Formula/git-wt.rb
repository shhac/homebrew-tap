class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.2/git-wt-darwin-arm64.tar.gz"
      sha256 "52b1dae3817e409415bb8c1b955637f11a62f3f28ff3f3c7fbefa62e4f0c0e8a"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.2/git-wt-darwin-amd64.tar.gz"
      sha256 "1c0a8deb5c148bf9e09646efcfd74dcbc234170f0ff7d929c56825c7f658b192"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.2/git-wt-linux-arm64.tar.gz"
      sha256 "b983aab2d81b2110d53a1cb8093a57bccc6d6e08e170b82ba0ec9094412be55c"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.2/git-wt-linux-amd64.tar.gz"
      sha256 "4b41cf50a1b3d2b8fe770bb8ada6476b6d5f4f9dcad155051679d86fdf3c1126"
    end
  end

  def install
    bin.install "git-wt"
    # Installs shell completions via `git-wt completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"git-wt", "completion")
  end

  test do
    assert_match "0.14.2", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
    assert_match "#compdef git-wt", shell_output("#{bin}/git-wt completion zsh")
  end
end
