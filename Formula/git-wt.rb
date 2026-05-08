class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.2/git-wt-darwin-arm64.tar.gz"
      sha256 "07576049b77fb9a80bef1384f38ed62939451b2cd1771ee6007c1e1f5ed9a66a"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.2/git-wt-darwin-amd64.tar.gz"
      sha256 "55cd5667bf51e955d3d08aa801caae15f779d94d402cbf26d2cfd4448f8c0ebe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.2/git-wt-linux-arm64.tar.gz"
      sha256 "a42391a0a0ceeb74f47554bad68b054e194fa760ef332b0648560a76d09de901"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.7.2/git-wt-linux-amd64.tar.gz"
      sha256 "537f0d139d8c0544e6b0e5d61f85a17cdd9784b09ea564b2bc08cb399510e132"
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
    assert_match "git-wt version 0.7.2", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
  end
end
