Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A2B21B9D9
	for <tools@linux.kernel.org>; Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752674651; cv=none; b=e6/IfCbOJSkbrW8qZXm0gjSyYs1N+RPcj8LthDOo+B/UffQviZD10/ja2MAK+POZIt+7uCqjRy/nqTvWWAjitF2jNrOCwBPn8Svi2DZ0N//6r7UCM1T8aHaiNCP482NPQqRm9hBWpbz4OoXxzB/FHsB4j7cn84+dn7Iu6IYIpTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752674651; c=relaxed/simple;
	bh=ILEGjcyd+kF4O5nnAJmp2Ep0HbYcC/upkEuRQKVbjDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V99vlzSmTHbIhmTvOSVvDdbeC9RFB5SX0sO2wpFMhXJf4rvQEnuMpIXU5fBqV6yBXDM0/2blac/5PU2brPjvqfiMR+FfbEeJG66O2BeV9Eo33TkkNajM7NV/tkYo7CU87TrfUXVuiaV/GHb9U423ML7qaLFgcry1GKoqXaJgVZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H24mIU5Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H24mIU5Z"
Received: by smtp.kernel.org (Postfix)
	id 6C4E1C4CEF7; Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 562BEC4CEF6;
	Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752674651;
	bh=ILEGjcyd+kF4O5nnAJmp2Ep0HbYcC/upkEuRQKVbjDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H24mIU5Zsvqw7fSUdtkStXFpAja+MFMpgrckpmY+v7gm7hER670kXvM3lO5JFq7Vl
	 VKEDkSLcEgWuQ4/StnMkl5SJUgbLAnbPU+lKLZqysUgkEBWmX3BTUfZYenxhVKPixK
	 yK1RORYdefdPY/Oa8/4zRPbAG/GzRtU1987e7KyYLFoYjU1TWo+EFHM+AYx+1DNCEH
	 djUou9TD03az4lh3o8UuEf2G31gxurHlL1bcusVJkcr9ubkAIWitvuOY0QoZaikMXm
	 Ve2qHVEjIdf95no6wNWgDXu3bCsW8FPtQFcpCgqB6rmPYFXnKsYPnCbPRoRGBN1K0d
	 g9SNFHbYhjzdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F00C83F34;
	Wed, 16 Jul 2025 14:04:11 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Wed, 16 Jul 2025 16:04:10 +0200
Subject: [PATCH RFC 2/2] send-receive: accept bracket-prefix before
 '[PATCH'
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-prefixes-v1-2-b8652d4de0a6@non.se.com>
References: <20250716-prefixes-v1-0-b8652d4de0a6@non.se.com>
In-Reply-To: <20250716-prefixes-v1-0-b8652d4de0a6@non.se.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752674650; l=1336;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=kAkV02g7Gz/O8wHv7cuyXl69EEnMYrXcM4k+aRHsAxI=;
 b=WAbopOdLb4pcZRpM+vLVrPXVp5jspBJfnRRj1/prtbwBIlNbsPrVpEnTJf0FotS8aS6aH+djR
 5HfwirhbAjJDBnqePz9N/aAa+MS601w8uLknpA5oZTv1dZvUioh+9z7
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com

From: Louis Rannou <louis.rannou@non.se.com>

Change how send-receive checks the subject is well-formatted by accepting
bracket prefixes before [PATCH.

All opened bracket must be closed and text is only accepted in brackets.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 misc/send-receive.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/misc/send-receive.py b/misc/send-receive.py
index bb65aaa..d574054 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -433,12 +433,13 @@ class SendReceiveListener(object):
             msg = email.message_from_bytes(bdata, policy=emlpolicy)
             logger.debug('Checking sanity on message: %s', msg.get('Subject'))
             # Some quick sanity checking:
-            # - Subject has to start with [PATCH
+            # - Subject has to start with [PATCH or has only bracket-prefixes
+            #   such as [prefix][PATCH
             # - Content-type may ONLY be text/plain
             # - Has to include a diff or a diffstat
             passes = True
             subject = self.clean_header(msg.get('Subject', ''))
-            if not subject.startswith('[PATCH'):
+            if not re.match(r'(\[.*\])*[PATCH.*', subject):
                 passes = False
             if passes:
                 cte = msg.get_content_type()

-- 
2.43.0


