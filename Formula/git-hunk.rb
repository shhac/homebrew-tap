class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.8.3/git-hunk-aarch64-macos.tar.gz"
      sha256 "751a26cacc91fabfa04a9727e5a7e487c606cd366e9619ffd68af3971f3a0003"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.8.3/git-hunk-x86_64-macos.tar.gz"
      sha256 "81b5cd6d19aaa0cce21bccba23959e4673bb54bddae99cfd7697da1de51a7047"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.8.3/git-hunk-aarch64-linux.tar.gz"
      sha256 "baac1c421829aa0bc9bf3126e294be3bf2809db95f48193a5a6169fab4503ed0"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.8.3/git-hunk-x86_64-linux.tar.gz"
      sha256 "d84b984400573088c936ec68bef731a55d2c6e1c8f4bc15320f129db13100824"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.8.3", shell_output("#{bin}/git-hunk --version")
  end
end
