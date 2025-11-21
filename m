Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A062BE7DD
	for <tools@linux.kernel.org>; Fri, 21 Nov 2025 18:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749799; cv=none; b=BHsZuA/iSr2HaNlgdouaFs7hzwr4ELq/sP8pm6EQojY5H8PfOK9CXrbASmvLkmdrK5OlJ4dZa2kHy1jn1D+a/uilJrX/wkskBYZtNWQeChOxRuPy7r80uauUR1eGytyqxKywYr4NT8Ol5cBiPFHbXDVoTmGsswSzw8Sw+6M6lbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749799; c=relaxed/simple;
	bh=t7baw4eeSHx/ftlk5LzhC7hN7Kord0jcY3+7+Eeq95o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p8esmKYfy/rfapg4CXaMSem7zYfvaQGh1d1FK2Mrn5+LaxxUhsW5j2gnjZaF3IeZEFSsdnrRTtwnee/BRoKfKrIhaXlMnmIitstWA7XZPuDVGq62WYqDs/XiFur2Sv9QGmOEdPBs60BFe8pQSL1sG7Z9amXvqg1lh00vV3z4JPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZCzf/SU8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZCzf/SU8"
Received: by smtp.kernel.org (Postfix)
	id 04A5BC116C6; Fri, 21 Nov 2025 18:29:58 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0CC7C4CEF1
	for <tools@kernel.org>; Fri, 21 Nov 2025 18:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0CC7C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477632b0621so16403205e9.2
        for <tools@kernel.org>; Fri, 21 Nov 2025 10:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763749795; x=1764354595; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADEQec3C3B6aQqw1OqoA/yfrR9UbzIA3lW1o2zWknak=;
        b=ZCzf/SU80b00vv/JXlze8tId88UcBkr/oVAqJNv5juphmLyG5v/eMr/um0ovQq2Q2q
         1TQTmUywrTaOhmLH5HDPvOorCN3nQvl4U9Krdm1qUAenxh9k6aStkj3189iKvpZop8D+
         AocY+MJmf+jyBbnLZTQo+iEagbp4T2wSoUt0dqNSYwwSRazhBAxRphJ1qRQqIuO/u0Ec
         vbZfzlbwvMlAYoa3aiRvVwGkx/3ycS36v+inyuzrMp47V8JpJu50MDHa3PVVC2OaojV/
         8y8IF/HWzcQoKgW0rQ5Cd+ANECOh0CWF1KyL2SPM57ix0hFy+4i7+twBGUm+B8bQ1kkp
         KLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763749795; x=1764354595;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADEQec3C3B6aQqw1OqoA/yfrR9UbzIA3lW1o2zWknak=;
        b=ru98x4dJc0GrUH5h7DBxmndtFBwXuw27s2bKZ31wTflNZwZOAhyfOcbLATs3Nh323o
         xQ8dJbBS2a731lYXmCwTT4UJfoSz4Jf8EbeC6ILBEDuGMgTUqYK5RmdTNWMQlwhtQTS5
         OT/U41hD203bW70tpLwuEDsZmgnhqseMIh3HnLk99L6qKclvxbSTdlNPP0Pt8QUya98W
         nCvq3YWwxRI1yRHLIrtBbp0ihYHLhddxJ8gSAE04di/Y2xquCxbNAmQL924tJKcrjZap
         HPkTTu4Bqe1lMiBZ6IVcVWNcSQY/ZUfaZennxVy3edBCgQYY1IcseAyKA+a4FoxKf5lu
         bqvQ==
X-Gm-Message-State: AOJu0Yyyq7ZHSYm76y+J2H7wZBofAunNlc/5fyQmljlGwtKuwttT9J01
	Jf1JdrWoRAUKN0JcYWrQY0eaJJKLIGwagiX01sac0Fg9LX7KfulxDiHLFQoT2OLIzgA=
