class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.13.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "7443edfb260c3951518b941379936368b42facf2c25795c7f7cffc14e2b0603b"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.13.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "8df4e01212170ed032ac021330dcab29decbb3dc64d78ad72ab1aae42e811125"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.13.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "005f773d8eed92f37c06a6611cb21383318510320ab479732d0b8c7c6e67f2a5"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.13.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "f5e265f56a70bb488cccdeef5394c129dff414f1753e12da9c979029edf98394"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.13.1", shell_output("#{bin}/git-hunk --version")
  end
end
