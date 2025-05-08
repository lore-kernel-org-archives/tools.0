Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88241F416C
	for <tools@linux.kernel.org>; Thu,  8 May 2025 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697514; cv=none; b=BnL0CtxCrq+qKu3xWKS5gh7p9EPaOW6Y0zaicoVwEE1Oscp/wtCsi5ox/shSqWEfXAafanXi1edJ0g5aglzO2aX8Jm2XQtgW+YlTRYKjgwG5bfnSRXcJIlmeSxCxue/br9GNMiOwE2KSlmbcL0dk+HoUmELgJllGfJ/ECWjdw9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697514; c=relaxed/simple;
	bh=JQ+wbTE6TlgCDh+3v40VzHurx+JXvtbmQjHqoayF9LE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HbkuDEWIpES+fJ8+uKJtZGRfbvGOxMxk83ZvC3LslM0qJb/QTIohveKw1YZbkeoc8FLr2aa4fp4QwIA2kkBh4hggUngyabRAuI4MVRXkVMBvYefb0KedSTPnoXg1O7LgN++GUYlXSFF/VI8j5uV0YoZVAmlcXE4+N5+lvbJV8WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wmmU3Nyr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wmmU3Nyr"
Received: by smtp.kernel.org (Postfix)
	id 70F52C4CEF0; Thu,  8 May 2025 09:45:13 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F934C4CEE7
	for <tools@kernel.org>; Thu,  8 May 2025 09:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F934C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0ac853894so648370f8f.3
        for <tools@kernel.org>; Thu, 08 May 2025 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746697509; x=1747302309; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQD3N6rpJTyLfEEg5CmanAF0BGjB5N3/hhON68EMqKc=;
        b=wmmU3Nyr2i4ziVVGllkc+KxdqDnHUq0cmTj7UKGAdAO5sz1u8UyWlYr7RSZoVkp9i5
         Dw71gqqlY4Oygau/JZESpWNKaf2aV3AB++7HzE0U0msRPoCgoYFTjpt7KAmnOexN6ILE
         v1jZfxFboDhSfbAxDiIiuOKfjyaulp0gz1xIaPJ0zyCUjZB3tjqvVvTMUPPrzMGU41WS
         9/7g6boXAaVR+5LFPWjbOD/OPB+aHJoQqQ2ht3DDXfuE2Oxb0vXwxXEgH9wDOlEJvvUO
         iC6hxSZg4gSi3g3gIanwXQP1FJzLlvEs+bTgyd8PhpEAfdnb6CkT6fGlLkqz/1k9xrub
         llog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697509; x=1747302309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQD3N6rpJTyLfEEg5CmanAF0BGjB5N3/hhON68EMqKc=;
        b=gEynZOlL79kTDFSYMxC1kjfck76n6P397QhJWMqYt/JnFxneC62zP5uaQF5fS836h4
         dDVknlJMejGlMOYg9Ou+EBwGu3tAw5pCJj2fVAmee/+TXwF2KjVkLK/9t76XoRySjq2E
         7rrmeCzgwen1HwMBAxFYriXZlEadNg5UyFQHlOjdjIcpOPIbAosSa3EiJMfbM/BHOuBh
         Pe3VomuaPicyecz+eysBsxLHMKvhPn1dQ6djhoJzSlcWWvv0Pjhb4A+r1aRgCchXKgMt
         IpjfXDMBWROqPpyH86spvApG4NoDjXaFDokbad67S4Y9RvCHhjIcq6mBMAE8k7eXd0wD
         QjXw==
X-Gm-Message-State: AOJu0YxKXq1xv/Iwxvegk6/YWF4HFy+ehX+P9Pw89dbEd2SqnjspTTS6
	4gyR2Jg86cHrMwB1tDIW6EqHK8kCwZEl4yrG4Mg/UIVSYakjFuMlvMLZQZWsH34=
X-Gm-Gg: ASbGnctdWAAg+90tmJ0nRDbJ5fjcMl8mBedBNxKm4ZV301emx6KSeTXnnNJzBbJbkvA
	SUJ6u1ssYUxFnZb0AjhAstG97uT+1jw9OMEk2OrXK4XAcvKj1/ylmM3CBoFtBY+wJeZKAWXV6kk
	Y+f7CNHI0f/Mgk1On9UCPMQJ3gUcLYUta4NL06MbPB2zL5WiYTyuUM2pFjNGGccO6QPvxccUakR
	suSQWDwCdr9d6ZxOInQgwANa7xNzoPKOakFcKFCzgkZb2z4AsFg+JT0AMQvOSAHTeGmUKtR9V+Y
	Kc3/4bQHdps82C46mw1UDl+f3nIFNuutGdzUf92J8FBs16d7tnekVGW1FU9mWfcZJCHMt3bdw0D
	JK47eeus/LDuLe+vnvA==
