Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD6F3BF676
	for <tools@linux.kernel.org>; Sat, 15 Aug 2026 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786778090; cv=pass; b=Eq9//1cQj/aTMJICE2JiBHKexKvZaJG30QPSwN8RGQTk+BatFYx9DGJQbfJy++7EZueXBlLBgUwD1tra8Is2MBNWKTfPBrEiSMKZFXj5D03X3dbuziaBjskABhBODkueCQcHlfT6ffKtVqr0WHWBqW1IXSSzSb39C6VkhlicnMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786778090; c=relaxed/simple;
	bh=Ettouu41544xanEl70Ol36vWBCwBm35kr0VaENjlNdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UV2IcI6XpjF+0yKf3XPrmVowXBUrlME3yz8hYGQBiIN+mTqRw7DLb88FIbk/9l7cJWTeXqMyiMe0yyuLqUd+CCvSTxWjNAJXsgZVewENROdD5Bx6kD7uMECPSpYzBGhW+zrGiJ7/U9DLxa57QZFzzF/wK6BLIyD5agPEA8g+ruo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=odazpESA; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="odazpESA"
Received: by smtp.kernel.org (Postfix)
	id 5C4B21F00A3A; Sat, 15 Aug 2026 07:14:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786778088;
	b=zupuwvRzdHqk7+lWfJdzX5hxYA9ZbLce6uGRhSJ4VNdr3g4AOIyPw1tsYU6GP3hS8cJr
	 GJs3CS2gSuZ3thBTisRHQKee+BbQR/5+ure5IOCwTKAhGt1kYLMbKpSfz/aPDfw9y/CHb
	 nxkIHd55oF4k3efuHPyMV5wrfmzB+vDpbm4nEc7/ZHKZxfNhHilDqNinRj+jWgApwVYzQ
	 1SP49JcIasd5mN3Zd8iol1hLiU1SGcgqwEu0Fj4Kh7B8jDvz/6shJBRTSNi0COnkoUC3Q
	 SjqmlIpOs5XGt9l3rsuJPQHPlkbO8L7bRBYAP/JntfVIzF/vJxNV+wxsQn7MuhzJEqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786778088;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=tPpMzOdnabh92CZb//7qBUD2S2Eq0dpISXjYHviI/8g=;
	b=hqWZ3HvT21fMKlrZzawjuEjqfyXoFisF2s5TCxZkaJ0dIBmu6rJ73/3oqXtrJYrFnQ+6
	 0ujupmNK/taC4vBeEULpjxBwNS122pKFWsgy17ggMXrpitNo5JlNMy5MmnGFvwNWYXSCF
	 CWn6C+aNEaFzw6wRvRH/eeUtPxLG/h5AWlDDDOC/V/FZnzIlPVibazRXcBbDXg8dWq1NA
	 FXGhABuKemZJd9q37V+HhWlGd7zlS+WJYJmdYbdQoW0TFuqcTJHTCxIWgWQGKaWuC6Ys8
	 yIymSFMzNRPKHJfYR78IrNP5yxsxpla9kemgluh9YN8ROl8ZzkJGiRAw2y+H/Rx2TXw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=odazpESA;
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5BCD1F000E9
	for <tools@kernel.org>; Sat, 15 Aug 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=odazpESA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B5BCD1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ettouu41544xanEl70Ol36vWBCwBm35kr0VaENjlNdQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786778084; v=1; x=1787382884;
 b=odazpESAKVj0xT7hzCIbUxtIXKqXoJla9gJslVnamuBvG+aKtxrJz1suGwihhVVjmeNZVEvP
 +aBRdNLunba9oiVoUkhXd5DWRBIzw8z/oS//b/nGy1TY55Z+7989NdIm32cGBaAtK7C1AUuwjYf
 xAl+EBWu6Z2wFhpCm247eEQxRL+m8e8EtymXaIQdA9qGaD2uXBRo+utYaKmVfahuR/LnvJVNSup
 946qYRa7LTkHgz57mElBYT1fMqyTiBrjzD7XXGV61gbR+NgB9nkRj6ZJR9i3PvnFXg4Brhff5RH
 FDiqk8+vs5RL86EPJbPQRH5AxWCGDf2oQeKRxZbSkDdCQ==
X-Envelope-To: tools@kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id e33e3eb86315d554;
	Sat, 15 Aug 2026 07:14:44 +0000
X-Migadu-Flow: FLOW_OUT
Date: Sat, 15 Aug 2026 15:14:38 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH b4] send: honor excluded addresses in per-patch Cc summary
Message-ID: <36067800fe19dba18dc4874edfae524346b4ed1d.1786777097.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260815071438.9YzZPtzz3ULiJUmonAF0hHp9rwNLdFBUsS5bf5g0Fmk@z>

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

