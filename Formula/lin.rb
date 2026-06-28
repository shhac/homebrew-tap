class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.31.0/lin-darwin-arm64.tar.gz"
      sha256 "da6ed7e49cb3ed01fa30c9b132ecdbcf7209457ac372f77e806b4cca0a525ebf"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.31.0/lin-darwin-amd64.tar.gz"
      sha256 "337b6c4ebb23c3810a3530a55c4903ccd932d0cf0c3cbcf84786ef9e96013afb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.31.0/lin-linux-arm64.tar.gz"
      sha256 "33f664b5fa25992c6b780e6109ac9cf58c41df01b6be5447c65cece347a970fb"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.31.0/lin-linux-amd64.tar.gz"
      sha256 "b0d85b9d1495751f3642daeb24b47f81560f1090c782281c4323e9482704e96a"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.31.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
