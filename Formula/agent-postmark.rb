class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.7.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "4ed4fce992c0977a04f4eb1dd184577c4c8687c21b5e7a1c08f3db93f49b0637"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.7.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "662c39ce8c5403edda1279258ecac35f2eb3573e6877e572f104fd5784cf0314"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.7.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "d6e8e64595ae130282752b3fd5307c67e0b9049a56554dbf691873efdac83dd9"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.7.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "8f72c5a5e6b99fa55c1337866035883ed92d3dc955e34017e92cdbbb09bc568a"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
