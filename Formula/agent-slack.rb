class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.46.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.2/agent-slack-darwin-arm64.tar.gz"
      sha256 "ebb2aa3e0502b67cbea0785ba9c01f490c5def395001d25093815533889f0672"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.2/agent-slack-darwin-amd64.tar.gz"
      sha256 "b342d9e6bdd149906c069c59223fda230547a05debffa4ac3b5947777ca36196"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.2/agent-slack-linux-arm64.tar.gz"
      sha256 "9e8eadbe9647ef6d029c50b064ee01aa688e372b463b6ed989ade9295e47f0f0"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.46.2/agent-slack-linux-amd64.tar.gz"
      sha256 "743668f117d503fc5c8bc7b29d2d2f60798087458c9f9a6e7582d678d574814e"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.46.2", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
