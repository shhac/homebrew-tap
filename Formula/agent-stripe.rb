class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.2/agent-stripe-darwin-arm64.tar.gz"
      sha256 "d5295ce9f9eac4213c2ef53f9e47a6a1cfbda81238e555d5f0b9d87a9b3a724b"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.2/agent-stripe-darwin-amd64.tar.gz"
      sha256 "f1c6afffec733caf1286322f22fbed99917740dcd3af61288f07d2327fc34a07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.2/agent-stripe-linux-arm64.tar.gz"
      sha256 "beeb5462c464fa8c19c14bc1eda1880188467832c3874157413750b664eb1a19"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.7.2/agent-stripe-linux-amd64.tar.gz"
      sha256 "29f3c53b8c3d8105bd3cee66e827ffee9ea0fe72a7c283d08a47e86aca7b28de"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.7.2", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
