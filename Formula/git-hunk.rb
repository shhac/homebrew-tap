class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.18.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "2fa6f2321ceebfb9f22488fbbb88dfd393ee8c3ff02902d26794217294acadf4"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.18.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "45659a52d9fc987709bcbcc17fb887a17310c13f5fcc57b2af84f974fa7dcf9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.18.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "51f175f2e92a7a14d567f816b00ed63fed43d961147edac7ac3094eb35ef6c2f"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.18.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "fec818457c7dd10a9c077a6a8fc7bb2bbafdb06dfe8775c6bbc0c2bf59d473ed"
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
    assert_match "git-hunk 0.18.0", shell_output("#{bin}/git-hunk --version")
  end
end
