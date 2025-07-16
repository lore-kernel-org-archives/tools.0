Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2221ADDB
	for <tools@linux.kernel.org>; Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752674651; cv=none; b=UxvTWJ9qfvxZkDyaiomNlIIP0CNZoPSiuoBAI++alnb70lILlYREKza0p30wCzBhF6fZwlaUHw5bEFnuam16QBvmfLF7ixC/Myvz7wBVWZvkewxmi2Wo2KjzsFzJ/I00VPhs7glgAEjykspfUvdLvrRTVQzM3fsiveAtUvnqVfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752674651; c=relaxed/simple;
	bh=fwHScP4CevQU44aZ824iYyYiSKY4ybSWzP82Z/1iJQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UI5Uag+YJge3JtDMLZxVJWj9waCHcvLwbNV50xtEszcxPNO8h0elWAMCmL95YKNeE1uAXJFjhuiC9zmRBWagGnL3AUBWzc2m670whVCeo82FuBciO01QNE9VMCAyB0jP7qE30+ydl/DDKDXifhLuUFLB3ZG3v3x05cJKj053Sb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSXOQuXA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSXOQuXA"
Received: by smtp.kernel.org (Postfix)
	id 531FEC4CEEB; Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C626C4CEE7;
	Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752674651;
	bh=fwHScP4CevQU44aZ824iYyYiSKY4ybSWzP82Z/1iJQQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JSXOQuXAGeRATP3rRTW7fvHSWODS07X4MY/9bKXlHTeIrB68xts6kSs3FuA37wW0L
	 bJbwYCouD7BTDJRf8QbkKUPe9Sz0R0AylbOOw4+gynrFD24XGUOzn9VnKuHMeG44nO
	 qy9N2VOI5NMvZJm1Akt9GmNZSnwNIzmJd76nbBClwrCy2EFy2KuM3Ihein+oioKCh5
	 gG+LcwulutyiWGD+oy4t0QL1dsSmpGy2ftpYtRK4uRNLWjTPIGyOZJp3hn+UCK03bH
	 JPT8X1dXWgCh/OUl9QG7rzWg5XpL+h4LsHjT33arnI8o4qLu6LigrLdYXPtcSBQk4F
	 XPEwCbbZtCXqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127D7C83F27;
	Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Subject: [PATCH RFC 0/2] RFC: bracket prefixes
Date: Wed, 16 Jul 2025 16:04:08 +0200
Message-Id: <20250716-prefixes-v1-0-b8652d4de0a6@non.se.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFixd2gC/2WMQQrCMBBFr1JmbUomJURdCYIHcCtdlMnEZmEiG
 SlKyd0NBVcu33+Pv4JwiSxw7FYovESJOTXAXQc0T+nOKvrGYLSx2iGqZ+EQ3yxqcIYGCnoKBw8
 t/4lW3+B6OcPYxjnKK5fPdr/gpv6fFlRa0d5bh5bIGjylnHrhnvIDxlrrFzKWJbemAAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752674650; l=1336;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=fwHScP4CevQU44aZ824iYyYiSKY4ybSWzP82Z/1iJQQ=;
 b=q1bjDwnkeffm0gPp7MySx2ReHsIWKodoYy3U3HcS3R+DUUZhZKvqyypunHPSpy8cImPOyaPDE
 OxQSFWwnRlRBSkuVaP2H2Y90yumCoizAUiwMJAn3dsuc9kx00wx9JnB
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


