class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.3.0/git-hunk-aarch64-macos.tar.gz"
      sha256 "12a54f0c9736027c8111e98c06808a14fcd1e92bf1aaf480f5e8c960500291c1"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.3.0/git-hunk-x86_64-macos.tar.gz"
      sha256 "87e76d070841dc80635bc2beab182f3c0432be7f0d0fafee4cf9d630285deb0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.3.0/git-hunk-aarch64-linux.tar.gz"
      sha256 "72bfd5ba018706f048408df7760c4250626014b541a8a0ecc2be4d2908a72119"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.3.0/git-hunk-x86_64-linux.tar.gz"
      sha256 "78764dffc79cc5ad4e01d1dba2b832c3ef74d086bc079b9186ad8e598a24eac5"
    end
  end

  def install
    bin.install "git-hunk"
  end

  test do
    assert_match "git-hunk 0.3.0", shell_output("#{bin}/git-hunk --version")
  end
end