X-Google-Smtp-Source: AGHT+IGBALdrqTcRPyF+M3oVRBfScvvf0ZaK/sCDcK6HCJuesZow4uYCz3xi0fDqEhxAkRupbY9eeQ==
X-Received: by 2002:a05:6000:200d:b0:3a0:99e9:bc90 with SMTP id ffacd0b85a97d-3a0ba0955a2mr1772999f8f.10.1746697508808;
        Thu, 08 May 2025 02:45:08 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b9ec411csm2241663f8f.16.2025.05.08.02.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:45:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 0/3] Updates to wotmate, partly due to changed behaviour in gpg
Date: Thu,  8 May 2025 11:44:52 +0200
Message-ID: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=JQ+wbTE6TlgCDh+3v40VzHurx+JXvtbmQjHqoayF9LE=; b=owGbwMvMwMXY3/A7olbonx/jabUkhgyZWuHjy9nVOeu3e3wTumuplzhv7448xpKX023ipQLns C5mM7jRyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEzqaz/7M/dOzdW0lFD172 HrdW/66jXbtWrLINDjmY1c23Yv7WgBm1X+pqN7YbHP5zQJs5tHippW/sEsHeM/13LvQ8EW9kWG9 r99Iq4niI+nc/4Y8b6yIrl3zIzMrp3l/IV7+qhWeJTNfF6+FfuPZzlmxIumubpD9PcO40u+3L1q Y+z2Fzedv7e+cp804Rx7UbDm9Qm7ku/zzzkvlz/vO0Ch7+GiFV5iFz0XuC9+SwadK8lWrmwbv1D zEfVl1+kL/OQ7zB69KciN5fa99w6gooer3POC9g/WzFq9szYzmz+HydWpl+G84x26J9hitpjq70 nin9dbVh+8R1ahXsRf6+e32ivGfJrhT+HPVYYZ5b3WW9AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the first patch results in a text representation of the trust paths to
be written alongside the svg file. This has the upside that it is much
better reviewable compared to the svg file changes (that also depend on
the version of Image Magic actually installed). It's not a precondition
for the other patches in this series but it's still nice to have at the
start to make the effects of these other patches on the kernel-pgpkeys
repo more easily reviewable. This patch is a combination of changes by
Konstantin and me.

Looking in more detail at the last update from the keyservers commit in
the kernel-pgpkeys repo (commit 671a0c921fe0) gpg seems to have changed
how keys are exported as this commits adds quite a few old
self-signatures (or maybe that's a change on the keyservers that started
sending these? I didn't check.). These are not useful for the purpose of
the keyring, so in patch #3 export-keyring's default is changed to
"clean" keys which drops these duplicated self-signatures (and a few
more uninteresting things like duplicated subkey bindings).

Another change is that gpg stopped considering 3rd party signatures
based on SHA1.
So currently (as of 671a0c921fe0) there are 94 signatures by Linus
Torvalds tracked in the kernel-pgpkeys repo. 86 of them are based on
SHA1. That results in many keys loosing their trust path from Linus and
only two people are left who are trusted directly (i.e.

	17212997986C5765 Benson Leung <bleung@chromium.org>
	2DB3C3321B6DDF86 H. Peter Anvin (signature key) <hpa@zytor.com>

). Currently only keys with a valid trust path from Linus are considered
for addition and update. That is fine for public keys that should be
added to the keyring, but for keys that already passed the WoT check in
the past but lost all their trust paths, it's still sensible to be
updated. So patch #2 here weakens the WoT check to affect only new keys.

This patch series bases on current master +
https://lore.kernel.org/tools/20250411064226.1461929-2-u.kleine-koenig@baylibre.com/

<advertising>
For the upcoming Embedded Recipes https://embedded-recipes.org/2025/ I
will organize a PGP keysigning event together with Ahmad Fatoum. If you
go there, consider participating to strengthen the WoT again.

See https://embedded-recipes.org/2025/attend/#OpenPGP-keysigning for the
details.
</advertising>

Best regards
Uwe

Uwe Kleine-König (3):
  Put a representation of the trust path in a txt file
  export-keyring: Continue updating keys that lost all their trust paths
  export-keyring: Default to export "clean" public keys

 export-keyring.py | 156 +++++++++++++++++++++++++++++-----------------
 make-sqlitedb.py  |   5 ++
 2 files changed, 105 insertions(+), 56 deletions(-)

base-commit: f146a1815ad93b2f318e0a5fa857b11814a78b8b
prerequisite-patch-id: 4b7e0866c7adc0d84eef602013fbe0fcab86b9e6
-- 
2.47.2
