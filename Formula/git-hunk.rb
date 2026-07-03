class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.2/git-hunk-aarch64-macos.tar.gz"
      sha256 "4641dd655853e128580697392ece10172e6e769467c45eb51c95c7388fd564b7"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.2/git-hunk-x86_64-macos.tar.gz"
      sha256 "5defd574b5bcfc59ceba60e4be2a9663727ba349b2eca57038bf484a1ae441ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.2/git-hunk-aarch64-linux.tar.gz"
      sha256 "891023551ffffc99cde7b94d9d51a0ef5c24b9a32b300f37a1ed44663aba10d5"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.2/git-hunk-x86_64-linux.tar.gz"
      sha256 "29c23a4780c0025d03941b6125632b92b1d77322345b7bd2e3f2467b17fbea48"
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
    assert_match "git-hunk 0.15.2", shell_output("#{bin}/git-hunk --version")
  end
end
