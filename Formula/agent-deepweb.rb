class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.15.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "57bd2de9febb25dd7a2dd3032b60faffbe2c43eda39e95df578f0964d0d12905"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.15.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "b25d6b43716505e1e8f8ed251d4a3a73816af97b6b7cf1521be42368ae5c8c62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.15.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "1b8eeba478087e98c468c050666c52fd32fc3c1f01e3affca1b68acecf222169"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.15.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "6d5deace0594258f325310abf97c7522c2ef20ec4af6bcce5bd05b0093570c5e"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.15.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
