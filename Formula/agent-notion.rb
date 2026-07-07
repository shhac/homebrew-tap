class AgentNotion < Formula
  desc "Notion CLI for humans and LLMs"
  homepage "https://github.com/shhac/agent-notion"
  version "0.7.3"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.3/agent-notion-darwin-arm64.tar.gz"
      sha256 "1c16f94515e562eee6a88a6f5dd7847bb8adbb1511ad8ffe6d54ea7a13e8a29f"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.3/agent-notion-darwin-amd64.tar.gz"
      sha256 "7eb18e54e5b0168f4c67c848ba9a12adf93665fc611ad6d772ce2dd69428f610"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.3/agent-notion-linux-arm64.tar.gz"
      sha256 "770061a48f5ad1f8de4054808b375f29bcc06ce096726f62cefecdf778a1f59b"
    end
    on_intel do
      url "https://github.com/shhac/agent-notion/releases/download/v0.7.3/agent-notion-linux-amd64.tar.gz"
      sha256 "0604c4fe06dae4cedef105be47b2324d51ddc1871ff0e539228f8cb5e64b6739"
    end
  end

  def install
    bin.install "agent-notion"
    # Installs shell completions via `agent-notion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-notion", "completion")
  end

  test do
    assert_match "0.7.3", shell_output("#{bin}/agent-notion --version")
    assert_match "Notion CLI for humans and LLMs", shell_output("#{bin}/agent-notion --help")
    assert_match "#compdef agent-notion", shell_output("#{bin}/agent-notion completion zsh")
  end
end
