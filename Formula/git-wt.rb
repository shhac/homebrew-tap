class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.3/git-wt-darwin-arm64.tar.gz"
      sha256 "3a395ebccd1c26f6f70a211d20ccbf81f6f48dd2a1372140c01035c93a0f1183"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.3/git-wt-darwin-amd64.tar.gz"
      sha256 "b7762b8a2eaeac2940b6cd18741c9532000fe5c3a5d55e0c6320db23a7fa5079"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.3/git-wt-linux-arm64.tar.gz"
      sha256 "828daadd44a1c18b040eb66d284f5b3eb118be380ee166a47d7b60844c7e2510"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.8.3/git-wt-linux-amd64.tar.gz"
      sha256 "f93fea07e443ffbab6143614d4c383ebe536d127f8601f94e21eef9418bf4abc"
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
    assert_match "git-wt version 0.8.3", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
