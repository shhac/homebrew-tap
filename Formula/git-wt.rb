class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.15.0/git-wt-darwin-arm64.tar.gz"
      sha256 "3fd40b558353a840607ce68796be15bafb52e8191ae77f696a7726aa61c4e7e1"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.15.0/git-wt-darwin-amd64.tar.gz"
      sha256 "0a2120cd21788698726d8ea8a26448071c2ea5a56e5e2df54a2d1b8598749ddf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.15.0/git-wt-linux-arm64.tar.gz"
      sha256 "92543024f1bb9187194ed25ebb13c3bff9c866a291b32012a316510a76d6dee9"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.15.0/git-wt-linux-amd64.tar.gz"
      sha256 "863032b853907aa16f731d5bdc7f3f896be8641296b38d1d969615bbfa8983dd"
    end
  end

  def install
    bin.install "git-wt"
    # Installs shell completions via `git-wt completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"git-wt", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
    assert_match "#compdef git-wt", shell_output("#{bin}/git-wt completion zsh")
  end
end
