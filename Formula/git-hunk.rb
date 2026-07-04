class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.16.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "be05b3fda99309c9692af771632033d218c2c5b31266ad7679e68ea92d5ec55b"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.16.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "7da75f1b490506046f69a356c688892b1a3d432f18f10912a78a88774cfb6c47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.16.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "e132be2da2b33c2adde4a321bc1e0bec2952f89d6de03c38b0923430b14cfbb9"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.16.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "fc1ef58cb53ff1285c51123caeba38dfe2a82fc395c7d898ef842c105007dcee"
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
    assert_match "git-hunk 0.16.0", shell_output("#{bin}/git-hunk --version")
  end
end
