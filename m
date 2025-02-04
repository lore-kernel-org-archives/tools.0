Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A092AF00
	for <tools@linux.kernel.org>; Tue,  4 Feb 2025 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687523; cv=none; b=Uz2U1F+orukiSoa8Qrj3dfkxYJTFUhPsfiYaxO82eNsiIShTqwsc6GK9+7rWR3NI5Rpga1j0SMTOJ5J5hU0d7TCMCgAH66n+5vXgUEtTLStR0JN1TQvZovN0kRD33tziCzgk0ULWgnBpeezhmiAKBwE+vJqFNsIBksYJ3yzIiq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687523; c=relaxed/simple;
	bh=8Gk5P/DMQvE+j/iKtyo4Pz+5B0LsH2H64w2b04EB8nY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=udF++D5vqnJtpOA2KyYvyMIPLIrJcWtj+g0Y0M921SWzdF3skQ4TGoRplLQ3ikYHKr+mZNWnxbk8nRvHx1Vly3f44KwgM6hSV21S6Cp3hBitkFcGUo8FfLOC0iHDYuDHDFRJZ5GQHSFuj0p+qe7dxzTdohD96IhZ0DxBrmktRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SDsl1BCU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SDsl1BCU"
Received: by smtp.kernel.org (Postfix)
	id 2F7A3C4CEE2; Tue,  4 Feb 2025 16:45:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9585BC4AF09
	for <tools@kernel.org>; Tue,  4 Feb 2025 16:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9585BC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C337B4427E;
	Tue,  4 Feb 2025 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738687513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dX4ZkXRXAFypL9h/RoR/rJdGhZfMb7+pXm70quZluHk=;
	b=SDsl1BCUyTQRZRqvs5w27tLoQJH7TIR9+SBF/VYooG6rD1k93wX4J10TXlZG1ejLbdoswV
	3nvtlq0tyzNBPiuRXLEvFFin7NzYeEWFGhxjxWSqi1As5PyCEgyIKMZ2KSylh+ZlqZEK/1
	Fh6oYeOx2zyBN7oDERtFUOGdyx9Wspwaxt4qzASSlxbNtKc+4LSjaA0vie1kyOHfWC1Rki
	NKFRNyqXxWJzwzbU712QxCXt3hVJPTiEYpAUzaOtcJ1eIQKksit5mSBtKicpjsKLPypIRf
	Tek6dTHBCjmHiZmtmj4urQAVyKhxzv6nWgH9T72xVWUl1JZ97v3PmiZXsi9+HA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH b4 0/2] prep, diff: support overriding range-diff creation
 factor
Date: Tue, 04 Feb 2025 17:44:15 +0100
Message-Id: <20250204-creation-factor-v1-0-9988d594a018@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9DomcC/x2MywqAIBAAf0X2nGD27leig25b7SVjlQiif086D
 szMA5GEKcKoHhC6OHI4MpSFAtzdsZHmJTNYYxtT2k6jkEtZ0qvDFEQj9aYdnPG+QsjVKbTy/R8
 n8DXM7/sBHr742GUAAAA=
X-Change-ID: 20250127-creation-factor-ce8069a0bb3c
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8Gk5P/DMQvE+j/iKtyo4Pz+5B0LsH2H64w2b04EB8nY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnokQYYrpWDniWW8tr/XcdurJdEptwDqu8QLgDX
 7PORyt1Kx6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6JEGAAKCRDRgEFAKaOo
 NpNND/9EbqEZT1r+8S4fmdOifuOUH++5AyH47hyYGuRAQcTjIyggTQc+OJf+T70wspnvoNx1WW0
 SSXhLPUrvU2TQPWGs7S8GFArMTsbubnlbwdvVziTjhFzl90vnQgTlyvVQBDeBzH9Wlmazg9Aq8z
 nyEc3mHmty+KOxIlI4l/pUGhympNDnuqc8l92Satz+FPYSoQwHsmRo/gfziCw9CUmroWvy0E2ar
 zsLk5capheMJZsHY7x3WL5wJ+o41eIWbueZK7zUfjK3+F+2iSAtuP9PxTdVwbF8ljT6jUxrbBh+
 ZU2OJFHYBHeEyabCTzpeTABeELR4NE6PadCbVnsV2h7zavfhKtOAWX3efNOQVwYR59voaLIBzWO
 k2AaIc3EIq5cE8Oo//ERW2nLQZNZ0mQlgfy4bfq7zIrMEhKmyfEQMtGsNuPQuYRzNngQEO6ajOE
 0lRMbTebl5WJcVnn+7xz1hnMjv1HDau7El/MkuRPDIiquLT6qwMJxZsOvup1qGJvzYyVkvZ9yFn
 r2+ZWQLHW2kbyGKFQlkWV0jImvjpJcAaCHiTJFvbVEfGfDmZyaeAeJdzGi0HOqvWIaRoW9UUgBI
 c+qDrIAFdywjFDeCWrC0pqNRLeQ7j9yt0GfTa4OUvU4OvkxVk8U3GhOLf3NuY5Eb/QLpy4ardmG
 VnpHCT1i3a2EYsg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddvfeekffetleeuvdfghfejgeffudevgeffgffhjeetjeekvdfgueevtddujeeknecukfhppedvrgdtvdemkeegvdekmeehfhgtudemiegttddumeeivdektdemkedthedtmeekfedvvgemvdehkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhehftgdumeeitgdtudemiedvkedtmeektdehtdemkeefvdgvmedvheekgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhoohhlsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgto
 hhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com

git range-diff allows to override the creation factor, which is
sometimes useful to adjust for seeing different diff outputs. This is
not possible with the current code, and is also not configurable from
git config.

Add an option to diff and prep to override the default creation factor
value.

I can update the doc in a v2 if needed.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      diff: add a creation factor argument
      prep: add creation-factor argument

 src/b4/command.py | 4 ++++
 src/b4/diff.py    | 7 ++++++-
 src/b4/ez.py      | 6 ++++--
 3 files changed, 14 insertions(+), 3 deletions(-)
---
base-commit: d23a9a2d5684369710bd2e416e41159193df3756
change-id: 20250127-creation-factor-ce8069a0bb3c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

