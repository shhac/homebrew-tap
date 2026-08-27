class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.1/git-wt-darwin-arm64.tar.gz"
      sha256 "3cc8691029352ba22114adccf60da47e7488fcbf25ba662109c4185d7bff9a2c"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.1/git-wt-darwin-amd64.tar.gz"
      sha256 "5e3ceb2657e147738204b1dbe3146306a7fb0045570eee07f806b317ac97dba3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.1/git-wt-linux-arm64.tar.gz"
      sha256 "a97f92b47805562789eaa19b2b3de0192a27c87782d0510fda9273b3b6591ac2"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.14.1/git-wt-linux-amd64.tar.gz"
      sha256 "f354210a16c1a992cbf7427de701d0b9be1fca44c0f9e7b659125baf4ad35428"
    end
  end

  def install
    bin.install "git-wt"
    # Installs shell completions via `git-wt completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"git-wt", "completion")
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
    assert_match "#compdef git-wt", shell_output("#{bin}/git-wt completion zsh")
  end
end
