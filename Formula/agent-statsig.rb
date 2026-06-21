class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.5.0/agent-statsig-darwin-arm64.tar.gz"
      sha256 "42fdf02e5b319009bd89cd76f323c5d9c4edcd179ea3230a1a562bac7bf9ccbc"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.5.0/agent-statsig-darwin-amd64.tar.gz"
      sha256 "42273465e06db6021b655b3073e490ee3c293ddbd736bcd7f6f422917265e456"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.5.0/agent-statsig-linux-arm64.tar.gz"
      sha256 "ec0fa77c9ce5ec6ba9ad26575c214bc62e3eaf235b89c67b96b24bab158886b3"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.5.0/agent-statsig-linux-amd64.tar.gz"
      sha256 "fcf04a3179aac9eb760b61ef8d203d4dbab79af168fb4ea666a20107544db352"
    end
  end

  def install
    bin.install Dir["agent-statsig-*"].first => "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig", shell_output("#{bin}/agent-statsig --help")
  end
end
