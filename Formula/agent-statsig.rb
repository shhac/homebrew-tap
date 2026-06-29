class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.13.1/agent-statsig-darwin-arm64.tar.gz"
      sha256 "7fa3c9f27eaa3bd9d756417f1010c3e413dab50da06191e6529f2110f1f76d65"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.13.1/agent-statsig-darwin-amd64.tar.gz"
      sha256 "99788830474e7afafe3c6b54ecc91aac9588f21618643b2d860c0aa47bd2a803"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.13.1/agent-statsig-linux-arm64.tar.gz"
      sha256 "72b111ce134823ac31f4cf4e01afd05158a60cba6eb411d609e3ec370780ec75"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.13.1/agent-statsig-linux-amd64.tar.gz"
      sha256 "ca9a983fd147b929dd4f241ca96dc75ca194978466759225c839a7e6ff6f5021"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.13.1", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
