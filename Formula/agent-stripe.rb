class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "fd4e34ede3865b282ecb9452dc15726861372a708645f6c4c6b28def8a3cefb6"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "6aaa17563091248fa221dd76550d82bbeeedd091289edec03daeacedd3ca6efd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "d25d1a884cd1785328bef9a39b7cf2c33333a801a551502ca7cec4fd082a3616"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.17.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "792b738fa431d9202d9b9ae9e1b1cebe24e7bfe822542862ea0ad71e03f794b6"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
