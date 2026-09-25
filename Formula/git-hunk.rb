class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.20.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "37b65a00a2e324c8a794955ad95f227c103d988690480ea579a73a302a69b215"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.20.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "b6c656c6c40fac8bee5d65f0a30fad465531772ff176365d63e22f31bc797640"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.20.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "10b25bd1f658ebcd3720093e8db3956f5cc247c9a24e285209202669f7b55a89"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.20.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "597b36f6704abc385159650b176751c0b52bc4656296ea2f4360e261352fd31e"
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
    assert_match "git-hunk 0.20.0", shell_output("#{bin}/git-hunk --version")
  end
end
