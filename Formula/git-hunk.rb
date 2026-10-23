class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.21.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "ab81f8f835255b9f8f8bfeb4555191677149f04d46f95b96607903bf278bb6c1"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.21.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "7b22e690bc1d0865a71735dc038f59452758fe2811cf0d7482882e36f3b9731e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.21.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "efd4a3b258736aae530283877722928d84330de3ba75c03cc2377535d56217a6"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.21.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "beccc19e985fc1f7ed035d115b875293568d6e42ed142339d19b4bc06aa45db9"
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
    assert_match "git-hunk 0.21.0", shell_output("#{bin}/git-hunk --version")
  end
end
