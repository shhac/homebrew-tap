class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.39.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "56ece13af79ca99fb80caa7da16df34571ea5e8c2f9ce442a07f96de4697c582"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.39.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "4183d637a03569f40d216d6dc602da6f34918bcd7fde4983f5c41659b1d7c44a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.39.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "70cedd786bee18fdd4123629825716075ae70c0b77810b6374f17081f10ee12f"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.39.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "604e6757eabe2c4c1cfffb2cfd4326c9f4cfbacb5ddce117d6a6887bf25d5a9a"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.39.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
