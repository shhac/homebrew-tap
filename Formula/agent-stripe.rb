class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.9.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "acc38b2861dd708f44c7ae723bf2c47343b54122b7f86df18c5962cb813d24b8"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.9.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "9f7a20e83594841f035d74d670684ec5f9d1133efc78cf1827bec79df79b7ec1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.9.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "a9528e2667d5bd9405408c6f2b43870504b6a32ecd95c3950e4d4206348f61b5"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.9.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "812da33105ab09c56bde2c6155d327c59c48e20355f201c6629ee63a509598c7"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
