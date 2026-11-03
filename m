Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736345;
	b=I2DZBVQd0LyeiS8Sx8C8svV86fEaC5vPI3Wq2J6hOQDG0TuiC4M2WyPLvRGF8DdVHa9p
	 HRz5GF3AhTthHh9YAZ5HbxshjP/vMtUwF4/psa/1dgPCmqzTOiDhtDGHx5GOSi9bcEkbZ
	 fKFUjEb5QdidRiN+bB1GFOZUdXdBtdJZSZVR9CTjBuaPLdqAisVFZ9q/ccYW7EWXWvj7r
	 93MmoxABKbG2EmtSKGv2jVmIcuBServDQr2hsfIRygqfs26Ersu3D8G14ajgWcexH/CQ8
	 CJfkfMsttrHm7bi5dt3IF2OQBIWFuOVcWHKUcQk8UaD9iEBmzI/8189BAjAxIIfWxMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736345;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=1hkvoDg+3BOR/v0KX7OAFIh7T2rQSAFDO4jyUAIF0zU=;
	b=ceP+nuXrOSrn8N4+oyJBpoG+ykzMXd5eCYtM2svy8fgLRHLT5iSopXb8J1zXiTk8GmwW
	 VLWcQULuzkUV3+KtEpE5Ye12O4AFxR4dwqQ31CXMoRuO4fCJI7ZII8k0xmHEzrbJ4K+fR
	 UUTAQQyfh6q08rlaERPo9B2f/1B9AyPeWEq//c43IOccK1RD5DapvCArz77Qvgm2EGXNh
	 WplXKy5FtJ5sqTT7mbIMwLr4pOa5LciAogOvYPPEe3ifDfJzMCUZGRJj5kXDYWxnaSs9N
	 3IFDI5NUivaKhFnpjAoQvTWTM42if+uxwK+a/m7iHcXisyDpoJzRRkcNRLwUmfR79dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mOsUt5+A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC0606A31B
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 20:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mOsUt5+A
Received: by smtp.kernel.org (Postfix)
	id 9727D1F00919; Tue,  3 Nov 2026 20:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2DF1F000C1;
	Tue,  3 Nov 2026 20:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736344;
	bh=1hkvoDg+3BOR/v0KX7OAFIh7T2rQSAFDO4jyUAIF0zU=;
	h=From:Subject:Date:To:Cc;
	b=mOsUt5+AB7S+0aVW1i23+Beo0iSJZP3WRg/LJJ+SSBtOVBHFgYRhjbT8L87thOjCO
	 gDwmPuJtLxAkZGKdkH4TfGMB5Dpl2Pz64xG8FnDAuCX4TpdDgaICTYAYp/NxtNUSsQ
	 ef/MlJdpssi1Pmm5cLN2f+JYUAxEqw0+4ZXtDXnEx4xN4RixzvUb/B7oLbi/t5yk7W
	 w/Cwn6zqf+Cs/tzz2RiDLP4jYXwJaeocTNYFKtifJpJJQWy/B062l4yx+d4GCiH1Tb
	 GHm2gq7fItLSjjM/fObRQYjG4scxtjPEQx595Y/YCbX3MrXGu2Iv9ZGksBhIxIV/vw
	 Hsm5H19onkXaQ==
From: Brian Masney <masneyb@kernel.org>
Subject: [PATCH b4 0/2] review: add support for b4.send-me-too
Date: Tue, 03 Nov 2026 15:05:33 -0500
Message-Id: <20261103-review-send-me-too-v1-0-0d23443820b7@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0Q6CMBAEf4Xss5e0FYn6K8YHaQ84E1vTQyUh/
 DtFHmezMzOUs7DiWs3I/BWVFAvYQwU/PGLPJKEwnHGNteZI24l/pBwDvZjGlMh0J2cvxoWzr1H
 Ed+ZOpn/0hrbGfd/00z7Zj1sNy7ICnVuYhXoAAAA=
X-Change-ID: 20261103-review-send-me-too-0f521902d8c4
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-17634
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=Ks00T5BCv6RezpizTU9eGgaE/tWNQQacwbtVUERHvqI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJe2U263m7ULMirxzTva+HtPu2zfS95nrIzbnv//cUbz
 fA7K9rqO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIqocM/2Nj7T+yBalOz//L
 36u9X/XqjWmvFD/qznS2/cNyVHPTCntGhu3KyYF15Tq1vwtmx/eXSP4IUJNa3fW+a8qxT85XVl5
 o4wMA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The contributor side of b4 already has support for the configuration
option b4.send-me-too to make sure to include your email address on any
outbound emails. Let's go ahead and extend this to also work with the
review side of b4.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
Brian Masney (2):
      review: add support for b4.send-me-too
      add tests for b4.send-me-too

 docs/config.rst                    |  5 ++++-
 docs/releases.rst                  |  5 +++--
 src/b4/__init__.py                 | 30 ++++++++++++++++++++++++++++++
 src/b4/ez.py                       |  3 +--
 src/b4/review/_review.py           |  1 +
 src/b4/review_tui/_lite_app.py     |  1 +
 src/b4/review_tui/_modals.py       |  1 +
 src/b4/review_tui/_review_app.py   |  1 +
 src/b4/review_tui/_tracking_app.py |  2 +-
 src/tests/test___init__.py         | 37 +++++++++++++++++++++++++++++++++++++
 src/tests/test_review.py           | 20 ++++++++++++++++++++
 11 files changed, 100 insertions(+), 6 deletions(-)
---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261103-review-send-me-too-0f521902d8c4

Best regards,
--  
Brian Masney <masneyb@kernel.org>