X-Gm-Gg: ASbGncvtfbIYp4Emzz/BZgq4ZxBqM9pC3d7Vhc8ayTld38j8Ctpg4o8fcuMpw3P70Ft
	itiJRRPOrIG7kQP1nA9mHv3SU22tZyl3YcqAHeXFyjFucYBkFMxLNKMVPWUuuonWhRnXZ5avuFk
	6tMyz3R4CgITM3UI8TszUmukkFpyK10Z5ut6O+4bdruR+10X2VRT4WEyOu2s/jouySvSSe0JbeH
	zKgmpVW6J2wAWki8RE8ZjL0UMKVatGcrLbX/lRdAMMFTTIXSmvaizSG3sI6DBEyx7Bk5VEXt8Pv
	zCJj9WooMeH+F3bRH0zHkSZTJxVQaeSp8KKHHqXSijR7pXpFYxwuaUy6gtH146qX9JJdrlY6rH3
	rKT0uky6KMLyycVzWnjq/HyoN5iClDCH/R2WWawQfssxU6y7Vq/tuIecVTM828oo+YE3TweKUEE
	KdfipcxQgWC86rdupFdE8b8jQpnPbvI2uDKrY=
X-Google-Smtp-Source: AGHT+IF+pQwGWDNFbZbZyyZP6XU1PSdRUVZpYH5LOwGC7kPPxjXbeU7mDUJxrh5OQw1NaeYAhAV6Cw==
X-Received: by 2002:a05:600c:1f0f:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-477c1131db6mr35113265e9.30.1763749794777;
        Fri, 21 Nov 2025 10:29:54 -0800 (PST)
Received: from [127.0.0.1] (99.36.160.45.gramnet.com.br. [45.160.36.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8d97sm11883069f8f.42.2025.11.21.10.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:29:54 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 21 Nov 2025 15:29:45 -0300
Subject: [PATCH b4 v2] prep --check: Add support to spellcheck if codespell
 is installed
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-check-codespell-v2-1-336192f1997c@suse.com>
X-B4-Tracking: v=1; b=H4sIAJivIGkC/3WNwQ6CMBBEf4Xs2Zq2VgRO/ofhULaLNCIlXW00h
 H+36d3jm8m82YApemLoqg0iJc8+LBn0oQKc7HIn4V1m0FKflZIXgRPhQ2BwxCvNs6gbrbS1Y9N
 IgrxaI43+U4w3GAz0OZs8v0L8lpOkSvPXl5RQAi261tXtYE7mym+mI4Yn9Pu+/wC4RW0esQAAA
 A==
X-Change-ID: 20251107-check-codespell-68212aaf880e
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763749793; l=1811;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=t7baw4eeSHx/ftlk5LzhC7hN7Kord0jcY3+7+Eeq95o=;
 b=vML7wpp10D7AycJAllSqq+KShw98nzvsmtTOhPB7xz2bbUln6u5ZgqhRDtCi4e5MIgW8sx+OG
 4txdItFpqnPDjvxkgdWXDnxX9c/ENehnnPTm8sxw62T9crtl/ocD8fM
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

This commit adds --codespell to checkpatch.pl is the codespell package is
installed.

If b4 is installed with pipx you need to use --system-site-packages when
calling install, otherwise it won't see the packages installed by your
package manager.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
@mricon this new feature was added since I forgot to run checkpatch.pl
--codespell when sending the patch to the ML. I believed that b4 would
do such check, but I was mistaken. What do you think about it?
---
Changes in v2:
- Fixed typos in the commit message
---
 src/b4/ez.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 57bc1ca..1c70f7f 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -43,6 +43,12 @@ try:
 except ModuleNotFoundError:
     can_gfr = False
 
+try:
+    import codespell_lib
+    can_codespell = True
+except ModuleNotFoundError:
+    can_codespell = False
+
 logger = b4.logger
 
 MAGIC_MARKER = '--- b4-submit-tracking ---'
@@ -1809,7 +1815,8 @@ def get_check_cmds() -> Tuple[List[str], List[str]]:
         if topdir:
             checkpatch = os.path.join(topdir, 'scripts', 'checkpatch.pl')
             if os.access(checkpatch, os.X_OK):
-                ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile']
+                spell = "--codespell" if can_codespell else ""
+                ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile {spell}']
 
     # TODO: support for a whole-series check command, (pytest, etc)
     return ppcmds, scmds

---
base-commit: 509f56ff5c24e2ad48cd2621e54c67910ea19fc1
change-id: 20251107-check-codespell-68212aaf880e

Best regards,
--  
Marcos Paulo de Souza <mpdesouza@suse.com>

