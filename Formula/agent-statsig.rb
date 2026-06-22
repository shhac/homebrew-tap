class AgentStatsig < Formula
  desc "Statsig feature flag CLI for AI agents"
  homepage "https://github.com/shhac/agent-statsig"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.10.1/agent-statsig-darwin-arm64.tar.gz"
      sha256 "b4d0f6dddf9d881abc912446d98677cb71300bf97b430fc14ec6b3dceb588499"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.10.1/agent-statsig-darwin-amd64.tar.gz"
      sha256 "0c65ebe153d4503b26b0877c39c84ec44060445d2ee0e7b1574f35c0ab57da4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.10.1/agent-statsig-linux-arm64.tar.gz"
      sha256 "2fdc9a4430163658a655b966d3f72f3864e385755ac6a42ae93163c57a933f3c"
    end
    on_intel do
      url "https://github.com/shhac/agent-statsig/releases/download/v0.10.1/agent-statsig-linux-amd64.tar.gz"
      sha256 "ba7d0a72351a035344582803e635027354aab7c9ce31cae28b6d75da205acd80"
    end
  end

  def install
    bin.install "agent-statsig"
    # Installs shell completions via `agent-statsig completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-statsig", "completion")
  end

  test do
    assert_match "0.10.1", shell_output("#{bin}/agent-statsig --version")
    assert_match "Statsig feature flag CLI", shell_output("#{bin}/agent-statsig --help")
    assert_match "#compdef agent-statsig", shell_output("#{bin}/agent-statsig completion zsh")
  end
end
