class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.42.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.42.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "1d6ce7e6ea743e62bc11fde346cf98eba0f0b0a57008db223f3028699bc49649"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.42.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "1f0c5020f372e10f60fa95826e4725fcbf5d44507618fb0e456b2c451ffe3e59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.42.1/agent-slack-linux-arm64.tar.gz"
      sha256 "694794c3dc569a04de01317d84c94ff05b6591b1e24b8fab2bd9c1b23e2df514"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.42.1/agent-slack-linux-amd64.tar.gz"
      sha256 "79992f44adce19fb9454cba54b2247e2422729db50697d4eb3c1ab6cfd1b6c99"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.42.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
