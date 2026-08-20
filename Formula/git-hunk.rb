class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.18.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "3d04b971a30c6fffd2d395801a92a9c3306eafdb7cda0b7bb612541c3553cde6"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.18.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "cabaad5fca6ab23f26e065f1737bc21533afcabf7b29d187960ff16a77e42aea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.18.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "c4a5714d0d7678e1a93c392ec8dfce16ce149c06a791a26f381f4d77a7ac7119"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.18.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "6b2c1860fa2c2203d963f29133e7b2d88b0982cd6db7b323c4c1409d22acccc1"
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
    assert_match "git-hunk 0.18.1", shell_output("#{bin}/git-hunk --version")
  end
end
