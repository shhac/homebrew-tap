class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.21.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "c79d3aa87c4f6060943144239cbdf3afc5414b93ec9b2e1213716a8d37657417"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.21.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "c6c5e54095eacb5e35cbcfd67d5ac75d85d3a3ccee0c6464a1d1ee8c11c346de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.21.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "86463f4a46d99b5b3ab9367515a94d8a51ce9dbe576441a2ab0ce80c02871079"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.21.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "7e75e9897cc52e93615dc7cf3390a5f1fd1a218544cecc14dae52a8444c01ed5"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
    if File.directory? "completions"
      bash_completion.install "completions/git-hunk.bash" => "git-hunk"
      zsh_completion.install "completions/_git-hunk", "completions/_git_hunk"
      fish_completion.install "completions/git-hunk.fish"
    end
  end

  test do
    assert_match "git-hunk 0.21.1", shell_output("#{bin}/git-hunk --version")
  end
end
