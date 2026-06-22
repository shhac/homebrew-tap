class AgentVercel < Formula
  desc "Vercel CLI for AI agents"
  homepage "https://github.com/shhac/agent-vercel"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.13.0/agent-vercel-darwin-arm64.tar.gz"
      sha256 "c5039a265f36544e202630bf7befd6018e505819371f550884c63cef64da30b8"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.13.0/agent-vercel-darwin-amd64.tar.gz"
      sha256 "b454484adb6e308f6105651f18b0e903c4a69be59ab501095535cb8e7ba51a23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.13.0/agent-vercel-linux-arm64.tar.gz"
      sha256 "8c436189c52c78410a33dede373016a0a823d38878b9571dcfb92f47b4ce3bf6"
    end
    on_intel do
      url "https://github.com/shhac/agent-vercel/releases/download/v0.13.0/agent-vercel-linux-amd64.tar.gz"
      sha256 "7124e9e667d5dab90d0fa64239cc761ccf202c7f109e708ee2b1031c8051ed65"
    end
  end

  def install
    bin.install "agent-vercel"
    # Installs shell completions via `agent-vercel completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-vercel", "completion")
  end

  test do
    assert_match "0.13.0", shell_output("#{bin}/agent-vercel --version")
    assert_match "Vercel CLI for AI agents", shell_output("#{bin}/agent-vercel --help")
    assert_match "#compdef agent-vercel", shell_output("#{bin}/agent-vercel completion zsh")
  end
end
