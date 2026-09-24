class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.14.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "8f3ab3e4aa797d86997426b8443ff5b78010541762cc2a3ab5e97c4abf12fe96"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.14.0/agent-mongo-darwin-amd64.tar.gz"
      sha256 "2b2c1da376ca565658c64ef3ad2fc4cb6c0bdd8f94dbced9f5bba0d401de714f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.14.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "410a157f5f8afd90612933440ecacd5defd8ff53ce136149962dda89bcd69f5c"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.14.0/agent-mongo-linux-amd64.tar.gz"
      sha256 "0c7704768e06860e8411e8ebe18612dceb9842df406c0c1ce3ca1a0e601738d0"
    end
  end

  def install
    bin.install "agent-mongo"
    # Installs shell completions via `agent-mongo completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mongo", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "Read-only MongoDB CLI for AI agents", shell_output("#{bin}/agent-mongo --help")
    assert_match "#compdef agent-mongo", shell_output("#{bin}/agent-mongo completion zsh")
  end
end
