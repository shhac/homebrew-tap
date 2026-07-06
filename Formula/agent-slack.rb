class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.42.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.42.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "4eb2e36f3ee019ea91c08d69e698d84e5c5a599181b035962017f8fb0a1c16ae"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.42.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "dde340988dea94903fc2c47311405de1e9966915c68790ee7bc593afb337a5fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.42.0/agent-slack-linux-arm64.tar.gz"
      sha256 "52ab3da179cdf68756836ac9da81c294ab56410d73d98fbde84b09a694a56389"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.42.0/agent-slack-linux-amd64.tar.gz"
      sha256 "9514255fe682df0ad21954120911721cdef83b66a2af12e2bc66eebfe21dbd44"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.42.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
