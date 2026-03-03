class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.9.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "79cd1c2e1a5d1d890e6f758416d956b4072be1e410c6c15268663fbe49d9d618"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.9.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "f4c40aeccf5569e3b330fdca9deb3d0916a3de29af3d914e3cd717a151ba8fd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.9.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "a7314566061b8399fd135773a216ae08633a8728d6887ca19878cb8d2470fa13"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.9.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "ad0bf8ccb5ae0fbccd204790539e8e15bb4673ac69971f44e920f8cc979a4eb0"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.9.0", shell_output("#{bin}/git-hunk --version")
  end
end
