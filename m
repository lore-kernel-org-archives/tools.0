Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634822;
	b=LmEmcVrNjOYfiLQIvJ++ZGJyDvmQ9wbnKoqqM9ZeZcUxaHf6ZsGvSW+1WJn5KdkppCkE
	 JypVbqrziHaX3WHC9zIs5okw8Xp/gGVwStvfGqgm4gI+TYmUk+mkoZAPQJQ0amvo27DRy
	 LrlZWtaCxS2h1drdS+T2LwoYOz76HnYBjWo2CmRziNs+gqkJ7onGyIZU+k+C34EMo90Q7
	 FfdLoTi0gFjdUCy5BmSCHlYD93znJ3BxquRcbEZPjFHEQXbPtjnJj/8BM+YUtp0fZjz5Z
	 VKMNNxPLW7qaqJF8T3qFSoh8VHcjAmDNgXSxircm+j/D5rcw1I9LAvhM1sIxw4LIc1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634822;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=R2dmgB3GpEIDkjH8+9mFX7eviPrRqr5B7yzcvI17MiQ=;
	b=LUavUXAGIwdHewauHgtc3P/uvGYCYTtFvmi+E20cHcaDzukqEM78k8UoqcwGJItWBx78
	 ph7cBPoh+aChpt/GYnh0m8MnrLKcI+U/LcxH0DDwLJAtmExcoVGBhOd1wo7r6TZ5PjR2a
	 a8hH/GCe5EzXGVpOkqLD56mxjgtih/4zquhtT/si0WazPXvRIMhB1x4FyjoDVf0flWdWQ
	 xwGUhP/55gkZO0MgjArNt9TxZjIAByrO1HE2fR8rhaLWAa+Hut48uyOfXCvt8rPPu1121
	 7/7JZD+Xxme1GPiy3RyJLhxtT3l3l9dfUyLgVZiEuI8FE1UCvJvcFuPe/+VMYMFZ/MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TzJhpUj7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FD86093D14
	for <tools@linux.kernel.org>; Mon,  2 Nov 2026 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TzJhpUj7
