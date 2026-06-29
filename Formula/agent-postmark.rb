class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "693e751b0eea2cfd9bf4e0ff39b251882a76a6d1a9c1074b49f796c5183359b6"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "69758c231032f19a4794eb8cf9d7a39877bb18f6df49332775687ea573d7ab98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "6ae2bfc044c8da8e6a1e744ab7677555fa6a0c3e05d30b0049c4f2b4d9ffdf39"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "07cd4c2da400214b12a716c650f22824bf43493e473dc679222c1bddb068d382"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
