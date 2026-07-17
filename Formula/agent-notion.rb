class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.9.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.9.0/agent-notion-darwin-arm64.tar.gz"
      sha256 "f56b651353fb05b2b4c5d7edf201e20da3fea1e131cdde30a86693396bf434d5"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.9.0/agent-notion-darwin-amd64.tar.gz"
      sha256 "5e9c7b200ccabf9dd1a47736243621472a971135c1680f2af53045e64348e28f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.9.0/agent-notion-linux-arm64.tar.gz"
      sha256 "4fdeec0aacd13bbc7ba51e47d01b192dd1c48b8e92bea9a29553e93a2684b4e9"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.9.0/agent-notion-linux-amd64.tar.gz"
      sha256 "408ddb20a0489c07e20922dc476d0f5533e9b2f2bd989b67e965fc9a5926c2a1"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
