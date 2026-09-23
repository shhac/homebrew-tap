class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.19.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "c38aa5cfaac9c2c9872df7a9f78bdd7ef614a7c40a3ca13241a657c2600842ea"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.19.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "c6b5102226c203b93d2a5674144d7628372a8b448b3f200742c6ced62c4e716a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.19.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "277544a951ab980a4f785659a29b3e6fbbfe9486d52571411a70b1223138a028"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.19.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "2ccffc1f59afdc1f48cdf2fd5fa00d370877c1305b6ab5a5dee29352b4037ddb"
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
    assert_match "git-hunk 0.19.0", shell_output("#{bin}/git-hunk --version")
  end
end
