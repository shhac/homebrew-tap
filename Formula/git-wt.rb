class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.0/git-wt-darwin-arm64.tar.gz"
      sha256 "7565bb481fcde3935a9f65bb63ef6ef1df72b6b99ef2fcd6bc06fbb844a46efb"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.0/git-wt-darwin-amd64.tar.gz"
      sha256 "2695d7fab87f67976f0757b2e212df67ae9cd693aacb9e3beeec7e735b0984ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.0/git-wt-linux-arm64.tar.gz"
      sha256 "b5d1425f2664232d8a618da026240c8ed1a1910044609b3a03798a370527f6a5"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.0/git-wt-linux-amd64.tar.gz"
      sha256 "7893cf442719c431f6069a9ffc8eb9494c5f570bd7f1ec82bee7a4f6bbb6740e"
    end
  end

  def install
    bin.install "git-wt"
  end

  def caveats
    <<~EOS
      Enable shell integration so `gwt go` / `gwt new` change directory:

        # zsh (~/.zshrc) or bash (~/.bashrc)
        eval "$(git-wt alias gwt)"

      Then restart your shell or `source` your rc file.

      Without the alias the binary still works in scripts:
        cd "$(git-wt go feature-branch)"
    EOS
  end

  test do
    assert_match "git-wt version 0.7.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
