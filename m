Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E213F88B9
	for <tools@linux.kernel.org>; Sat, 15 Aug 2026 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786777228; cv=pass; b=hYhjmC+/gxfKSo3/xWFGK/RNlDDAUeF5zSnnix7eVIYxbsUzb4ixJdL0/qOjBbjJVs7v9aCDogRprmkvjRNCDjcxa0oYbo+jQHBajGnoZiU/l3Yo9D6GPkH1VlwvKmvkgay6y6DTM6TijRnLusie7hextMpF96M49FnMoUSZmZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786777228; c=relaxed/simple;
	bh=Ettouu41544xanEl70Ol36vWBCwBm35kr0VaENjlNdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MwAriHqdM1m2bWBX0fR/5mVRX/vQMKxt9Qak5w/89quSvs8lEL5zQheRJxvGEYH/MVSRogUTcxoV9Nh14NIXIXctM/xEBjz0l279/ROwjD8MFBxswcvkRMlMoINbxRae0UHh4CPioeyCYLhQT2xSnSIklLo8JM93J7NvxyeUE+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=GVkTo3O/; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="GVkTo3O/"
Received: by smtp.kernel.org (Postfix)
	id C96151F00A3A; Sat, 15 Aug 2026 07:00:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.100
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786777221;
	b=JB7CWWiAk/UHH3xw3i/BNwMT9rUI6ACvWWBjBF1aeD/1NpYXqYneLvtsWn/H6Jt43vh1
	 5JswIPdEKYb5P18yMqJZSN+DxxOYLaW6it7gIjjTp4HMPZzXfC+Ine2fyYUT1CTr9WtAQ
	 x1XgPrZDNsKvug8VqRqzdvtHAHAzZaJUV64mKFfCESyxQt46xWHVlEhWAgycuY8aoVODo
	 +wPi6sS1ZnzbUJsCPNv5oS2sIVNjm7BAw6oTsE96my6W1d4ynyf/QxQbliyxhBP5UE1t5
	 GFutEWulMVfpOLB+DyOHA4zMemAFsDK6uQP9w/cslW8kMSLi1h84BfBpwpiAGP0zETg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786777221;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=tPpMzOdnabh92CZb//7qBUD2S2Eq0dpISXjYHviI/8g=;
	b=pfccFrck+sZ+gipKSuZMCjLftDza6JeOnGMdJVpuoedo/ESraiRukYlrAHojcFL/Rx5W
	 hoauXxscX4lmGg9fYAk/8o0Qqr+Bz/jOmfsyPO08b+WdX89W0+UxwfIPfo7lW/STSIbgw
	 zGo4eg0F+LAa0BSLysH7SiY3wGpAcRlT51OkRgydOWSIKw3bzWBT1bQEXialG92Kal7O3
	 auzVdrzablEfBf3ggWx1BH2TemGYj4D1bm2+pUE9wVPQnCILIuPLq9R6rz8zw9ThESe07
	 rYsA17mjecQgX+0+hmQFuUeGNM+5Jte1/AGdoJD5WpFvFXO71nuKMum5Yxp6A0Qft6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="GVkTo3O/";
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.100
Received: from mta1.migadu.com (out-100.mta1.migadu.com [95.215.58.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32DAF1F000E9
	for <tools@kernel.org>; Sat, 15 Aug 2026 07:00:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=GVkTo3O/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 32DAF1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ettouu41544xanEl70Ol36vWBCwBm35kr0VaENjlNdQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786777217; v=1; x=1787382017;
 b=GVkTo3O/8eGaENE9Hdy7johzue/tcpJB3BsEeAL78JEkIQW+62D/nLXSyBn3kcMOjMNMnlvm
 aYPbyxl0JjwgO3nZBeUDnhII1G29PvC+qToyOoPl2i+C3CAgr/vmo0Q+jVA6Q1bWoDHmOu7wbqE
 9Cy6c5ONSFYn+KcblBi057YEcuwFQLVHppyRmjsYxFdB+9rB5aJweQsA/ZIUzxytFTy1t9KFl4G
 u0p0rlzkh+dL9ZOfOqXyw5KzBHhQdHpH/KHyU/rgW/tAJgyCbM1Qi/FZeQZfSfC4mpGGuXfH6pM
 DXCm7ZDIV7oUhwXvZ24xoS5YWIy6jWj6cE+r4LlJQfOyg==
X-Envelope-To: tools@kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 8033a9466581c360;
	Sat, 15 Aug 2026 07:00:07 +0000
X-Migadu-Flow: FLOW_OUT
Date: Sat, 15 Aug 2026 14:59:58 +0800
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

