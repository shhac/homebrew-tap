class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.22.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "a339ec744b9ef20a6fc8baef4654c62279c466fd0c57e6e9a163e76e75d9ff07"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.22.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "d24b7d7dbf87b7cce244f2737226834d3dd6dd4a8227944d15141801cea813ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.22.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "2d1adcefc14249d7354a4b2e4e08afb6893e7024693e094b493a7eaf8a585598"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.22.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "ec522c31703a910fe551a36a443b2b7a01ffe029deedfcec232d9dfc22b85167"
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
    assert_match "git-hunk 0.22.0", shell_output("#{bin}/git-hunk --version")
  end
end
