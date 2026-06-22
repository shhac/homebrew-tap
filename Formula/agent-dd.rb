class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.14.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "696b6da8e67ac764dc55d86a48d6a162691e988f5d6504127e3e0d66a819afe7"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.14.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "c215cfbed0743e8ac806ed5304a37e412642a4f7da850da1740babafc15ab3f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.14.0/agent-dd-linux-arm64.tar.gz"
      sha256 "e1eec40b4fc7da518dba7292ec8f661d11335b48db19f1b5c2c81ee5352fed54"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.14.0/agent-dd-linux-amd64.tar.gz"
      sha256 "a4fa0125778dd70258c6c4c3ab397c33a2ea8cd27bb1211f553a668dd034f7c5"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
