class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "e2216788a3a45fe217dfe7e992cda0f176582fec5343c430944996e19a3ae6ea"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "5450a92b718d001f768429c88a5a6f9fc93b45e0452eff626458770e8b8da0fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "926939205c3885a516eaaea42d8afc4cffee43134b0b2673864634b7a08ed7d2"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "d6e10004308908fdd63351bafe918e490cffdf5cc8c09218557ba766b699017d"
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
    assert_match "git-hunk 0.15.0", shell_output("#{bin}/git-hunk --version")
  end
end
