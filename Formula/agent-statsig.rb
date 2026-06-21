class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.6.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "d987752a965c98f5a2ff26fa200fec16c3d8c6fea1abd3958de6e9bc6c66dd11"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.6.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "c326cff0fb74cd561746bf5341654605b8a78353221c5cd8e51e0c37811da1bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.6.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "4d9588177406d8830daf6706dd5f7102e22c8272f67fcd88f3c889bcdffde1c3"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.6.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "2256b45d4e34eaad5d7363aac203bd66c0d2ea2fb29b2fc990f4acfa4635301d"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
