class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.13.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "fed62bffb27042262e5c0904e6ef5854561b903b9d0bea3e03dd83c39db99ba3"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.13.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "18dd7d7e169db1a21dacce2c0b1f3010dd2bd744fb894a5074a545886564c4a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.13.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "0198307e8ba80c3c8edbbfd7bfe95ebf37599581622e2e83cb43af64db0901aa"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.13.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "09383e0f9b8e0b05773460bf25866dee8f1226be43db72b59898e8e5d9baaf67"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
