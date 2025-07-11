Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FBE2C08BA
	for <tools@linux.kernel.org>; Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238103; cv=none; b=Luy+cwY+JGOnHXFjDmBhNMnYS3fLmLOcPt3hgiqbO9/QnYeosrDEELMFVZba+2gUZ0LcIoq62Wov5L5fzY0FBXPYy8MCYKNAXbGJ7pHWhZMUkYKSm49oMaSGVGAjVMnwXKotFmAJ6VMWPrcSSofPChPny0i2iv161SV1EUwgPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238103; c=relaxed/simple;
	bh=ILEGjcyd+kF4O5nnAJmp2Ep0HbYcC/upkEuRQKVbjDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biIx5AytjYa8kHLeSpei94lV/x45/dlXfcMiN7RU+El3snRH0QEqGpxmzo7K6UR0i7VPjLHjbTcSUPlBgw060xLlGCnHaSD6t5U8Lv0dyZQPoBw78l49/cjifGV26oC6vIA3mO8J81y4E37hpm11h4cwEi/Y7ER1hzSrwq4EG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8FCNBEh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8FCNBEh"
Received: by smtp.kernel.org (Postfix)
	id 37245C4CEF8; Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21895C4CEF0;
	Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752238103;
	bh=ILEGjcyd+kF4O5nnAJmp2Ep0HbYcC/upkEuRQKVbjDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i8FCNBEhpzNv+pkDrtMhA2RohD4aDgddXtHlSeJzBXFUfllyQV2RiqnIW7wu7efjB
	 n5MWBQFbMNZjBqKEgwOQxKWGVrQ4SR82fjNwp9uCz0pscZX0GG8PwNP01toKwdzPuY
	 3T+uKoewXKWVAuy3PKfZ3srKvc6qcz02SySiGSKtMuNP61Auk0Ti1IkMMStrHrgC4P
	 A55/H0mKdWz265BdLbl0QiOHub68HoQuHfcPKUegHEWXq/75NbLsccTxwcbHw/Veo8
	 V9cLc88DlosLHhJDhfCfA+ZYzBK7CtpnJK2TtM5J1wg3u3veiXSklh/QJNcxAyvKoK
	 UL+6vq1s16iIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105E4C83F1A;
	Fri, 11 Jul 2025 12:48:23 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Fri, 11 Jul 2025 14:48:18 +0200
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
Message-Id: <20250711-prefixes-v1-2-c8d5715cc521@non.se.com>
References: <20250711-prefixes-v1-0-c8d5715cc521@non.se.com>
In-Reply-To: <20250711-prefixes-v1-0-c8d5715cc521@non.se.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752238101; l=1336;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=kAkV02g7Gz/O8wHv7cuyXl69EEnMYrXcM4k+aRHsAxI=;
 b=bS9FSGK2w6Ti+7BUnPJHacOyTEnYq2QX4P6Jp7PJwHLioHnHd6veCTqEwi/ttiWS9vIsid1wI
 NfLYbC0dsxCDVBu4+gCNj32mctEIECYBJxGYmAwjZOnu4VZeTpeIYJP
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


