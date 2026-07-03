class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "7a375e2e3e93a21b0054b3c779a23a7aaa1816468bcdb954b40b2671a06fc70d"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "f0372d2d590ea486ebf7f7d80900fc0f260e7368421508ce718c5e7586f878be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "11c5b585588216ecf3091315d1e208301c5c839a9c22c74383469cb7bf2ce79f"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "e4ea9ee6d02f739376e55542cd323e0e906e4e0d17a5a1c15c709360060b532b"
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
    assert_match "git-hunk 0.15.1", shell_output("#{bin}/git-hunk --version")
  end
end
