class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.9.1/git-hunk-aarch64-macos.tar.gz"
      sha256 "81a24b0efc57d8f6d16f025ebaa19ff1d49e3ec31e35735c43230fd93b821b8a"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.9.1/git-hunk-x86_64-macos.tar.gz"
      sha256 "f29e0d62bf8016ff610081731a3a011998443a16f0a491a3b9cda39d728e004d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.9.1/git-hunk-aarch64-linux.tar.gz"
      sha256 "136ce5fdce951e5b511db582d442944884400d35137224fde560758298e9c18b"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.9.1/git-hunk-x86_64-linux.tar.gz"
      sha256 "659c477cddaa61e4398267e39fa23ae86e8331b072ce76b7e4d3968374cf6197"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.9.1", shell_output("#{bin}/git-hunk --version")
  end
end
