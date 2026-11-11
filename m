Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402776;
	b=V67x51W4LDn3/7HPENzDHASu9y97hArssj4PCLlRaf4UERm0jjyX0w5AIL4OPiDw+CER
	 UoUXTJrvYc/C2bT4GPBgK54ifoaNAw9a9dFCBg/eR7appIUo8nm/rDutIR7SZhYUKy0m8
	 CElwLM9k4COySFKuar7K6Xd2ppBj2GKoiLbTOV0nqa6P0lYH4lTVCLg5VG/gyQRVRZTDw
	 LIFRdSKq/THRXIaAiTsQt1AO4SoMFNZ1Amgwo5WVpy97Ybt8ftUlgRQUfvqiHlFEAJ7Vq
	 uxdzCbZ6rb9se2rAoQZSVf8/Gtt0oCqtg7a8bl94CnCYr1/y1en9WeaicPlmsVWfiAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402776;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+DWopcNeIFPCC3ujq+GVBzUii1L3ti2h9U8AYB+Vz5w=;
	b=slesQi0PUqiMNbyieBBtrxXO7zwxXetCzMwm0q4ByzRmts2wo3glB9i+I7U31svCSJxB
	 jtQkO1GFBRzR2ANvih+4cbmzh7Za4/1Vc4oOo+eyrV/ycPSYsZebEPgf0awPW2qJg1vmz
	 CAvLPLtBxpJ3ofrX5WRXNOmsOj14xMOQqNm0KRFzoVktPyBaEzvQWiO+ZCGxW9zPAWZmP
	 4r2GapLv2hP+K3AC4tCcg0uCKPT3dr+9xckOHeaWBHsRb8gG/WLI4Shs/SYTDcLw5CW1e
	 8rbYrogLvvArpUS/7FhNZPiuEw9KYMDZMCo4fLP7SphSHc9HvMLX7nSosv2hjMN4/rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ULIw/2mm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0A6606A327
	for <tools@linux.kernel.org>; Wed, 11 Nov 2026 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULIw/2mm
Received: by smtp.kernel.org (Postfix)
	id 210491F00A07; Wed, 11 Nov 2026 13:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6563F1F00A05;
	Wed, 11 Nov 2026 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402776;
	bh=+DWopcNeIFPCC3ujq+GVBzUii1L3ti2h9U8AYB+Vz5w=;
	h=From:Subject:Date:To:Cc;
	b=ULIw/2mmNqZ7dquWpPILzGwfHmK5x2d8QLkUK4Xzv5jdRpHQFQwEIn/8D8b+7NYzm
	 wRSxrTE393Mt7V832cKNiNrWeUYYqP3k+4v6zdgcPiGeMJDOxkytkQ7skLJGmBI1cf
	 nETHnoi9cdbij7bpgPMn1Ks+kE/u0nLA2HM1azVUVV0uKEu0Vw8oIuNaDuNbJpMK3v
	 x5Xks/pNBtvyGUN3/wNVUdLRUwIeSIsCZtyHZbQdrxxjsw7Ff6t4eZgGBj09XfCBrK
	 t8nvZkJaTGGEPePFL28tszJCrZ+k+ex0AEOHwabZyFEoYbH8Zo7LzV7QtP83QjtYo7
	 dbrU8uu5Zzq3w==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH b4 0/2] review: tui: Make series level reviews visible with
 no cover letter
Date: Wed, 11 Nov 2026 13:12:41 +0000
Message-Id: <20261111-notes-no-cover-v1-0-b9b0d883742b@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAMlp9GoC/yWMQQrCMBREr1JmbcCEVqxXERc2TtrfRSL5tQild
 /ersxh4A/M2KKtQcWk2VK6iUrKBPzSI0z2PdPIwRjiGk7e4XBaqtYtlZXWhTb6LqWN/Juz0rEz
 y/gmvGFrc/pu+hplx+Zqw7x+LUDvmdgAAAA==
X-Change-ID: 20261111-notes-no-cover-24f15cf5e98e
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=broonie@kernel.org;
 h=from:subject:message-id; bh=E6abCqonZxSdaQHmoheTPGjZpj6EE0roUK6RUy+emLo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+ZF697/yUyXemrPhD1klZOZf2PWre+WyT9K6CdB9tn
 eYClZzWjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEykR46RoTmoMzvec5G0GxtL
 iciOBbV6PQ6h8jt3fvaxZ0rbNeW0NsP/WhXOa1v49pknbrunL+BkqTC/5d7kDfNeVIv9uqEfduE
 uCwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently b4 only displays series level notes (such as generated agent
reviews) if there is a cover letter which means they are hidden for
single patches or any multi-patch serieses which lack a cover letter.
Fix this by showing them alongside the per-patch stuff.

---
Mark Brown (2):
      review: tui: Share review ordering between note displays
      review: tui: Show series notes when there is no cover letter

 docs/maintainer/review.rst         |   5 +
 src/b4/review_tui/_review_app.py   | 100 ++++++++++------
 src/tests/test_tui_review_notes.py | 240 +++++++++++++++++++++++++++++++++++++
 3 files changed, 308 insertions(+), 37 deletions(-)
---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261111-notes-no-cover-24f15cf5e98e

Best regards,
--  
Mark Brown <broonie@kernel.org>

