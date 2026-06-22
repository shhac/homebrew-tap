class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.9.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "9321b7d44c417b8697cb185aaae768ebc4a2d41028628185d8b1aa624fd287fd"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.9.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "1c2016b71907df2bec22b86302be95577fc6d960b786f5592b875277c8756c26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.9.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "02f10e4259f3691e673d6d3cab99d813470c0b7e86e1dbb994d7ece9f9315935"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.9.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "3bd404df0778d1faad974bd2b778733d4cbb6ba2fe241c3e3822db20f13ae8a0"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
