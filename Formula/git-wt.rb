class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.11.0/git-wt-darwin-arm64.tar.gz"
      sha256 "4852aa019da078768d5cdb4dd107bee61ed5ba607cfe078d1b947f2f3ef19c93"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.11.0/git-wt-darwin-amd64.tar.gz"
      sha256 "b78ea8abc553409bdb189e61cc2cccda32bc39d418d6263a18f95a779c14036b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.11.0/git-wt-linux-arm64.tar.gz"
      sha256 "ca6ba487990d91840552983186646cc5d0bf9cac60a656958355ab2a417fd775"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.11.0/git-wt-linux-amd64.tar.gz"
      sha256 "ffbbe65a917e887fecf76a9225ac3800f4a3a6fe94c2da645f8bc93cd6a95d99"
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
    assert_match "git-wt version 0.11.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
