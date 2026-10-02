class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.41.0/g2g-darwin-arm64.tar.gz"
      sha256 "65e85865056c02cbd7a577848b3e84286f940f4ee1f74c9ffac56c6f5ba9fe9a"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.41.0/g2g-darwin-amd64.tar.gz"
      sha256 "00371e589eb6ca6144fa28834f7db0bd38462a73e10940cec9cb142fed0a8e81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.41.0/g2g-linux-arm64.tar.gz"
      sha256 "f8c09ced98737e19e9bb76d5986d97e64f7c6191efd8e61cf0851081f1895c55"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.41.0/g2g-linux-amd64.tar.gz"
      sha256 "381fa0c74ae7fb296822f6eee230ca434521dcbe16c934740322ba1d5fb28095"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.41.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
