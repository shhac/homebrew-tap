class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.18.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.18.1/agent-dd-darwin-arm64.tar.gz"
      sha256 "8b3c8d2fa395c50d8d743ef64b3fef8186436749f53695530aa282b7a96b0299"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.18.1/agent-dd-darwin-amd64.tar.gz"
      sha256 "3fc689e84dd48e4821f69c89a67dd11559c1faf936767daaff2703528e44fe8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.18.1/agent-dd-linux-arm64.tar.gz"
      sha256 "36aeaaa620806de488b4f91bd5d9ef7333a777a93459f344e685e447366b735f"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.18.1/agent-dd-linux-amd64.tar.gz"
      sha256 "5095c631e4cf76c0a401df5844192590d036e73226b0c7f9dfc64b79b9f89796"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.18.1", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
