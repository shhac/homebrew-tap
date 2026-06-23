class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.12.1/agent-statsig-darwin-arm64.tar.gz"
      sha256 "763cffdf118d19a726d1b75ce915c83b2e43d9dc4ce73da2e4f7d08fa19f0f52"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.12.1/agent-statsig-darwin-amd64.tar.gz"
      sha256 "ffcce17de78d14b54a51ab056238500e58dd330bc63a0ea5445b3f856b64cfd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.12.1/agent-statsig-linux-arm64.tar.gz"
      sha256 "09766b428e30d5cb4a38a6b6255a6cb883cb8782d86c00ef3a1778795a7273cb"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.12.1/agent-statsig-linux-amd64.tar.gz"
      sha256 "0feb0e05d37be69aae2b07b2e5e814294549008ae2fd5a6b49f820eebdf5934b"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.12.1", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
