class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.13.1/git-wt-darwin-arm64.tar.gz"
      sha256 "8666a0104140618c27e51377fb60262db9beea9058e675a3e837084d2b7d5939"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.13.1/git-wt-darwin-amd64.tar.gz"
      sha256 "962cf4d0419087d28cdeb89461540b65d714a3cdc7d082f9b13fef62faa66f9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.13.1/git-wt-linux-arm64.tar.gz"
      sha256 "ec796e9b729e664e7908660e4b0d6576c213b9e4ffeaf4afb4b579cc06a6bb3e"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.13.1/git-wt-linux-amd64.tar.gz"
      sha256 "ce526037fb23f5332cdb6640a36b01609e80f1a2ba466fd317c0acab1fb9df98"
    end
  end

  def install
    bin.install "git-wt"
    # Installs shell completions via `git-wt completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"git-wt", "completion")
  end

  test do
    assert_match "0.13.1", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
    assert_match "#compdef git-wt", shell_output("#{bin}/git-wt completion zsh")
  end
end
