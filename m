Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FFD345EBA
	for <tools@linux.kernel.org>; Sat, 15 Aug 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786779206; cv=pass; b=X7MqxI4Kk+8A4UcU7R7wKO7ojnXU1S/aAGKTQXzcUJHjn9vHBONHr9ydQ0jRPjbd+6NYz0bweznqXnnoQK6md5MeFcvnsvItX+Iwqn/DSifER+X8pTtS3LbQ/MKQjqmVBdfF0V0aCc5TXbUjvlqCs7HfR7W1MsejEt/9a7inhSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786779206; c=relaxed/simple;
	bh=Ettouu41544xanEl70Ol36vWBCwBm35kr0VaENjlNdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NjcngAx/Gqhm1PR05KuFftWzAiABjtsluLBwB6sBUGzFLL3XeuhGamOXMzIVGHAUVgex4E3o32aDjtTqIHY96nssrhXjRM+DUoBJCU30gNyCjEWQkWePZBzdXTascDWq8UruwMp7J9carg5XUmKJsT293l2f2zvgSjPdYdDTcks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Jm0PqCuU; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Jm0PqCuU"
Received: by smtp.kernel.org (Postfix)
	id 48D401F00A3A; Sat, 15 Aug 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=91.218.175.25
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786779204;
	b=gOEGSGnT7man9VepPnBZ3LHGzToFG3rvAiT3mteQb6BWTwET1xwwXDuq6LODdj8RKFj0
	 HSPDSBunSa3GJ61QPFc8OOckouc9lIMsAD6wo6J5mnfvlaaMYLZrbP+pSg7fVEIPyC1sN
	 NmtlkB7P7HS9E7WmQnt5lOHTUrf+hm+VH3hnNKPJm4tlPEcp3BXbwDMV+lr3NwhyCUoBI
	 esHQ54t7Z3RvKl4Bh1kmHpervJ478UUv7/lyzRAKMpqz51sozvqzVSPPijry8VUJLDBXE
	 jRG97QNsMIb2uRTKErpNvzl61r/6YkwjaQDe/eMKLNIFyNpv2/Ss15msKuYFxoOwxyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786779204;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tPpMzOdnabh92CZb//7qBUD2S2Eq0dpISXjYHviI/8g=;
	b=g36NVazHkqFcsd9zN6YoFlSWQYzvS77Ou2MgMbMG/KcB5PXv9CzAxfI/B/PC8T3UULod
	 9RJ7kEPQ4AaVMxFSf0ezVqd4xXFWHPnbJjgcWFKgPNDeGkOS53Mmmx4ngwFC5nbGrEIrH
	 2M03RVV+0i2CPNVN/ydzVD3kaDujov9nubS9nQowuo5NPqhYujotbgRm52+prkUqI6uAL
	 SyOcks9K3n5IOW5jCUlKRku+yTzcTdtF5VM17l3u9C7PDy6nNmWaWzQn1aiLi9CUVjH+5
	 pRDL7BUAq5NYSae/+4XMtQt0tw8Ea+fkwX4aJthveOOnijSMuRprUw/C5rae1rksLyA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Jm0PqCuU;
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=91.218.175.25
Received: from mta0.migadu.com (out-25.mta0.migadu.com [91.218.175.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E911D1F000E9
	for <tools@kernel.org>; Sat, 15 Aug 2026 07:33:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Jm0PqCuU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E911D1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ettouu41544xanEl70Ol36vWBCwBm35kr0VaENjlNdQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786779200; v=1; x=1787384000;
 b=Jm0PqCuU7/Dsk2fJoDHmw5h7qqvdvX0kX0vO4ZN6TKMrysS9PKHRQV2yx9D1stevM6lNKj7k
 O7a/syvoc4WgHWfnfre//vTEKICHWaogx7MZPp+cIvTXXuGqkLwzwGEvfu366g/Bq5wugmKXq/E
 4ZG0Qvjr5sXd92kbqbXLML5uxhXDZCfvSKydeUsWxYzuufw+YNpAIwpyQCNPGsrRO8vk7M+P8Dt
 NAC5kKp0apoqGv/eaZdvWfhy0o9w71y37jWLvYOTTUJiPQuYzzfRDsXwqinx7ea11DYWo09qHMs
 GLFYjmimCAs7NWTBLJvQBBLvjqBewN2mgotcWa77m4o3w==
X-Envelope-To: tools@kernel.org
Received: from mbp.wyuan.org (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 57901b8edebf61ff;
	Sat, 15 Aug 2026 07:33:10 +0000
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Weijie Yuan <wy@wyuan.org>,
	tools@kernel.org
Subject: [PATCH b4] send: honor excluded addresses in per-patch Cc summary
Date: Sat, 15 Aug 2026 15:32:54 +0800
Message-ID: <36067800fe19dba18dc4874edfae524346b4ed1d.1786777097.git.wy@wyuan.org>
X-Mailer: git-send-email 2.55.0.717.g61afef3e370b
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20260815073254.S5ffVZo-GJdw79bgmrkrIxa4hk3P3JqnJsZwwSh-83E@z>

When --not-me-too or b4.send-me-too=no is used, the sender's address is
added to the exclusion list and removed from the final To/Cc headers.
However, the pre-send summary prints per-patch Cc candidates without
applying the same exclusion.

This can result in output such as:

  [PATCH ...] ...
    +Cc: User <user@example.com>

even though the generated message does not actually Cc that address.

Filter the per-patch Cc summary through cleanup_email_addrs() with the
same exclusion set used by the actual send path, so that the displayed
recipients match the recipients that will be used.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 src/b4/ez.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 79a630471f32..020d06def8cf 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -3046,7 +3046,9 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                     if pair[1] not in seen:
                         extracc.append(pair)
                 if extracc:
-                    b4.print_pretty_addrs(extracc, '    +Cc')
+                    extracc = b4.cleanup_email_addrs(extracc, excludes, None)
+                    if extracc:
+                        b4.print_pretty_addrs(extracc, '    +Cc')
 
         logger.info('---')
         usercfg = b4.get_user_config()
-- 
2.55.0.717.g61afef3e370b

