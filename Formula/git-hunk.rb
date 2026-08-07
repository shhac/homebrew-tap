class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.17.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "dc4c94744563d3daf2d56bdac14b7c65fc6c31bc9bc8b3d2be4add372875046f"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.17.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "c7fadc793b27eb83106019515a5c69fb75d54fd1bb205263bcea6c96412c19d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.17.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "0ec7d7a6d1ab0798d3e8cba366b6e73b6b819ae3dcaed967b0bf8b87e1bdd8eb"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.17.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "299b21e135a1eb9250a89c632e5ac28dd4176dae9a849404217d07e9c2738f1a"
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
    assert_match "git-hunk 0.17.0", shell_output("#{bin}/git-hunk --version")
  end
end
