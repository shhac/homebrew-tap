class GitWt < Formula
  desc "Fast CLI tool for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.5.0/git-wt-aarch64-macos.tar.gz"
      sha256 "9c1485d85273b796671481c573d2aa65fbbaa391194c484f4fefd7c8da6d775c"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.5.0/git-wt-x86_64-macos.tar.gz"
      sha256 "281f8cbb260b544005b25b5aad138ae51431e4fad4c411723a13c3e0bb09063b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.5.0/git-wt-aarch64-linux.tar.gz"
      sha256 "90b0981646954de3e960e519fe60f1e2463f92938e6041e42765b536e205cbc6"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.5.0/git-wt-x86_64-linux.tar.gz"
      sha256 "3fd7d781c5aafe4dcdaaf4e2c6cd2ba365b4ff7392b890021c28e81002cd16e2"
    end
  end

  def install
    bin.install "git-wt"
  end

  def caveats
    <<~EOS
      To enable shell integration for directory navigation, add to your shell config:

        # For zsh (~/.zshrc)
        eval "$(git-wt alias gwt)"

        # For bash (~/.bashrc)
        eval "$(git-wt alias gwt)"

      Then restart your shell or run: source ~/.zshrc (or ~/.bashrc)

      This creates the `gwt` alias for commands that change directories.
    EOS
  end

  test do
    assert_match "git-wt version 0.5.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
