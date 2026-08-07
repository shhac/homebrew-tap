class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.20.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.20.1/agent-dd-darwin-arm64.tar.gz"
      sha256 "c7df4e86052f1f9d9f6f70e8a59e9a83a6fc46ae6812c6f512c5d31d490ba3d5"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.20.1/agent-dd-darwin-amd64.tar.gz"
      sha256 "d08562c9e83316bc3303bb8a3fc0af7ad14452a203597d1cda7b1cae2cfb4b5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.20.1/agent-dd-linux-arm64.tar.gz"
      sha256 "2a9088e527c36232af878d858de51c60c32686cc13b7d8b11d0c5683f68e24d4"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.20.1/agent-dd-linux-amd64.tar.gz"
      sha256 "97e3b884cd3eb8f28f4599aa392c847c0ebfdebccb47f4c7747cf4120675ff53"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.20.1", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
