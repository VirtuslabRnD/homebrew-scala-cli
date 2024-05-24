# typed: false
# frozen_string_literal: true

# ScalaCli Formula
class ScalaCli < Formula
  desc "Launcher for ScalaCli"
  homepage "https://virtuslab.github.io/scala-cli/"
  url (RUBY_PLATFORM.include? "arm64") ?
    "https://github.com/Virtuslab/scala-cli/releases/download/v1.3.2/scala-cli-aarch64-apple-darwin.gz" :
    "https://github.com/Virtuslab/scala-cli/releases/download/v1.3.2/scala-cli-x86_64-apple-darwin.gz"
  version "1.3.2"
  sha256 (RUBY_PLATFORM.include? "arm64") ?
    "685e4984c3d7310666e7ecd990b27d9474bb24a90a58805955b3778ded054677" :
    "dc9744f2f7da187c9814ea903702ed66be99cef37a72f4bdf273b246dff34757"
  license "Apache-2.0"

  def install
    if (RUBY_PLATFORM.include? "arm64")
      bin.install "scala-cli-aarch64-apple-darwin" => "scala-cli"
    else
      bin.install "scala-cli-x86_64-apple-darwin" => "scala-cli"
    end
  end

  test do
    (testpath / "Hello.scala").write "object Hello {
                                def main(args: Array[String]): Unit =
                                  println(\"Hello from Scala\")
                              }"
    output = shell_output("#{bin}/scala-cli Hello.scala")
    assert_equal ["Hello from Scala\n"], output.lines
  end
end
