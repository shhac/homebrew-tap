class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.17.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "bd6c005fa3156f2912ac78477e04e97cdffe5b85eb14d658f19e354d4f553f8d"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.17.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "b1ee4b58af41335ed2197fba45c021a8cee1de1719a54c7f9e19f0bbc744f4d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.17.0/agent-dd-linux-arm64.tar.gz"
      sha256 "f257fe61e6bb2a3fd7fc4685cc52cb4597b25fa4dce04ee9434fbd5857a1e3af"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.17.0/agent-dd-linux-amd64.tar.gz"
      sha256 "37d7fd5a36ae95797b23bc7038558a258e489955fc5d08582265f923231f7577"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
