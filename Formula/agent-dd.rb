class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.12.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "d3a02d668af96d8825ec5031b7c12c5a599029e7909321a4af08965136a6192e"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.12.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "41f4681b6b0df8a789849a9cfbf1dd039975f1ad6c160f743fc6a8f11c37bd32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.12.0/agent-dd-linux-arm64.tar.gz"
      sha256 "fa1023a5ce0aad1086d7aad110510a7f21b5feea8da8dbcf5925070beb7c4c47"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.12.0/agent-dd-linux-amd64.tar.gz"
      sha256 "d654840cfcf95d8885bb82a800b4b84fcc93412e85053e577f34ce7ec9d3c76d"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
