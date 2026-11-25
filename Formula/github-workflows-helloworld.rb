# Copyright (c) 2026 Gaël PORTAY
# SPDX-License-Identifier: Unlicense
class GithubWorkflowsHelloworld < Formula
  desc "Hello, World! From GitHub, and elsewhere"
  homepage "https://github.com/gportay/github-workflows"
  url "https://github.com/gportay/github-workflows/archive/refs/tags/v11.tar.gz"
  sha256 "7feda91c4ceec3592d5de9fecc105682a13db658dc7496e9f06b348fc9dfbf96"
  license "Unlicense"
  head "https://github.com/gportay/github-workflows.git", branch: "main"

  def install
    system "make"
    system "make", "test"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_equal "Hello World!\n", pipe_output(bin/"helloworld")
  end
end
