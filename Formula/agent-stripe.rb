class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.13.1/agent-stripe-darwin-arm64.tar.gz"
      sha256 "342b70dc27baa3829311d44c41d8b6236403e56443e6afee541fbe85e0fc83e1"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.13.1/agent-stripe-darwin-amd64.tar.gz"
      sha256 "60ec3e539b85ee62c4875de709768243951b20603d3ca29102335ecc1b116344"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.13.1/agent-stripe-linux-arm64.tar.gz"
      sha256 "ab002dee2d891582bb63678154585eec65969efea5437b123700a3605c2a06d1"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.13.1/agent-stripe-linux-amd64.tar.gz"
      sha256 "54c7f063aac77b888b7e41850cd521d9d46f5f6a7aa153b3e58bc819255ebeb8"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.13.1", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
