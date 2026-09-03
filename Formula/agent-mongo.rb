class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.13.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.13.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "859ccf40bd60dd1c26866dc738af4253e3568527f7cd7563778e79577677b3c2"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.13.0/agent-mongo-darwin-amd64.tar.gz"
      sha256 "bad4636f782ebc2d19480bc50484b4589abe4f9ce5e5284a5bc8c0575730c6df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.13.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "6b2370f7591bcdf2d2651be3a89b7be30d642592ada0fc63d38f0f2bda5a74c6"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.13.0/agent-mongo-linux-amd64.tar.gz"
      sha256 "cca3c0fecbb38c4f0de701e3bef0b4bb19025a900183041baccfca904f2dde8d"
    end
  end

  def install
    bin.install "agent-mongo"
    # Installs shell completions via `agent-mongo completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mongo", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "Read-only MongoDB CLI for AI agents", shell_output("#{bin}/agent-mongo --help")
    assert_match "#compdef agent-mongo", shell_output("#{bin}/agent-mongo completion zsh")
  end
end
