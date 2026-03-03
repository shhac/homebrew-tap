class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "0bbb63f05130703c183b467df9382dd7992777957098409ca0e48a1249e9601f"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "08cf8d2139d68202b054337dc13ab518cb8059654e6b26ffaa016f3ba16aa38b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "d86fc8006f1e137f2727bfd4ac376b31a3e47090344e8c532edd7be882c49ea8"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.10.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "b69df207b31d61dd65666b3404af95d3bf4c284d07cd8f692e179e4ada6f5663"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.10.0", shell_output("#{bin}/git-hunk --version")
  end
end
