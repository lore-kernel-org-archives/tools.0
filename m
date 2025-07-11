Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C72C159D
	for <tools@linux.kernel.org>; Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238103; cv=none; b=tm5Axia2sTyNdA8+pWy3NU57s71NUcvnEeiFvXWb9iDXFoWi2TxbhX6HHOaIPe7WQPbth/XCkG0KaZ/PPI0gAY/DElw7iijNDlmQx0ZqQbch+fUaczSnllZ4HapFFtvOsZed/S0n96aC9j5OvcL7opsZLezNgyxTTN4NkEbjhgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238103; c=relaxed/simple;
	bh=fwHScP4CevQU44aZ824iYyYiSKY4ybSWzP82Z/1iJQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mv8pW7xJ7MpH/tLGPFgiuiWjRFCIAf1NFLIfsc5DQYwauE80+GTmYiNX00Nm4qjSeOscwugxqIUzf4TD+1F7uxgMrVZDphygW3uoNUkn46kLJU21eORVXujpiGnR898dMj46N+rk9TbMv0Q0D5Zjz6YuTAKtjEc2kjZ4rOHoPpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hcj2fjjl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hcj2fjjl"
Received: by smtp.kernel.org (Postfix)
	id 21BF9C4CEF7; Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B986C4CEED;
	Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752238103;
	bh=fwHScP4CevQU44aZ824iYyYiSKY4ybSWzP82Z/1iJQQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Hcj2fjjlWqaxElEN48fkxLJmAXgsBH7HNxWtYO9pifCP6P9tKlUlazUcbrslcL/h6
	 VC41oigHHIGtj2aNYgLIrU5fuh3bG2BNmfhRx8IiK2uq+73ESfQnY8iid5lSoSgg8D
	 vpPNvXBQ1FzC6X4o8IDLRC1nEnkGDTU1Atm+ykE+SdGiqHE1QeKNZ2Vq79o56Hi9Eb
	 cusTCCGFW/aVdBMjknCVt0bRkPqec9B8T3MFY+gnvPw8QD3CystC9F/3MaXYTZuHUV
	 sjB5vVeu479/VSG9NpMPX8HzJrO1N8ODE30Xjvg7bmV3VYMl/drqOnfd7c2bdTx9jM
	 RSI6ncBuw0umQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90AEC83F1B;
	Fri, 11 Jul 2025 12:48:22 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Subject: [PATCH RFC 0/2] RFC: bracket prefixes
Date: Fri, 11 Jul 2025 14:48:16 +0200
Message-Id: <20250711-prefixes-v1-0-c8d5715cc521@non.se.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABAIcWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0ND3YKi1LTMitRiXWNzo2Tj5DSDxDTLFCWgcpgEUHW0UpCbs1JsbS0
 Agrz8718AAAA=
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752238101; l=1336;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=fwHScP4CevQU44aZ824iYyYiSKY4ybSWzP82Z/1iJQQ=;
 b=AAEBZm9aTojfcEHgmSZjwg2mPaGCwECfIK28a5R73Kqpz/7IX85dOr1FBAZGCtwR5LVD1x80a
 fjupTRCcFXBDpp6wgcr9/7rsrBtLfxJ0fNBOwSe9qUTyRVpO8vYMkiw
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com

Several projects such as meta-openembedded [1] or meta-security [2] require some
bracket-prefixes before '[PATCH]'. The issue is that prefixes are always
appended with spaces and the automatic '[PATCH]' prefix is excluded only if we
have a prefix 'PATCH'.

The first patch suggests to exclude the automatic prefix whenever we have a
prefix that ends with '[PATCH'.

However, it gets an error when sending:

  Reflecting via web endpoint https://lkml.kernel.org/_b4_submit
  Error from endpoint: This service only accepts patches

I suppose this comes from 'send-receive.py' ran by the server. Therefore comes
the second patch to make it accept any bracket-prefix. I was not able to test
that part.

[1]: https://git.openembedded.org/meta-openembedded/tree/meta-networking/MAINTAINERS#n3
[2]: https://git.yoctoproject.org/meta-security/tree/README.md#n77

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
Louis Rannou (2):
      Fix usage of PATCH in prefixes
      send-receive: accept bracket-prefix before '[PATCH'

 misc/send-receive.py | 5 +++--
 src/b4/__init__.py   | 6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)
---
base-commit: a9b2aba54be85ea2933c43b8a6d71c1611230b59
change-id: 20250711-prefixes-372c3cf0af9d

Best regards,
-- 
Louis Rannou <louis.rannou@non.se.com>


