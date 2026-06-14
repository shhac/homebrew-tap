class AgentSlack < Formula
  desc "Slack CLI for AI agents"
  homepage "https://github.com/shhac/agent-slack"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.10.0/agent-slack-darwin-arm64.tar.gz"
      sha256 "aa38e9ed41897dead55ed3b57a4b87f7504e8476978945a6c73028206c35e2cd"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.10.0/agent-slack-darwin-amd64.tar.gz"
      sha256 "6cb03f7715d481e65cbbb5ea475d990f289642d30a3d0a65c7144ab8e2eae3f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-slack/releases/download/v0.10.0/agent-slack-linux-arm64.tar.gz"
      sha256 "3ccdafa55408c6f56690f93b6062ab475ad84a1a4b59160c8c238ee920418866"
    end
    on_intel do
      url "https://github.com/shhac/agent-slack/releases/download/v0.10.0/agent-slack-linux-amd64.tar.gz"
      sha256 "148da210c1e769ef64c2d1bcf8bb80389075b8ecc74201a4a199e1c5a638aa91"
    end
  end

  def install
    bin.install Dir["agent-slack-*"].first => "agent-slack"
    generate_completions_from_executable(bin/"agent-slack", "completion")
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/agent-slack --version")
    assert_match "Slack CLI for AI agents", shell_output("#{bin}/agent-slack usage")
  end
end
