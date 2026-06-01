class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.1.1/agent-postmark-darwin-arm64.tar.gz"
      sha256 "5af698c4e4bc1f977bd37c9f8ca9221c58797a632339b6d0f314ea12f61f4725"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.1.1/agent-postmark-darwin-amd64.tar.gz"
      sha256 "a218034607966ca6433aa487d9b7ff14ddb34e941085a5868837c8085341b370"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.1.1/agent-postmark-linux-arm64.tar.gz"
      sha256 "c49afe014772ffebfcec63abf60ad3bae03bf6a576f34b3e06a72f7a6aa47d58"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.1.1/agent-postmark-linux-amd64.tar.gz"
      sha256 "882086cb3832995d56802329800b8f4f65405283ec8a2a2361cccde1c5d8ce5b"
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
    assert_match "0.1.1", shell_output("#{bin}/agent-postmark --version")
    assert_match "agent-postmark", shell_output("#{bin}/agent-postmark usage")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
    assert_match "bash completion", shell_output("#{bin}/agent-postmark completion bash")
  end
end
