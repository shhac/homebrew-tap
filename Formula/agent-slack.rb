class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.6.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "1c12218ee079c4b729285847dd25eade9cca9ae84b358301361b945e9f872db4"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.6.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "886114bafe2cbb9fe2ed63645ad53394976d33f0e8ac149aae1ddef6e3028879"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.6.0/agent-slack-linux-arm64.tar.gz"
      sha256 "e9f2306ce525ed68e2cc4eda7932a2876e708449fbd68c25ad4a6266e9b69c5c"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.6.0/agent-slack-linux-amd64.tar.gz"
      sha256 "08aa23d3549d2818a0da51f003cb9e5d7646206b1962bff3f8de23657759a218"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