Received: by smtp.kernel.org (Postfix)
	id 17C661F00A1C; Mon,  2 Nov 2026 15:53:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793634822;
	b=3p9b2c6EZqV7y5NJ4eOPlF2ZIZopBl0vO9bUWoraIih6YU/sQFmQSxiU/xs+IhyY8gnN
	 xHEqz+vS6TpoZfVxj+nBNPe6y+utN2KBqRqjuBp1f0Lbzwb7n2DSf98EXe4tLL22IWesk
	 MEoSK6HWxhJfi0ZdU1jJ3TShPFz1viwfw760dd5l6STA40TMlXpR9CeiFk5sJG5EnoMpK
	 7EeLEu1PaJZ8iAEXO212cwCv2R+4s5TQXdZRiyfU66680xUJBoGkONfIqbT0dG/sdZCyI
	 jvYE5dkfPNhalyjy2g3rQwl2/csC/zk/uEk4HB0Q5f6okDTA8YNeup54zrp516D8+vg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793634822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=R2dmgB3GpEIDkjH8+9mFX7eviPrRqr5B7yzcvI17MiQ=;
	b=1fz5mKwrcNW+KhKhmW6Q1t3iy8iod/2eUMZxZ66TuVVXZMVGkXVjT2xGwQPtlBc1tDVz
	 omLTIRWhz4GqQtekLBxqW+uB847biS9t6zBUusTIQyRlbiTTlleVxC3DXm7lYzB1qo7Fs
	 Q5Bli8dm6rmeJQYKyTtWKIQfS9d1Qe2uCO+8ripphXKypJwOnLZf4cxQ3Kv8v6aQDWuHi
	 nYwPEY/8JyPo6B5cNsoE9KTTSqQ8Y5p//Zszcp0uYo/mJE6UCrZSA72ddZ7QUT6j/F+fR
	 v7452yJvpx3TObHHMaW66wScsD9Dc9ebtBjlgoUdelygyBwlyGILPTc3JUBaH0lITuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TzJhpUj7;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B54081F00A18
	for <tools@kernel.org>; Mon,  2 Nov 2026 15:53:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TzJhpUj7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B54081F00A18
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e4831c028so2832074f8f.0
        for <tools@kernel.org>; Mon, 02 Nov 2026 07:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793634811; x=1794239611; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2dmgB3GpEIDkjH8+9mFX7eviPrRqr5B7yzcvI17MiQ=;
        b=TzJhpUj7EwwpdCwhLTJ8HaQ+wQKqrOWxXP5Re+wFXOBFE/eYzsai1paQuZ2KS6WS7y
         +IF69a4P6BCBctlaJ6/UlkewdtEd3cRfPFDE+HN9bBIfTCwivQaL5+ZPtTPCFDSKu48d
         x7NESXUmHPPYSHWn5CmngQ0/82kfMv/daxayY7Nn2RO32Ytx6UecRW6TUfpH8RKIvBzc
         4zVAN3j66WDoDbYlkV1aDQPD7Ari2K8CBdn+PhtncafTCrd1MTbhsgSh3SPHaYfXrCop
         SSLWGUQuiunAyupKJtmGLpk9gGVrqC79UmlRUMPwme8qljqcU+e91AVK9kPLLUfeIETv
         P+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634811; x=1794239611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R2dmgB3GpEIDkjH8+9mFX7eviPrRqr5B7yzcvI17MiQ=;
        b=LQxoLzK+8t73gqKfZfXctAW+R3GLOBT3SrpCm7pvkNc6TGL3A8EUrDJVYGukSV0VTj
         WPqTYgN8RN6ujGDv3XDBdy8/GzISvGlt5UszKPxCSjS36TuRz/kjgDWw2dFcsnnDjimF
         Z0ubEz+bog+hrO5Kgt7c3szSBO2nwMJHpL8K9mnbgnuPGFiHEcnluTicY8e/MB54ACSY
         nuhUQDXTVC6YAB38thNUhVfsdlOJw24tXnL2z8TmzimHHPXhin2bj0m1M30ITrPP+t5u
         5kZwQDQgpqilzAiEIpHQ6MvF00k0wtBbS1lS7GX51fLb/EP6UFuQN/tO+wTVha7eC7EL
         I1JA==
X-Gm-Message-State: APuU4Z/96j6aS37+wBmpO/LKSlwhDXNoiqzIygM9AjhNtAEiYBxXdGHQ
	UuCiHYQPGWWuLN3KsvCoG7fJcVq85ayBq126Aq/+1Ozi32/r7IjsEaVSrDnhEJA7lmwBK2gls0P
	hCm1MaAE=
X-Gm-Gg: AYBFou0y/X8fJa/AnjWVv31pQcBPm1wpMhyHBgQA5DVWyUvYJu1XL0Kt6NgpawznqCJ
	xZ0+jR5aYE5alHSEDcgIi1KdjZoyPC/zQraSQuP3/tq6/IPtiz51+8L4/RnTdi8xMF5YtehWV5P
	Obb0IaUeD6t2RAES9kcdMpmumSefRa+IgIh+aNi8U3h5cu8oYqWyKer0flQcqHM7ASSZgnBBtYJ
	nHW6I5qE1ECSNHmfaS/xTRBUsuEFUfm4M+pklK0xK4u/c6QfuHSdW3xslDAcRtI/rtTpXbbhCLK
	EF0As+mjOaso5IDtDGpRIFfwRtTV6iLew81b8KqKbmtSeJroPHxYi5VbtczviEOoSziBHwNzLa4
	b1TdXRoidwfOjNJqKyOj2uLpoyPi4V3eLJ6JUG4j57zA61CVk1rAvn/ku/ef3erWhORLzN6BLwG
	hcLXlnaVTWCbcdcRcRg4VBjM+v1A9KWd5CyeYEj6wb04o+cviwoxHXZ6kVuhR/S2dIYh8LPO/+6
	HWQeFJDgk9SDxtq0EHjxJcMrp5iOh777qXo6n8bZUgu7WG5lF1yRfJ0DWZE6C5SxU/drHzcmQfY
	Y2hRKaagp1X5tzbqXXLIqw6w8tEWr2QaLj7uBrNvmxVAgEjn1aVJVWFMGdxIDSrNtDfdjTDfjeh
	pe/olzWva9EF+bQMJ+hWFqPAz0uHdXtPlE+bm6HU=
