class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.46.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "5c12ce681a2c6a65065ef5715c498e62829f4f0cfa0c4c7bae6392f86a8f9ad9"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "609ed9bec24e3994680ae28b88263c95972446105ba5c4d84b61f005c0972e6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.1/agent-slack-linux-arm64.tar.gz"
      sha256 "ca8e9844b052fa8f8cdf1ecc8cca4a69c20e35c0daa07530108154e6aad80133"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.1/agent-slack-linux-amd64.tar.gz"
      sha256 "06678b0e7ade9a440507518585e237deff909f057bd49cf024924effb99d90af"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.46.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
