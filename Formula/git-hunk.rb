class GitHunk < Formula
  desc "Non-interactive CLI for staging git diff hunks by content hash"
  homepage "https://github.com/shhac/git-hunk"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.3/git-hunk-aarch64-macos.tar.gz"
      sha256 "e2d88ee6e826e4806be20375e51c3962ba91863d6bac4001bb9ebf78c910150b"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.3/git-hunk-x86_64-macos.tar.gz"
      sha256 "194680d6ad609f143ed9825b2d5acdb7b9468521a364f59e3ae87772b6dd7406"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.3/git-hunk-aarch64-linux.tar.gz"
      sha256 "e9b57779d0640e2a17b33fe9e8367962b8daffa3fd9385f5ff76b4cc191ef776"
    end
    on_intel do
      url "https://github.com/shhac/git-hunk/releases/download/v0.15.3/git-hunk-x86_64-linux.tar.gz"
      sha256 "219c82a1776748c08f52c8fe38c5d8c1020b43488530907fa8925eb789f10845"
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
    assert_match "git-hunk 0.15.3", shell_output("#{bin}/git-hunk --version")
  end
end
