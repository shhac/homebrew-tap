class AgentMotion < Formula
  desc "Temporal video analysis CLI for AI agents"
  homepage "https://github.com/shhac/agent-motion"
  version "0.1.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-motion/releases/download/v0.1.0/agent-motion-darwin-arm64.tar.gz"
      sha256 "aa62815c98c8017a3bf0cd39f1769cf1d457d141739f54c4b4602fdd99d35bce"
    end
    on_intel do
      url "https://github.com/shhac/agent-motion/releases/download/v0.1.0/agent-motion-darwin-amd64.tar.gz"
      sha256 "f9ee7eec99be1f85642c92d83577727c17dc795026fceeca81abbec8f140de4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-motion/releases/download/v0.1.0/agent-motion-linux-arm64.tar.gz"
      sha256 "b7b327ab8b21a89ffb7582e442a9425030881f23f2c12bc9dea5b567d671dd7f"
    end
    on_intel do
      url "https://github.com/shhac/agent-motion/releases/download/v0.1.0/agent-motion-linux-amd64.tar.gz"
      sha256 "19106ec48204f33dc2f73e3b70d09066949a5479d9f3666b9deab67a4a5ed676"
    end
  end

  def install
    bin.install "agent-motion"
    # Installs shell completions via `agent-motion completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-motion", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-motion --version")
    assert_match "Temporal video analysis CLI for AI agents", shell_output("#{bin}/agent-motion --help")
    assert_match "#compdef agent-motion", shell_output("#{bin}/agent-motion completion zsh")
  end
end
