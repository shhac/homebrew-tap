class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.9.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.9.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "9bc9b2aca93a5ffb57e144dc5ddeb5c6453b6f4dcb0451f2fb6d2293bf54ddea"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.9.0/agent-mongo-darwin-amd64.tar.gz"
      sha256 "929aa30084cab71d667973bec9d9f6bbae96566725621c757f232a9519c9bc8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.9.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "5c9df01587e662d22c812eab49df211f84fd2604c9f907759b8f268c149d55c7"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.9.0/agent-mongo-linux-amd64.tar.gz"
      sha256 "cbfbe2fa9da3f0642623e99b8f25908fef6de421f968510ceab00fde70b679fc"
    end
  end

  def install
    bin.install "agent-mongo"
    # Installs shell completions via `agent-mongo completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mongo", "completion")
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "Read-only MongoDB CLI for AI agents", shell_output("#{bin}/agent-mongo --help")
    assert_match "#compdef agent-mongo", shell_output("#{bin}/agent-mongo completion zsh")
  end
end