X-Received: by 2002:adf:e010:0:20b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48e8890c6d0mr1715825f8f.39.1793634810987;
        Mon, 02 Nov 2026 07:53:30 -0800 (PST)
Received: from localhost (p200300f65f19a904293c83a06545501e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:293c:83a0:6545:501e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e71ba2415sm21238443f8f.50.2026.11.02.07.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:30 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@kernel.org
Subject: [PATCH pgpkeys] Revert "korg-update-pgpkeys: keep SHA-1 certifications when importing a key"
Date: Mon,  2 Nov 2026 16:53:26 +0100
Message-ID: <20261102155325.377311-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=sTOpvjfeIiR8o0gehT8f/axEjiXNlKONgvIOV0r3FO4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq6LH10XlscN2lmn2CWOEPffNds1cJepO31Qvd7 AWfU7TamIyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauix9QAKCRCPgPtYfRL+ Tp8kCACbE9rxsGIAoh93BR16nRmUI+EPeZ/ZB2Ebf5TEiZgT+GDoBF1kruerDLIKx5eIHvPBK1x VEyRl6rd9rF5mdAuusAnBms1XmFADlNf0D5/m4a5Q+/x+4dmjkSH+2b5Jytkyu9ueLBj3ar2SCp pG9OhGZengkUVDMm56/NEXaJr1aLuNiL7p5Knas5rOKPTJGixzsCtcFQ82MBa0iju2UVo/5O5wx I0Hi3ZfuG09trxwGUdkMMaPTVB7J9f1DCcs8xyRKl88srGlCtAiu9SLCDQqsCY1fCPQF9c5z+DO /T8rrbmUGDSZ9hIoLtPCy8v8Lj7VREWHuz6kM2eYMps6dmIs
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Importing with `--allow-weak-key-signatures` doesn't only keep the weak
signatures that were already present but also imports new weak ones. See
e.g. commit 4711d3757f97 ("Add E354E6B8E238B9F8 (Janosch Frank)") which
added two SHA-1 signatures.

To get rid of SHA-1 signatures in the long run, discarding weak
signatures when a certificate changed is a good thing, so restore the
original behaviour.

Reminder: NIST recommends to migrate all SHA-1 usage to to safer
alternatives
(https://www.nist.gov/news-events/news/2022/12/nist-retires-sha-1-cryptographic-algorithm)
after it was deprecated in 2011. Collision attacks for SHA-1 are known
since 2017 (https://www.marc-stevens.nl/research/shattered.io/).

This reverts commit 197f700ffbe9f2c406eaa4184dd216c7cde18af0.
---
 scripts/korg-update-pgpkeys | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/korg-update-pgpkeys b/scripts/korg-update-pgpkeys
index cb54930d4636..49b74a21ca0c 100755
--- a/scripts/korg-update-pgpkeys
+++ b/scripts/korg-update-pgpkeys
@@ -64,9 +64,7 @@ if [[ $1 == '--refresh' ]]; then
     $GPG --keyserver $KEYSERVER "$@"
 elif [[ $1 != '--regenerate' ]]; then
     echo "Importing the new key"
-    # Without the weak flag, import-clean drops SHA-1 certifications from
-    # the merged key, and with them trust paths the exports below keep.
-    $GPG --allow-weak-key-signatures --import --import-options import-clean <<< "$NEWKEYS"
+    $GPG --import --import-options import-clean <<< "$NEWKEYS"
 fi
 
 # A half-finished export looks like a normal set of changes to review,

base-commit: 2dcaf297bde80dcf2c71508737243c8a8204674b
-- 
2.56.0.rc1

