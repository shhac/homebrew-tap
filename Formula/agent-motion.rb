class AgentMotion < Formula
  desc "Temporal video analysis CLI for AI agents"
  homepage "https://github.com/shhac/agent-motion"
  version "0.1.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-motion/releases/download/v0.1.1/agent-motion-darwin-arm64.tar.gz"
      sha256 "4f828ddf2fa4bf8ff88d82f541bbb953ae7eac8b3d056175f4565efb1ef52c53"
    end
    on_intel do
      url "https://github.com/shhac/agent-motion/releases/download/v0.1.1/agent-motion-darwin-amd64.tar.gz"
      sha256 "e92d5c0968374e5dc36929ea2c3cf6f99d80f43b53c8d6881fadde891681cef9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-motion/releases/download/v0.1.1/agent-motion-linux-arm64.tar.gz"
      sha256 "33f59c1d1dc335c2ca33d3b463e258fa39f5d563411778d8fd879ec757c317e2"
    end
    on_intel do
      url "https://github.com/shhac/agent-motion/releases/download/v0.1.1/agent-motion-linux-amd64.tar.gz"
      sha256 "ad66ffc1b90ba7956ea2665f28013f2f4fd5a194a125091ec01e2df72420c470"
    end
  end

  def install
    bin.install "agent-motion"
    # Installs shell completions via `agent-motion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-motion", "completion")
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/agent-motion --version")
    assert_match "Temporal video analysis CLI for AI agents", shell_output("#{bin}/agent-motion --help")
    assert_match "#compdef agent-motion", shell_output("#{bin}/agent-motion completion zsh")
  end
end
