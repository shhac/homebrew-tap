class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.5.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "eece9629e8b75e101fae13ca6e79a4e482ac1ec11e14e37ad5dc60977aefeef6"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.5.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "51d6425ab0f29a898f63ca2d773f8637e3614cd4678d4f3bbaf2fc741ce7d6c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.5.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "743315dbc73a1cd00f6012da9ca50bc9ba74f00a07730dc41730ab117dd1df78"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.5.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "e56ab1b07e544e5d3082e910920502f59e17f289b731989ad473c77c1cd15c8c"
    end
  end

  def install
    bin.install "git-hunk"
    man1.install "git-hunk.1" if File.exist? "git-hunk.1"
  end

  test do
    assert_match "git-hunk 0.5.0", shell_output("#{bin}/git-hunk --version")
  end
end
