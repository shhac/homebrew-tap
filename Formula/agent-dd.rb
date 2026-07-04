class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.18.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.18.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "ccbf071fe160697b763762dac61cbe289eb7e723b93533dadb4cc477ad4b6e58"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.18.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "7d7a28b60357deba44756d1e46b31af24a0e631c69dce4e3ffd293d8d5b33d17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.18.0/agent-dd-linux-arm64.tar.gz"
      sha256 "2152209ac90ec1ac217786b160e22cff842bf37ee28d8489fc2b2463b1eebaa0"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.18.0/agent-dd-linux-amd64.tar.gz"
      sha256 "68b150e149f27dcf8c58d1a1727e87e875663c0d98983016f452fb121e79087b"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.18.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
