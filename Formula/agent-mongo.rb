class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.10.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.10.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "1932293ad513c2e822465b95326c1630ca6f0b842e3c4a0edb1684b81ad9b11d"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.10.0/agent-mongo-darwin-amd64.tar.gz"
      sha256 "df20ae50768db8cc78501c68a433f2f2bcb4f552b473978ba0494ab4142f898e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.10.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "c0c817b8d6c0295cde4f3bddb467b3dc3085718fbf365007c7f1af025e5f6951"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.10.0/agent-mongo-linux-amd64.tar.gz"
      sha256 "d3c7e088c38628c0e29fa1eaa5f2c55e03286943d79555ce6aa8301bc612ffc5"
    end
  end

  def install
    bin.install "agent-mongo"
    # Installs shell completions via `agent-mongo completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mongo", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "Read-only MongoDB CLI for AI agents", shell_output("#{bin}/agent-mongo --help")
    assert_match "#compdef agent-mongo", shell_output("#{bin}/agent-mongo completion zsh")
  end
end
