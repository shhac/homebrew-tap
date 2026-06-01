class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.3.0/agent-postmark-darwin-arm64.tar.gz"
      sha256 "cb7c27e8846b2dd91c7f3eaf0c1399049421c4f14bdb9bf72c85d7ddf79d741a"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.3.0/agent-postmark-darwin-amd64.tar.gz"
      sha256 "614c85d167b2e69d197671c0cd0e68e6e3f1e81ba7701ad0c666b407807cc14b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.3.0/agent-postmark-linux-arm64.tar.gz"
      sha256 "fefa5a182156721cc1e15dce8a8ce42374bc25498aa3641ebebc2a512a3f6ada"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.3.0/agent-postmark-linux-amd64.tar.gz"
      sha256 "b94a873c8b09c0516e1416bb74bd58d81e89f0fdfea4713672a78b10b41e6b93"
    end
  end

  def install
    bin.install Dir["agent-postmark-*"].first => "agent-postmark"
    # Runs `agent-postmark completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agent-postmark --version")
    assert_match "agent-postmark", shell_output("#{bin}/agent-postmark usage")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-postmark completion bash")
  end
end
