Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792635;
	b=1ykRPChtlde80jzquoyHLKFxvZgAD6FcandxhP/kGEtV2nH1/uQVo0A/rizY7h4P5NtO
	 lnPl8vFiE9aHDmES/iGwJhPP8U2lk18MPyQ1WaLlLtSOcCsHEHHcxM0C1rPkYcGyVgVPy
	 jCtqnDr6/FFxjy59AIO8Z9epQZ9ZnXreqCJhra2FJB5a5aXxKEu4aBMF48ixS1ltadEZS
	 POdbzYR4UH1R2HosZlnVT3BCN6/sekeLLOK2FvHcouDfVf1E0K4ApZMYGNYI3oQdcDhXm
	 9FwPpMJw68jLoG43BtY27oCZ9QRcICKhBwnXFfAoNIdjB0Ud9HwQePtweUhuhDYdUWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792635;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HojYVAdaTrgzKm5G2rIwe5QJh4BoFxJKeGGW43h4Tb8=;
	b=CqA41KaQBT7xK2QnODZyh150Ql/EVv8mzZwyALnxTIjZx1ydSWPV3vEoX/r3ECK7X63S
	 W+24gQHsu3GmOmGNbbjcKuWvDquGeeVxiWx87D0kELFrw3Ff0H6hvvy9mMjFbRSr2ievU
	 zcqntjMAVHXbWCsmFggLyDlij/OChRlKGlVkUSg7hMYATW1UgPFQUoibPzK9OnPXwTUqf
	 wduQgof0HS2P9ThUyGomVLrGn2e/nVITkMy8dkDDYwYzzrFHSlUYCGBzKeSo6A2VCuyu2
	 M4ysjsNqqFzFDkRjOjFhRGa0d8K8lNoi+eIEyWq3ok5VWG+ZlLPHpKFdpEFHjjL9lLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXR1RFmj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DF6606A31E
	for <tools@linux.kernel.org>; Fri, 27 Nov 2026 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXR1RFmj
Received: by smtp.kernel.org (Postfix)
	id 6126A1F0089A; Fri, 27 Nov 2026 15:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9090E1F00893;
	Fri, 27 Nov 2026 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792635;
	bh=HojYVAdaTrgzKm5G2rIwe5QJh4BoFxJKeGGW43h4Tb8=;
	h=From:Subject:Date:To:Cc;
	b=AXR1RFmjEcTHdWCIc0zfQWc2NWfKCqrmLUJxN+dbd1AdfLkWfrjzvRPmBsPA0vdxi
	 IRoSLJz3ePOumcVpEQhWQiUZcijnw/Rksh6cda/1zObY/KYvP8mD1yXQbLtUuQJrfh
	 kNWTZ19DN/Jxx1TEMj6HjxNwSHDnTV9+WQR7V21AfgMYaw/hx7FMlA/XmNuguQ4Mw3
	 CUXb8WaAifgCkS9Fflna39oJI8P1JRQ00WzeEp9FUBMsmjJ5KlKbznvJaIuVHkXiN1
	 7tbnD/YpU7ycjOtU+t3LrHghQjTXm8gJd1tJ2HnrZj8JQSbnEytpOwQcSnDTDzKd+W
	 Oc2RgsZk7/YMg==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Subject: [PATCH b4 0/2] trailers: keep comments between Signed-off-by
 trailers
Date: Fri, 27 Nov 2026 16:17:02 +0100
Message-Id: <20261127-multiline-trailer-comments-v1-0-ae8360525615@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTuQhGCjVxEXbZzqSJLKTFqE0
 rsbdfn/4m2gJEwK524DoZWV59LCHjqIj6HcCfnWGpxxR2tdj3lJlRMXwioDJxKMc85UqqIP9hT
 6yVsTDDTgJTTx+4dfYPRw/T9dxifF+lVh3z94a/R9ggAAAA==
X-Change-ID: 20261127-multiline-trailer-comments-481987f41080
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=HMBbswCAz74Fzui/hpNqwlIZiZlK+5ogFJ5vF8IMpqQ=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGLI55/0Q/Ssgwn0ler3FKt6wYvEFk/omvXL4aGznKdbD7
 dHm+KO5o5SFQYyLQVZMkUW6LTJ/5vMq3hIvPwuYOaxMIEMYuDgFYCLHfzD8D5b9+GL5usq9hS0V
 EidW6S6ZlnJsxvuXz5dmxJ9beyH80A9Ghqlb3Te33dZaEPH1RsvG4+YrM40rrzfPODJhh7taa7P
 hbUYA
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

'b4 trailers -u' and 'b4 shazam' move [ ... ] comments spanning multiple
lines, placed between Signed-off-by trailers, above all the trailers.
Such comments are commonly used to describe modifications made to a
patch after its original submission.

Patch 1 keeps these comments attached to the trailer above them, as was
already done for single-line ones. Patch 2 makes sure such a comment is
not dropped when b4 moves the user's own Signed-off-by to the bottom.

Feel free to drop the second patch, it was only useful once for me when
re-testing something sent for the backports on another branch instead of
doing a simple cherry-pick :)

Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
Matthieu Baerts (NGI0) (2):
      trailers: keep multi-line comments between Signed-off-by trailers
      trailers: keep comments below our own Signed-off-by

 src/b4/__init__.py                                 |  40 +++++++-
 ...lers-followup-custody-comment-ref-unordered.txt |  33 ++++++
 .../samples/trailers-followup-custody-comment.mbox |  45 ++++++++
 src/tests/test___init__.py                         | 114 +++++++++++++++++++++
 4 files changed, 227 insertions(+), 5 deletions(-)
---
base-commit: 9efdc3c47439006a0bd2e34e976c3c009bea3418
change-id: 20261127-multiline-trailer-comments-481987f41080

Best regards,
--  
Matthieu Baerts (NGI0) <matttbe@kernel.org>

