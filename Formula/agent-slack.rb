class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.28.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.28.1/agent-slack-darwin-arm64.tar.gz"
      sha256 "92b24c7748d8d290d6f407a1061fa21c3b2aaeee5bfff503eca52f57aca4a2b6"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.28.1/agent-slack-darwin-amd64.tar.gz"
      sha256 "3067018f2ae4b82808b5abe2ad475d9401a5552804c0756da17c9b98837e7f78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.28.1/agent-slack-linux-arm64.tar.gz"
      sha256 "b93c2088bcfadc354d7a330190c796404f725d749d771420b06731bebe37836d"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.28.1/agent-slack-linux-amd64.tar.gz"
      sha256 "ee042543a6677f505d00dc94d48326d402967fde50e009978f692bc5d7bef88c"
    end
  end

  def install
    bin.install "agent-slack"
    # Installs shell completions via `agent-slack completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.28.1", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack --help")
    assert_match "#compdef agent-slack", shell_output("#{bin}/agent-slack completion zsh")
  end
end
