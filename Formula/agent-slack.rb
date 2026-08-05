class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.46.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "9baf52c606d5005d92d55ecc28b9b386f15cc6fa66dbfb6c990377bdc7b603a6"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "64a7fe2ac586493c2efff9ac16e6021400551578013902c2586917ff71922fe5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.0/agent-slack-linux-arm64.tar.gz"
      sha256 "56a676bf3b91aed60d7db2764c33b4fbb48d4dbcdd174e82be171410534b803e"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.0/agent-slack-linux-amd64.tar.gz"
      sha256 "7bc981bd3547998eb5e61bd238bf306c5a28c6fe3f64607b5b3f99dc4d4bdf3d"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.46.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
